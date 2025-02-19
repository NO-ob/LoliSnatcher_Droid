package com.noaisu.loliSnatcher

import android.annotation.SuppressLint
import android.app.Activity
import android.content.ContentResolver
import android.content.ContentValues
import android.content.Intent
import android.content.pm.PackageManager
import android.content.pm.ResolveInfo
import android.graphics.Bitmap
import android.media.MediaMetadataRetriever
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.os.Environment
import android.provider.MediaStore
import android.util.Log
import android.view.KeyEvent
import android.view.WindowManager
import android.webkit.MimeTypeMap
import androidx.annotation.RequiresApi
import androidx.core.content.FileProvider
import androidx.documentfile.provider.DocumentFile
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import java.io.*
import java.net.Inet4Address
import java.net.NetworkInterface
import java.util.*
import java.util.concurrent.Executors

// TODO currently shelved the idea of lock screen, needs more testing, possibly will lead to bugs, because fragment is not considered as good practice
// For local_auth:
// import io.flutter.embedding.android.FlutterFragmentActivity
// class MainActivity: FlutterFragmentActivity() {
// replace all "context" with "applicationContext" and "activity" with "this"

class MainActivity: FlutterFragmentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            // https://stackoverflow.com/questions/49190381/fullscreen-app-with-displaycutout
            window.attributes.layoutInDisplayCutoutMode = WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES
        }
    }

    private val SERVICES_CHANNEL = "com.noaisu.loliSnatcher/services"
    private val VOLUME_CHANNEL = "com.noaisu.loliSnatcher/volume"
    private var volumeSink: EventChannel.EventSink? = null
    private var isSinkingVolume: Boolean = false
    private var SAFUri: String? = ""
    private var methodResult: MethodChannel.Result? = null

    private val activeFiles = mutableMapOf<Uri, OutputStream?>()

    @SuppressLint("WrongThread")
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, SERVICES_CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "getExtPath") {
                val path = getExtDir()
                result.success(path)
            } else if (call.method == "shareText") {
                val text: String? = call.argument("text")
                val title: String? = call.argument("title")
                val shareTextIntent = Intent.createChooser(Intent().apply {
                    action = Intent.ACTION_SEND
                    putExtra(Intent.EXTRA_TEXT, text)
                    // putExtra(Intent.EXTRA_TITLE, title)
                    type = "text/plain"
                }, null)
                startActivity(shareTextIntent)
                result.success(true)
            } else if (call.method == "shareFile") {
                val path: String? = call.argument("path")
                val contentUri = FileProvider.getUriForFile(applicationContext, BuildConfig.APPLICATION_ID + ".fileprovider", File(path))

                val shareFileIntent = Intent.createChooser(Intent().apply {
                    action = Intent.ACTION_SEND
                    type = call.argument("mimeType")

                    // putExtra(Intent.EXTRA_TITLE, "Test")
                    // data = contentUri
                    putExtra(Intent.EXTRA_STREAM, contentUri)
                    flags = Intent.FLAG_GRANT_READ_URI_PERMISSION
                }, null)

                // Grant read/write permission to chooser
                val resInfoList: List<ResolveInfo> = applicationContext.packageManager.queryIntentActivities(shareFileIntent, PackageManager.MATCH_DEFAULT_ONLY)
                for (resolveInfo in resInfoList) {
                    val packageName = resolveInfo.activityInfo.packageName
                    applicationContext.grantUriPermission(packageName, contentUri, Intent.FLAG_GRANT_WRITE_URI_PERMISSION or Intent.FLAG_GRANT_READ_URI_PERMISSION)
                }
                startActivity(shareFileIntent)
                result.success(true)
            } else if (call.method == "emptyCache") {
                val dir: File = applicationContext.cacheDir
                dir.deleteRecursively()
            } else if (call.method == "getPicturesPath"){
                result.success(Environment.getExternalStoragePublicDirectory(
                        Environment.DIRECTORY_PICTURES).absolutePath)
            } else if (call.method == "getCachePath"){
                result.success(applicationContext.cacheDir.absolutePath)
            } else if (call.method == "getSdkVersion"){
                result.success(Build.VERSION.SDK_INT)
            } else if (call.method == "writeImage"){
                val imageBytes = call.argument<ByteArray>("imageData")
                val fileName = call.argument<String>("fileName")
                val mediaType = call.argument<String>("mediaType")
                val fileExt = call.argument<String>("fileExt")
                val extPathOverride = call.argument<String?>("extPathOverride")
                if (imageBytes!= null && mediaType != null && fileExt != null && fileName != null){
                    writeImage(imageBytes,fileName,mediaType,fileExt,extPathOverride)
                    result.success(fileName)
                } else {
                    result.success(null)
                }

            } else if(call.method == "setVolumeButtons") {
                val state: Boolean? = call.argument("setActive")
                isSinkingVolume = !state!!
            } else if (call.method == "disableSleep"){
                window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
            } else if (call.method == "enableSleep"){
                window.clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
            } else if (call.method == "makeVidThumb"){
                val videoURL = call.argument<String>("videoURL")
                val retriever = MediaMetadataRetriever()
                retriever.setDataSource(videoURL, HashMap())
                val image = retriever.getFrameAtTime(2000000, MediaMetadataRetriever.OPTION_CLOSEST_SYNC)
                val stream = ByteArrayOutputStream()
                image?.compress(Bitmap.CompressFormat.PNG, 100, stream)
                val byteArray = stream.toByteArray()
                image?.recycle()
                result.success(byteArray)
            } else if(call.method == "getIP"){
               result.success(getIpv4HostAddress())
            } else if (call.method == "setExtPath"){
                methodResult = result
                getDirAccess()
            }  else if (call.method == "getTempDirAccess"){
                methodResult = result
                getTempDirAccess()
            } else if (call.method == "selectImage"){
                methodResult = result
                getImageAccess()
            } else if (call.method == "getFileBytes"){
                val uri: String? = call.argument("uri")
                result.success(uri?.let { getFileBytesFromUri(it) })
            } else if (call.method == "getFileExtension"){
                val uri: String? = call.argument("uri")
                result.success(uri?.let { getFileExt(it)})
            } else if (call.method == "getFileByName"){
                val uri: String? = call.argument("uri")
                val fileName: String? = call.argument("fileName")
                if (fileName != null && uri != null) {
                    result.success(getFileByName(uri,fileName))
                }
            } else if (call.method == "existsFileByName"){
                val uri: String? = call.argument("uri")
                val fileName: String? = call.argument("fileName")
                if (fileName != null && uri != null) {
                    Executors.newSingleThreadExecutor().execute {
                        val exists = existsByName(uri,fileName)
                        result.success(exists)
                    }
                }
            } else if (call.method == "deleteFileByName"){
                val uri: String? = call.argument("uri")
                val fileName: String? = call.argument("fileName")
                if (fileName != null && uri != null) {
                    result.success(removeByName(uri,fileName))
                }
            } else if(call.method == "createFileStream"){
                val fileName = call.argument<String>("fileName")
                val mediaType = call.argument<String>("mediaType")
                val fileExt = call.argument<String>("fileExt")
                val savePath = call.argument<String?>("savePath")
                if (mediaType != null && fileExt != null && fileName != null && savePath != null){
                    result.success(createSafFile(fileName,mediaType,fileExt,savePath)?.toString())
                } else {
                    result.success(null)
                }
            } else if(call.method == "writeFileStream"){
                val uri = call.argument<String>("uri")
                val bytes = call.argument<ByteArray>("data")
                if (uri != null && bytes != null){
                    result.success(writeSafFileStream(bytes,uri))
                } else {
                    result.success(null)
                }
            } else if(call.method == "closeStreamToFile"){
                val uri = call.argument<String>("uri")
                if (uri != null){
                    result.success(closeSafFileStream(uri))
                } else {
                    result.success(null)
                }
            } else if(call.method == "deleteStreamToFile"){
                val uri = call.argument<String>("uri")
                if (uri != null){
                    result.success(deleteSafFile(uri))
                } else {
                    result.success(null)
                }
            } else if(call.method == "existsStreamToFile"){
                val uri = call.argument<String>("uri")
                if (uri != null){
                    result.success(existsSafFile(uri))
                } else {
                    result.success(null)
                }
            } else if(call.method == "copySafFileToDir"){
                val uri = call.argument<String>("uri")
                val fileName = call.argument<String>("fileName")
                val targetPath = call.argument<String>("targetPath")
                if (uri != null && fileName != null && targetPath != null){
                    Executors.newSingleThreadExecutor().execute {
                        val success = copySafFileToDir(uri,fileName,targetPath)
                        result.success(success)
                    }
                } else {
                    result.success(false)
                }
            } else if(call.method == "copyFileToSafDir") {
                val sourcePath = call.argument<String>("sourcePath")
                val fileName = call.argument<String>("fileName")
                val uri = call.argument<String>("uri")
                val mime = call.argument<String>("mime")
                if (sourcePath != null && fileName != null && uri != null && mime != null) {
                    Executors.newSingleThreadExecutor().execute {
                        val success = copyFileToSafDir(sourcePath,fileName,uri,mime)
                        result.success(success)
                    }
                } else {
                    result.success(false)
                }
            } else if (call.method == "testSAF"){
                val uri: String? = call.argument("uri")
                val permissions =
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
                            this.contentResolver.persistedUriPermissions.takeWhile { it.isReadPermission && it.isWritePermission }
                        } else {
                            TODO("VERSION.SDK_INT < KITKAT")
                        }

                if (permissions.isEmpty()) {
                    getDirAccess()
                } else {
                    val cr = this.contentResolver
                    val docFile: DocumentFile? = DocumentFile.fromTreeUri(applicationContext, Uri.parse(uri))
                    val newFile = docFile?.createFile("text/*","testpersist")
                    try {
                        val output = "test writing"
                        val stream = newFile?.uri?.let { cr.openOutputStream(it) }
                        stream?.write(output.toByteArray())
                        stream?.close()
                    } catch (e: IOException){
                        e.stackTrace
                    }
                }
                val parentUri =
                        permissions
                                .first().uri

                //result.success(permissions.last().uri.toString())
                val tag = "loSnService"
                Log.i(tag, contentResolver.persistedUriPermissions.toString())
                Log.i(tag, parentUri.toString())
                Log.i(tag, permissions.toString())


            } else if(call.method == "openLinkDefaults"){
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                    try {
                        val intent = Intent().apply {
                            action =
                                android.provider.Settings.ACTION_APP_OPEN_BY_DEFAULT_SETTINGS
                            addCategory(Intent.CATEGORY_DEFAULT)
                            data = Uri.parse("package:${packageName}")
                            addFlags(Intent.FLAG_ACTIVITY_NO_HISTORY)
                            addFlags(Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS)
                        }
                        this.startActivity(intent)
                    } catch (ignored:Throwable) {
                    }
                }
            } else if(call.method == "restartApp"){
                restartApp()
                result.success("ok")
            }
        }

        EventChannel(flutterEngine.dartExecutor, VOLUME_CHANNEL).setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, eventSink: EventChannel.EventSink?) {
                volumeSink = eventSink
            }

            override fun onCancel(arguments: Any?) {
            }
        })
    }
    //Doesn't work and idk why, it should get a uri after selecting a directory but doesn't
    //https://developer.android.com/training/data-storage/shared/documents-files#perform-operations
    private fun getDirAccess() {
        val intent = Intent(Intent.ACTION_OPEN_DOCUMENT_TREE)
        intent.putExtra("pickerMode","directory")
        intent.flags = Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION or Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_GRANT_WRITE_URI_PERMISSION
        startActivityForResult(intent, 1)
            //return intent.data.toString();
    }

    private fun getTempDirAccess() {
        val intent = Intent(Intent.ACTION_OPEN_DOCUMENT_TREE)
        intent.putExtra("pickerMode","directory")
        intent.flags = Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_GRANT_WRITE_URI_PERMISSION
        startActivityForResult(intent, 1)
    }

    private fun getImageAccess() {
        val intent = Intent(Intent.ACTION_OPEN_DOCUMENT)
        val mimeTypes = arrayOf("image/png", "image/jpeg","image/jpg","image/gif")
        intent.type = "*/*"
        intent.putExtra("pickerMode","image")
        intent.putExtra(Intent.EXTRA_MIME_TYPES, mimeTypes)
        intent.flags = Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION or Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_GRANT_WRITE_URI_PERMISSION
        startActivityForResult(intent, 1)
    }

    @RequiresApi(Build.VERSION_CODES.KITKAT)
    override fun onActivityResult(requestCode: Int, resultCode: Int, resultData: Intent?)
    {
        super.onActivityResult(requestCode, resultCode, resultData)

        if (resultCode == Activity.RESULT_OK && resultData != null) {
            resultData.data?.also { uri ->
               //println(uri)
                SAFUri = uri.toString()
                intent.data = uri
                println("got uri as $uri")
                this.contentResolver.takePersistableUriPermission(intent.data!!,Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_GRANT_WRITE_URI_PERMISSION)
               val mode = intent.getStringExtra("pickerMode")
                if (mode == "image"){
                    methodResult?.success(uri.toString())
                } else {
                    methodResult?.success(uri.toString())
                }

            }

            //println("got storage uri as ${resultData.data as Uri}")
        }
    }

    private fun getFileBytesFromUri(uriString: String): ByteArray?{
        val uri: Uri = Uri.parse(uriString)
        if (uri != Uri.EMPTY) {
            println()
            val inputStream: InputStream? = contentResolver.openInputStream(uri)
            return inputStream?.readBytes()
        }
        return null
    }

    private fun getFileExt(uriString: String): String {
        val uri: Uri = Uri.parse(uriString)
        val fileExt: String? = if (ContentResolver.SCHEME_CONTENT == uri.scheme) {
            val cr: ContentResolver = applicationContext.contentResolver
            cr.getType(uri)?.split("/")?.get(1)
        } else {
            MimeTypeMap.getFileExtensionFromUrl(uri.toString())
        }
        return fileExt ?: ""
    }


    private fun getFileByName(uriString: String,fileName: String): ByteArray?{
        val uri: Uri = Uri.parse(uriString)
        val documentTree = DocumentFile.fromTreeUri(applicationContext, uri)
        if (documentTree != null) {
            val file = documentTree.findFile(fileName)
            if (file != null) {
                val inputStream: InputStream? = contentResolver.openInputStream(file.uri)
                return inputStream?.readBytes()
            }
        }
        return null
    }

    private fun existsByName(uriString: String, fileName: String): Boolean{
        val uri: Uri = Uri.parse(uriString)
        val documentTree = DocumentFile.fromTreeUri(applicationContext, uri)
        if (documentTree != null) {
            val fileExists = documentTree.findFile(fileName) != null
            return fileExists
        }
        return false
    }

    private fun removeByName(uriString: String, fileName: String): Boolean{
        val uri: Uri = Uri.parse(uriString)
        val documentTree = DocumentFile.fromTreeUri(applicationContext, uri)
        if (documentTree != null) {
            val file = documentTree.findFile(fileName)
            if (file != null) {
                return file.delete()
            }
        }
        return false
    }

    private fun restartApp() {
        applicationContext.startActivity(
            Intent.makeRestartActivityTask(
                (applicationContext.packageManager.getLaunchIntentForPackage(
                    applicationContext.packageName
                ))!!.component
            )
        )
        Runtime.getRuntime().exit(0)
    }

    override fun onKeyDown(keyCode: Int, event: KeyEvent?): Boolean {
        if ((keyCode == KeyEvent.KEYCODE_VOLUME_DOWN || keyCode == KeyEvent.KEYCODE_VOLUME_UP) && isSinkingVolume)
        {
            volumeSink?.success(if (keyCode == KeyEvent.KEYCODE_VOLUME_DOWN) "down" else "up")
            return true
        }

        return super.onKeyDown(keyCode, event)
    }

    private fun getIpv4HostAddress(): String {
        NetworkInterface.getNetworkInterfaces()?.toList()?.map { networkInterface ->
            networkInterface.inetAddresses?.toList()?.find {
                !it.isLoopbackAddress && it is Inet4Address
            }?.let { return it.hostAddress ?: "" }
        }
        return ""
    }

    private fun getExtDir(): String {
        if (Build.VERSION.SDK_INT <= Build.VERSION_CODES.Q) {
            return Environment.getExternalStorageDirectory().absolutePath
        } else {
            return applicationContext.dataDir.absolutePath
        }

    }

    @Throws(IOException::class)
    private fun createSafFile(fileName: String, mediaType: String, fileExt: String, savePath: String?): Uri? {
        var thisMediaType: String = mediaType

        if (thisMediaType == "animation"){
            thisMediaType = "image"
        }
        if (!savePath.isNullOrEmpty()){
            val doc = DocumentFile.fromTreeUri(applicationContext, Uri.parse(savePath))
            if (doc != null) {
                if (doc.canWrite()){
                    val uri = doc.createFile("$thisMediaType/$fileExt","$fileName.$fileExt")?.uri
                    uri?.let {
                        activeFiles.put(uri, contentResolver.openOutputStream(it))
                    }
                    return uri
                }
            }
        }
        return null
    }

    @Throws(IOException::class)
    private fun deleteSafFile(uriString: String): Boolean {
        val uri: Uri = Uri.parse(uriString)
        if (uri != Uri.EMPTY) {
            val document = DocumentFile.fromSingleUri(applicationContext, uri)
            if (document != null && document.exists()) {
                document.delete()
                Objects.requireNonNull(activeFiles[uri])?.close()
                activeFiles.remove(uri)
                return true
            }
        }
        return false
    }

    @Throws(IOException::class)
    private fun existsSafFile(uriString: String): Boolean {
        val uri: Uri = Uri.parse(uriString)
        if (uri != Uri.EMPTY) {
            val document = DocumentFile.fromSingleUri(applicationContext, uri)
            if (document != null && document.exists()) {
                return true
            }
        }
        return false
    }

    // write bytes to file asynchronously using SAF
    @Throws(IOException::class)
    private fun writeSafFileStream(fileBytes: ByteArray, uriString: String): Boolean {
        val uri: Uri = Uri.parse(uriString)
        if (uri != Uri.EMPTY) {
            val document = DocumentFile.fromSingleUri(applicationContext, uri)
            if (document != null && document.exists()) {
                Objects.requireNonNull(activeFiles[uri])?.write(fileBytes)
                return true
            }
        }
        return false
    }

    @Throws(IOException::class)
    private fun closeSafFileStream(uriString: String): Boolean {
        val uri: Uri = Uri.parse(uriString)
        if (uri != Uri.EMPTY) {
            val document = DocumentFile.fromSingleUri(applicationContext, uri)
            if (document != null && document.exists()) {
                Objects.requireNonNull(activeFiles[uri])?.close()
                activeFiles.remove(uri)
                return true
            }
        }
        return false
    }

    @Throws(IOException::class)
    private fun copySafFileToDir(uriString: String, fileName: String, targetPath: String): Boolean {
        val uri: Uri = Uri.parse(uriString)
        if (uri != Uri.EMPTY) {
            val documentTree = DocumentFile.fromTreeUri(applicationContext, uri)
            if (documentTree != null) {
                val file = documentTree.findFile(fileName)
                if (file != null) {
                    val inputStream: InputStream? = contentResolver.openInputStream(file.uri)
                    val outputStream = FileOutputStream(File(targetPath, fileName))
                    inputStream?.copyTo(outputStream)
                    inputStream?.close()
                    outputStream.close()
                    return true
                }
            }
        }
        return false
    }

    @Throws(IOException::class)
    private fun copyFileToSafDir(sourcePath: String, fileName: String, uriString: String, mime: String): Boolean {
        val file = File(sourcePath, fileName)
        if (!file.exists()) return false
        val uri: Uri = Uri.parse(uriString)
        if (uri != Uri.EMPTY) {
            val documentTree = DocumentFile.fromTreeUri(applicationContext, uri)
            if (documentTree != null) {
                // create a stream to copy file to saf dir
                val targetFile = documentTree.createFile(mime, fileName)
                if (targetFile == null) {
                    return false
                }
                val outputStream = contentResolver.openOutputStream(targetFile.uri)
                val inputStream = FileInputStream(file)
                inputStream.copyTo(outputStream!!)
                inputStream.close()
                outputStream.close()
                return true
            }
        }
        return false
    }

    @Throws(IOException::class)
    private fun writeImage(fileBytes: ByteArray, name: String, mediaType: String, fileExt: String, extPathOverride: String?) {
        val fos: OutputStream?
        val resolver = contentResolver
        val contentValues = ContentValues()
        var imageUri: Uri?
        var thisMediaType: String = mediaType
        if (thisMediaType == "animation"){
            thisMediaType = "image"
        }
        if (!extPathOverride.isNullOrEmpty()){
            val doc = DocumentFile.fromTreeUri(applicationContext, Uri.parse(extPathOverride))
            if (doc != null) {
                if (doc.canWrite()){
                    doc.createFile("$thisMediaType/$fileExt","$name.$fileExt")?.uri?.let {
                        fos = contentResolver.openOutputStream(it)
                        fos?.write(fileBytes)
                        Objects.requireNonNull(fos)?.close()
                    }
                }
            }
        } else {
            if(thisMediaType == "image"){
                contentValues.put(MediaStore.MediaColumns.DISPLAY_NAME, "$name.$fileExt")
                contentValues.put(MediaStore.MediaColumns.MIME_TYPE, "$thisMediaType/$fileExt")
                contentValues.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_PICTURES + "/LoliSnatcher/")
                imageUri = resolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, contentValues)
            } else {
                contentValues.put(MediaStore.Video.Media.DISPLAY_NAME, "$name.$fileExt")
                contentValues.put(MediaStore.Video.Media.MIME_TYPE, "$thisMediaType/$fileExt")
                contentValues.put(MediaStore.Video.Media.RELATIVE_PATH, Environment.DIRECTORY_MOVIES + "/LoliSnatcher/")
                imageUri = resolver.insert(MediaStore.Video.Media.EXTERNAL_CONTENT_URI, contentValues)
            }
            if (imageUri != null){
                fos = imageUri.let { resolver.openOutputStream(it) }
                fos?.write(fileBytes)
                Objects.requireNonNull(fos)?.close()
            }
        }
    }
}
