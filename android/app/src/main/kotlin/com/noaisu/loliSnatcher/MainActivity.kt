package com.noaisu.loliSnatcher

import android.annotation.SuppressLint
import android.app.Activity
import android.content.ComponentName
import android.content.ContentResolver
import android.content.ContentValues
import android.content.Intent
import android.content.pm.PackageManager
import android.content.pm.ResolveInfo
import android.graphics.Bitmap
import android.media.MediaMetadataRetriever
import android.media.MediaScannerConnection
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.os.Environment
import android.provider.DocumentsContract
import android.provider.MediaStore
import android.util.Log
import android.view.KeyEvent
import android.view.WindowManager
import android.webkit.MimeTypeMap
import androidx.annotation.NonNull
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
        val servicesChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, SERVICES_CHANNEL)
        servicesChannel.setMethodCallHandler { call, result ->
            try {
                when (call.method) {
                    "getExtPath" -> result.success(getExtDir())
                    "scanMedia" -> result.success(call.argument<String>("path")?.let { refreshMedia(it) })
                    "shareText" -> {
                        val text = call.argument<String>("text")
                        val title = call.argument<String>("title")
                        if (text != null) {
                            val shareTextIntent = Intent.createChooser(Intent().apply {
                                action = Intent.ACTION_SEND
                                putExtra(Intent.EXTRA_TEXT, text)
                                // putExtra(Intent.EXTRA_TITLE, title)
                                type = "text/plain"
                            }, null)
                            startActivity(shareTextIntent)
                            result.success(true)
                        } else {
                            result.error("INVALID_ARGUMENT", "Text argument is null", null)
                        }
                    }
                    "shareFile" -> {
                        val path = call.argument<String>("path")
                        val mimeType = call.argument<String>("mimeType")
                        val text = call.argument<String>("text")
                        if (path != null && mimeType != null) {
                            val contentUri = FileProvider.getUriForFile(applicationContext, BuildConfig.APPLICATION_ID + ".fileprovider", File(path))
                            val shareFileIntent = Intent.createChooser(Intent().apply {
                                action = Intent.ACTION_SEND
                                type = mimeType
                                putExtra(Intent.EXTRA_STREAM, contentUri)
                                flags = Intent.FLAG_GRANT_READ_URI_PERMISSION
                                if (text != null) {
                                    putExtra(Intent.EXTRA_TEXT, text)
                                }
                            }, null)

                            val resInfoList: List<ResolveInfo> = applicationContext.packageManager.queryIntentActivities(shareFileIntent, PackageManager.MATCH_DEFAULT_ONLY)
                            for (resolveInfo in resInfoList) {
                                val packageName = resolveInfo.activityInfo.packageName
                                applicationContext.grantUriPermission(packageName, contentUri, Intent.FLAG_GRANT_WRITE_URI_PERMISSION or Intent.FLAG_GRANT_READ_URI_PERMISSION)
                            }
                            startActivity(shareFileIntent)
                            result.success(true)
                        } else {
                            result.error("INVALID_ARGUMENT", "Path or mimeType is null", null)
                        }
                    }
                    "emptyCache" -> {
                        val dir: File = applicationContext.cacheDir
                        if (dir.deleteRecursively()) {
                            result.success(true)
                        } else {
                            result.error("CACHE_ERROR", "Failed to delete cache directory", null)
                        }
                    }
                    "getPicturesPath" -> result.success(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_PICTURES)?.absolutePath)
                    "getCachePath" -> result.success(applicationContext.cacheDir.absolutePath)
                    "getSdkVersion" -> result.success(Build.VERSION.SDK_INT)
                    "writeImage" -> {
                        val imageBytes = call.argument<ByteArray>("imageData")
                        val fileName = call.argument<String>("fileName")
                        val mediaType = call.argument<String>("mediaType")
                        val fileExt = call.argument<String>("fileExt")
                        val extPathOverride = call.argument<String?>("extPathOverride")
                        if (imageBytes != null && mediaType != null && fileExt != null && fileName != null) {
                            writeImage(imageBytes, fileName, mediaType, fileExt, extPathOverride)
                            result.success(fileName)
                        } else {
                            result.error("INVALID_ARGUMENT", "One or more arguments are null", null)
                        }
                    }
                    "setVolumeButtons" -> {
                        val state: Boolean? = call.argument("setActive")
                        isSinkingVolume = !(state ?: true)
                    }
                    "disableSleep" -> window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
                    "enableSleep" -> window.clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
                    "makeVidThumb" -> {
                        val videoURL = call.argument<String>("videoURL")
                        if (videoURL != null) {
                            val retriever = MediaMetadataRetriever()
                            retriever.setDataSource(videoURL, HashMap())
                            val image = retriever.getFrameAtTime(2000000, MediaMetadataRetriever.OPTION_CLOSEST_SYNC)
                            val stream = ByteArrayOutputStream()
                            image?.compress(Bitmap.CompressFormat.PNG, 100, stream)
                            val byteArray = stream.toByteArray()
                            image?.recycle()
                            result.success(byteArray)
                        } else {
                            result.error("INVALID_ARGUMENT", "videoURL is null", null)
                        }
                    }
                    "getIP" -> result.success(getIpv4HostAddress())
                    "setExtPath" -> {
                        methodResult = result
                        requestDirectoryAccess()
                    }
                    "getTempDirAccess" -> {
                        methodResult = result
                        requestTemporaryDirectoryAccess()
                    }
                    "selectImage" -> {
                        methodResult = result
                        requestImageAccess()
                    }
                    "getFileBytes" -> {
                        val uri = call.argument<String>("uri")
                        if (uri != null) {
                            result.success(getFileBytesFromUri(uri))
                        } else {
                            result.error("INVALID_ARGUMENT", "URI is null", null)
                        }
                    }
                    "getFileExtension" -> {
                        val uri = call.argument<String>("uri")
                        if (uri != null) {
                            result.success(getFileExt(uri))
                        } else {
                            result.error("INVALID_ARGUMENT", "URI is null", null)
                        }
                    }
                    "getFileByName" -> {
                        val uri = call.argument<String>("uri")
                        val fileName = call.argument<String>("fileName")
                        if (fileName != null && uri != null) {
                            Executors.newSingleThreadExecutor().execute {
                                val fileBytes = getFileByName(uri, fileName)
                                runOnUiThread {
                                    result.success(fileBytes)
                                }
                            }
                        } else {
                            result.error("INVALID_ARGUMENT", "URI or fileName is null", null)
                        }
                    }
                    "existsFileByName" -> {
                        val uri = call.argument<String>("uri")
                        val fileName = call.argument<String>("fileName")
                        if (fileName != null && uri != null) {
                            Executors.newSingleThreadExecutor().execute {
                                val exists = existsByName(uri, fileName)
                                result.success(exists)
                            }
                        } else {
                            result.error("INVALID_ARGUMENT", "URI or fileName is null", null)
                        }
                    }
                    "existsFileByNameFast" -> {
                        val uri = call.argument<String>("uri")
                        val fileName = call.argument<String>("fileName")
                        if (fileName != null && uri != null) {
                            Executors.newSingleThreadExecutor().execute {
                                val exists = existsByNameFast(uri, fileName)
                                result.success(exists)
                            }
                        } else {
                            result.error("INVALID_ARGUMENT", "URI or fileName is null", null)
                        }
                    }
                    "listFileNames" -> {
                        val uri = call.argument<String>("uri")
                        if (uri != null) {
                            Executors.newSingleThreadExecutor().execute {
                                val names = listFileNames(uri)
                                result.success(names)
                            }
                        } else {
                            result.error("INVALID_ARGUMENT", "URI is null", null)
                        }
                    }
                    "deleteFileByName" -> {
                        val uri = call.argument<String>("uri")
                        val fileName = call.argument<String>("fileName")
                        if (fileName != null && uri != null) {
                            result.success(removeByName(uri, fileName))
                        } else {
                            result.error("INVALID_ARGUMENT", "URI or fileName is null", null)
                        }
                    }
                    "createFileStream" -> {
                        val fileName = call.argument<String>("fileName")
                        val mediaType = call.argument<String>("mediaType")
                        val fileExt = call.argument<String>("fileExt")
                        val savePath = call.argument<String?>("savePath")
                        if (mediaType != null && fileExt != null && fileName != null && savePath != null) {
                            result.success(createSafFile(fileName, mediaType, fileExt, savePath)?.toString())
                        } else {
                            result.error("INVALID_ARGUMENT", "One or more arguments are null", null)
                        }
                    }
                    "writeFileStream" -> {
                        val uri = call.argument<String>("uri")
                        val bytes = call.argument<ByteArray>("data")
                        if (uri != null && bytes != null) {
                            result.success(writeSafFileStream(bytes, uri))
                        } else {
                            result.error("INVALID_ARGUMENT", "URI or data is null", null)
                        }
                    }
                    "closeStreamToFile" -> {
                        val uri = call.argument<String>("uri")
                        if (uri != null) {
                            result.success(closeSafFileStream(uri))
                        } else {
                            result.error("INVALID_ARGUMENT", "URI is null", null)
                        }
                    }
                    "deleteStreamToFile" -> {
                        val uri = call.argument<String>("uri")
                        if (uri != null) {
                            result.success(deleteSafFile(uri))
                        } else {
                            result.error("INVALID_ARGUMENT", "URI is null", null)
                        }
                    }
                    "existsStreamToFile" -> {
                        val uri = call.argument<String>("uri")
                        if (uri != null) {
                            result.success(existsSafFile(uri))
                        } else {
                            result.error("INVALID_ARGUMENT", "URI is null", null)
                        }
                    }
                    "copySafFileToDir" -> {
                        val uri = call.argument<String>("uri")
                        val fileName = call.argument<String>("fileName")
                        val targetPath = call.argument<String>("targetPath")
                        if (uri != null && fileName != null && targetPath != null) {
                            Executors.newSingleThreadExecutor().execute {
                                val success = copySafFileToDir(uri, fileName, targetPath)
                                result.success(success)
                            }
                        } else {
                            result.error("INVALID_ARGUMENT", "One or more arguments are null", null)
                        }
                    }
                    "copyFileToSafDir" -> {
                        val sourcePath = call.argument<String>("sourcePath")
                        val fileName = call.argument<String>("fileName")
                        val uri = call.argument<String>("uri")
                        val mime = call.argument<String>("mime")
                        if (sourcePath != null && fileName != null && uri != null && mime != null) {
                            Executors.newSingleThreadExecutor().execute {
                                val success = copyFileToSafDir(sourcePath, fileName, uri, mime)
                                result.success(success)
                            }
                        } else {
                            result.error("INVALID_ARGUMENT", "One or more arguments are null", null)
                        }
                    }
                    "testSAF" -> {
                        val uri: String? = call.argument("uri")
                        if (uri != null) {
                            val permissions =
                                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
                                        this.contentResolver.persistedUriPermissions.takeWhile { it.isReadPermission && it.isWritePermission }
                                    } else {
                                        emptyList()
                                    }

                            if (permissions.isEmpty()) {
                                methodResult = result
                                requestDirectoryAccess()
                            } else {
                                try {
                                    val cr = this.contentResolver
                                    val docFile: DocumentFile? = DocumentFile.fromTreeUri(applicationContext, Uri.parse(uri))
                                    val newFile = docFile?.createFile("text/*", "testpersist")
                                    if (newFile == null) {
                                        result.error("FILE_NOT_FOUND", "File not found", null)
                                    } else {
                                        val output = "test writing"
                                        val stream = cr.openOutputStream(newFile.uri)
                                        if (stream == null) {
                                            result.error("IO_ERROR", "IO error", null)
                                        } else {
                                            stream.write(output.toByteArray())
                                            stream.close()
                                            newFile.delete()
                                            result.success("ok")
                                        }
                                    }
                                } catch (e: Exception) {
                                    Log.e("MainActivity", "Error testing SAF", e)
                                    result.error("ERROR", "Error testing SAF", null)
                                }
                            }
                        } else {
                            result.error("INVALID_ARGUMENT", "URI is null", null)
                        }
                    }
                    "openLinkDefaults" -> {
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
                            } catch (ignored: Throwable) {
                            }
                        }
                    }
                    "restartApp" -> {
                        restartApp()
                        result.success("ok")
                    }
                    "setAppAlias" -> {
                        val alias = call.argument<String>("alias")
                        if (alias != null) {
                            val success = setAppAlias(alias)
                            result.success(success)
                        } else {
                            result.error("INVALID_ARGUMENT", "Alias is null", null)
                        }
                    }
                    "getCurrentAlias" -> {
                        result.success(getCurrentAlias())
                    }
                    "getAvailableAliases" -> {
                        result.success(getAvailableAliases())
                    }
                    else -> result.notImplemented()
                }
            } catch (e: Exception) {
                result.error("ERROR", e.localizedMessage, null)
            }
        }

        val volumeChannel = EventChannel(flutterEngine.dartExecutor, VOLUME_CHANNEL)
        volumeChannel.setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, eventSink: EventChannel.EventSink?) {
                volumeSink = eventSink
            }

            override fun onCancel(arguments: Any?) {
                volumeSink = null
            }
        })
    }

    private fun requestDirectoryAccess() {
        val intent = Intent(Intent.ACTION_OPEN_DOCUMENT_TREE).apply {
            putExtra("pickerMode", "directory")
            flags = Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION or
                    Intent.FLAG_GRANT_READ_URI_PERMISSION or
                    Intent.FLAG_GRANT_WRITE_URI_PERMISSION
        }
        
        startActivityForResult(intent, 1)
    }

    private fun requestTemporaryDirectoryAccess() {
        val intent = Intent(Intent.ACTION_OPEN_DOCUMENT_TREE).apply {
            putExtra("pickerMode", "directory")
            flags = Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_GRANT_WRITE_URI_PERMISSION
        }

        startActivityForResult(intent, 1)
    }

    private fun requestImageAccess() {
        val intent = Intent(Intent.ACTION_OPEN_DOCUMENT).apply {
            type = "*/*"
            putExtra(Intent.EXTRA_MIME_TYPES, arrayOf(
                "image/png",
                "image/jpeg",
                "image/jpg",
                "image/gif"
            ))
            flags = Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION or
                    Intent.FLAG_GRANT_READ_URI_PERMISSION or
                    Intent.FLAG_GRANT_WRITE_URI_PERMISSION
        }

        startActivityForResult(intent, 1)
    }

    @RequiresApi(Build.VERSION_CODES.KITKAT)
    override fun onActivityResult(requestCode: Int, resultCode: Int, resultData: Intent?) {
        super.onActivityResult(requestCode, resultCode, resultData)

        if (resultCode == Activity.RESULT_OK && resultData?.data != null) {
            val uri = resultData.data
            val mode = resultData.getStringExtra("pickerMode")

            if (uri != null) {
                SAFUri = uri.toString()
                try {
                    contentResolver.takePersistableUriPermission(uri, Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_GRANT_WRITE_URI_PERMISSION)
                    methodResult?.success(uri.toString())
                } catch (e: SecurityException) {
                    Log.e("MainActivity", "Failed to take persistable URI permission", e)
                    methodResult?.error("PERMISSION_ERROR", "Failed to take persistable URI permission", null)
                }
            } else {
                methodResult?.error("INVALID_URI", "URI is null", null)
            }
        } else {
            methodResult?.error("RESULT_ERROR", "Invalid result or data", null)
        }
    }

    private fun getFileBytesFromUri(uriString: String): ByteArray? {
        val uri = Uri.parse(uriString)
        if (uri == Uri.EMPTY) {
            return null
        }

        try {
            val stream = contentResolver.openInputStream(uri)
            return stream?.buffered()?.use { it.readBytes() }
        } catch (e: IOException) {
            if (e is FileNotFoundException) {
                Log.e("MainActivity", "File not found for URI: $uriString")
            } else {
                Log.e("MainActivity", "Error reading from URI: $uriString", e)
            }
        }

        return null
    }

    private fun getFileExt(uriString: String): String {
        val uri = Uri.parse(uriString)
        if (uri == Uri.EMPTY) {
            Log.e("MainActivity", "Invalid URI: $uriString")
            return ""
        }

        return try {
            if (ContentResolver.SCHEME_CONTENT == uri.scheme) {
                val cr = applicationContext.contentResolver
                val mimeType = cr.getType(uri)
                mimeType?.substringAfterLast('/') ?: ""
            } else {
                MimeTypeMap.getFileExtensionFromUrl(uri.toString()) ?: ""
            }
        } catch (e: Exception) {
            Log.e("MainActivity", "Error getting file extension for URI: $uriString", e)
            ""
        }
    }


    private fun getFileByName(uriString: String, fileName: String): ByteArray? {
        val uri = Uri.parse(uriString)
        val documentTree = DocumentFile.fromTreeUri(applicationContext, uri) ?: return null
        val file = documentTree.findFile(fileName) ?: return null
        val inputStream = contentResolver.openInputStream(file.uri) ?: return null
        return inputStream.use { it.readBytes() }
    }

    private fun existsByName(uriString: String, fileName: String): Boolean {
        val uri = Uri.parse(uriString)
        if (uri == Uri.EMPTY) {
            Log.e("MainActivity", "Invalid URI: $uriString")
            return false
        }

        val documentTree = DocumentFile.fromTreeUri(applicationContext, uri)
        return documentTree?.findFile(fileName)?.exists() ?: false
    }

    private fun findFileUri(uriString: String, fileName: String): Uri? {
        val treeUri = Uri.parse(uriString)
        if (treeUri == Uri.EMPTY) return null

        val docId = DocumentsContract.getTreeDocumentId(treeUri)
        val childrenUri = DocumentsContract.buildChildDocumentsUriUsingTree(treeUri, docId)

        val cursor = contentResolver.query(
            childrenUri,
            arrayOf(
                DocumentsContract.Document.COLUMN_DOCUMENT_ID,
                DocumentsContract.Document.COLUMN_DISPLAY_NAME
            ),
            "${DocumentsContract.Document.COLUMN_DISPLAY_NAME} = ?",
            arrayOf(fileName),
            null
        ) ?: return null

        return cursor.use {
            while (it.moveToNext()) {
                if (it.getString(1) == fileName) {
                    val foundDocId = it.getString(0)
                    return@use DocumentsContract.buildDocumentUriUsingTree(treeUri, foundDocId)
                }
            }
            null
        }
    }

    private fun existsByNameFast(uriString: String, fileName: String): Boolean {
        return findFileUri(uriString, fileName) != null
    }

    private fun listFileNames(uriString: String): List<String> {
        val treeUri = Uri.parse(uriString)
        if (treeUri == Uri.EMPTY) return emptyList()

        val docId = DocumentsContract.getTreeDocumentId(treeUri)
        val childrenUri = DocumentsContract.buildChildDocumentsUriUsingTree(treeUri, docId)

        val names = mutableListOf<String>()
        contentResolver.query(
            childrenUri,
            arrayOf(DocumentsContract.Document.COLUMN_DISPLAY_NAME),
            null, null, null
        )?.use { cursor ->
            while (cursor.moveToNext()) {
                names.add(cursor.getString(0))
            }
        }
        return names
    }

    private fun removeByName(uriString: String, fileName: String): Boolean {
        val uri = Uri.parse(uriString)
        if (uri == Uri.EMPTY) {
            Log.e("MainActivity", "Invalid URI: $uriString")
            return false
        }

        val documentTree = DocumentFile.fromTreeUri(applicationContext, uri)
        if (documentTree == null) {
            Log.e("MainActivity", "Document tree is null for URI: $uriString")
            return false
        }

        val file = documentTree.findFile(fileName)
        return if (file != null && file.exists()) {
            file.delete()
        } else {
            Log.e("MainActivity", "File not found: $fileName")
            false
        }
    }

    private fun restartApp() {
        val launchIntent = packageManager.getLaunchIntentForPackage(packageName)
            ?: return

        val component = launchIntent.component
            ?: return

        applicationContext.startActivity(
            Intent.makeRestartActivityTask(component)
        )
        Runtime.getRuntime().exit(0)
    }

    override fun onKeyDown(keyCode: Int, event: KeyEvent?): Boolean {
        if ((keyCode == KeyEvent.KEYCODE_VOLUME_DOWN || keyCode == KeyEvent.KEYCODE_VOLUME_UP) && isSinkingVolume) {
            val direction = when (keyCode) {
                KeyEvent.KEYCODE_VOLUME_DOWN -> "down"
                KeyEvent.KEYCODE_VOLUME_UP -> "up"
                else -> null
            }
            direction?.let { volumeSink?.success(it) }
            return true
        }
        return super.onKeyDown(keyCode, event)
    }

    private fun getIpv4HostAddress(): String {
        return NetworkInterface.getNetworkInterfaces()
            ?.asSequence()
            ?.mapNotNull { networkInterface ->
                networkInterface.inetAddresses?.asSequence()
                    ?.firstOrNull { !it.isLoopbackAddress && it is Inet4Address }
                    ?.let { it.hostAddress }
            }
            ?.firstOrNull()
            ?: ""
    }

    private fun getExtDir(): String {
        return if (Build.VERSION.SDK_INT <= Build.VERSION_CODES.Q) {
            Environment.getExternalStorageDirectory()?.absolutePath ?: ""
        } else {
            applicationContext.dataDir?.absolutePath ?: ""
        }
    }

    @Throws(IOException::class)
    private fun createSafFile(fileName: String, mediaType: String, fileExt: String, savePath: String?): Uri? {
        val thisMediaType = if (mediaType == "animation") "image" else mediaType

        val doc = if (!savePath.isNullOrEmpty()) {
            DocumentFile.fromTreeUri(applicationContext, Uri.parse(savePath))
        } else null

        if (doc != null && doc.canWrite()) {
            val uri = doc.createFile("$thisMediaType/$fileExt", "$fileName.$fileExt")?.uri
            uri?.let {
                activeFiles[it] = contentResolver.openOutputStream(it)
            }
            return uri
        }

        return null
    }

    @Throws(IOException::class)
    private fun deleteSafFile(uriString: String): Boolean {
        val uri: Uri? = Uri.parse(uriString)
        if (uri == null || uri == Uri.EMPTY) {
            Log.e("MainActivity", "Invalid URI: $uriString")
            return false
        }

        val document = DocumentFile.fromSingleUri(applicationContext, uri)
        if (document == null || !document.exists()) {
            Log.e("MainActivity", "Document does not exist for URI: $uriString")
            return false
        }

        if (document.delete()) {
            activeFiles[uri]?.close()
            activeFiles.remove(uri)
            return true
        } else {
            Log.e("MainActivity", "Failed to delete document for URI: $uriString")
            return false
        }
    }

    private fun existsSafFile(uriString: String): Boolean {
        val uri = Uri.parse(uriString) ?: return false
        val document = DocumentFile.fromSingleUri(applicationContext, uri) ?: return false
        return document.exists()
    }

    // write bytes to file asynchronously using SAF
    @Throws(IOException::class)
    private fun writeSafFileStream(fileBytes: ByteArray, uriString: String): Boolean {
        val uri = Uri.parse(uriString) ?: return false
        val document = DocumentFile.fromSingleUri(applicationContext, uri) ?: return false
        if (!document.exists()) {
            Log.e("MainActivity", "Document does not exist for URI: $uriString")
            return false
        }

        val outputStream = activeFiles[uri] ?: return false
        try {
            outputStream.write(fileBytes)
            return true
        } catch (e: IOException) {
            Log.e("MainActivity", "Failed to write to document for URI: $uriString", e)
            return false
        }
    }

    @Throws(IOException::class)
    private fun closeSafFileStream(uriString: String): Boolean {
        val uri = Uri.parse(uriString)
        if (uri == Uri.EMPTY) {
            Log.e("MainActivity", "Invalid URI: $uriString")
            return false
        }

        val document = DocumentFile.fromSingleUri(applicationContext, uri)
        if (document == null || !document.exists()) {
            Log.e("MainActivity", "Document does not exist for URI: $uriString")
            return false
        }

        val outputStream = activeFiles.remove(uri)
        if (outputStream == null) {
            Log.e("MainActivity", "No active file stream found for URI: $uriString")
            return false
        }

        outputStream.close()
        return true
    }

    @Throws(IOException::class)
    private fun copySafFileToDir(uriString: String, fileName: String, targetPath: String): Boolean {
        val uri = Uri.parse(uriString) ?: return false
        val documentTree = DocumentFile.fromTreeUri(applicationContext, uri) ?: return false
        val file = documentTree.findFile(fileName) ?: return false
        val inputStream = contentResolver.openInputStream(file.uri) ?: return false
        val outputStream = FileOutputStream(File(targetPath, fileName))
        inputStream.copyTo(outputStream)
        inputStream.close()
        outputStream.close()
        return true
    }

    @Throws(IOException::class)
    private fun copyFileToSafDir(sourcePath: String, fileName: String, uriString: String, mime: String): Boolean {
        val file = File(sourcePath, fileName)
        if (!file.exists()) {
            return false
        }
        val uri = Uri.parse(uriString)
        if (uri == Uri.EMPTY) {
            return false
        }
        val documentTree = DocumentFile.fromTreeUri(applicationContext, uri) ?: return false
        val targetFile = documentTree.createFile(mime, fileName) ?: return false
        val outputStream = contentResolver.openOutputStream(targetFile.uri) ?: return false
        val inputStream = FileInputStream(file)
        inputStream.copyTo(outputStream)
        inputStream.close()
        outputStream.close()
        return true
    }

    @Throws(IOException::class)
    private fun writeImage(fileBytes: ByteArray, name: String, mediaType: String, fileExt: String, extPathOverride: String?) {
        var fos: OutputStream? = null
        val resolver = contentResolver
        val contentValues = ContentValues()
        var imageUri: Uri? = null
        var thisMediaType: String = mediaType
        if (thisMediaType == "animation") {
            thisMediaType = "image"
        }

        if (!extPathOverride.isNullOrEmpty()) {
            val doc = DocumentFile.fromTreeUri(applicationContext, Uri.parse(extPathOverride))
            if (doc != null && doc.canWrite()) {
                val file = doc.createFile("$thisMediaType/$fileExt", "$name.$fileExt")
                if (file != null) {
                    fos = contentResolver.openOutputStream(file.uri)
                }
            }
        } else {
            if (thisMediaType == "image") {
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
            if (imageUri != null) {
                fos = resolver.openOutputStream(imageUri)
            }
        }

        if (fos != null) {
            try {
                fos.write(fileBytes)
            } finally {
                fos.close()
            }
        }
    }

    private fun refreshMedia(filePath: String?): String {
        return try {
            filePath ?: throw NullPointerException("filePath is null")
            val file = File(filePath)
            if (!file.exists()) {
                throw FileNotFoundException("File does not exist: $filePath")
            }

            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) {
                sendBroadcast(Intent(Intent.ACTION_MEDIA_SCANNER_SCAN_FILE, Uri.fromFile(file)))
            } else {
                MediaScannerConnection.scanFile(
                    applicationContext,
                    arrayOf(file.path),
                    arrayOf(file.name),
                    null,
                )
            }
            "Success show image $filePath in Gallery"
        } catch (e: Exception) {
            e.toString()
        }
    }

    // App alias mapping for changing launcher display name
    private val aliasMap = mapOf(
        "loli_snatcher" to ".MainActivityAlias_LoliSnatcher",
        "loli_snatcher_spaced" to ".MainActivityAlias_LoliSnatcherSpaced",
        "losn" to ".MainActivityAlias_LoSn",
        "ls" to ".MainActivityAlias_LS",
        "booru_snatcher" to ".MainActivityAlias_BooruSnatcher",
        "booru_snatcher_spaced" to ".MainActivityAlias_BooruSnatcherSpaced",
        "booru" to ".MainActivityAlias_Booru"
    )

    private fun setAppAlias(alias: String): Boolean {
        val targetAlias = aliasMap[alias] ?: return false
        val pm = packageManager

        try {
            // Disable all aliases first
            for ((_, aliasComponent) in aliasMap) {
                val component = ComponentName(packageName, "$packageName$aliasComponent")
                pm.setComponentEnabledSetting(
                    component,
                    PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                    PackageManager.DONT_KILL_APP
                )
            }

            // Enable the selected alias
            val component = ComponentName(packageName, "$packageName$targetAlias")
            pm.setComponentEnabledSetting(
                component,
                PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
                PackageManager.DONT_KILL_APP
            )

            return true
        } catch (e: Exception) {
            Log.e("MainActivity", "Error setting app alias", e)
            return false
        }
    }

    private fun getCurrentAlias(): String {
        val pm = packageManager
        for ((key, alias) in aliasMap) {
            val component = ComponentName(packageName, "$packageName$alias")
            val state = pm.getComponentEnabledSetting(component)
            if (state == PackageManager.COMPONENT_ENABLED_STATE_ENABLED ||
                (state == PackageManager.COMPONENT_ENABLED_STATE_DEFAULT && key == "loli_snatcher")) {
                return key
            }
        }
        return "loli_snatcher" // Default
    }

    private fun getAvailableAliases(): List<String> {
        return aliasMap.keys.toList()
    }
}
