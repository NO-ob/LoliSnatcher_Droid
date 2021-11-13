package com.noaisu.loliSnatcher

import android.annotation.SuppressLint
import android.app.Activity
import android.content.ContentResolver
import android.media.AudioManager
import android.content.ContentValues
import android.content.Intent
import android.content.Intent.ACTION_VIEW
import android.content.Intent.CATEGORY_BROWSABLE
import android.content.pm.PackageManager
import android.content.pm.ResolveInfo
import android.graphics.Bitmap
import android.media.MediaMetadataRetriever
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.provider.MediaStore
import android.util.Log
import android.view.Gravity
import android.view.View
import android.view.KeyEvent
import android.view.WindowManager
import android.webkit.MimeTypeMap
import android.widget.Toast
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import androidx.core.content.FileProvider
import androidx.documentfile.provider.DocumentFile
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.EventChannel
import java.io.*
import java.util.*
import java.net.Inet4Address
import java.net.NetworkInterface





class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.noaisu.loliSnatcher/services"
    private val VOLUME_CHANNEL = "com.noaisu.loliSnatcher/volume"
    private var sink: EventChannel.EventSink? = null
    private var isSinkingVolume: Boolean = false
    private var audioManager: AudioManager? = null
    private var SAFUri: String? = "";
    private var methodResult: MethodChannel.Result? = null
    @SuppressLint("WrongThread")
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            call, result ->
            if (call.method == "getExtPath") {
                val path = getExtDir();
                if(path != null){
                    result.success(path);
                }
            } else if (call.method == "scanMedia") {
                val mediaScannerIntent = Intent(Intent.ACTION_MEDIA_SCANNER_SCAN_FILE)
                val fileContentUri: Uri = Uri.parse("file://" + call.argument("path"))
                mediaScannerIntent.data = fileContentUri
                sendBroadcast(mediaScannerIntent)
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
                val contentUri = FileProvider.getUriForFile(context, BuildConfig.APPLICATION_ID + ".fileprovider", File(path))

                val shareFileIntent = Intent.createChooser(Intent().apply {
                    action = Intent.ACTION_SEND
                    type = call.argument("mimeType")

                    // putExtra(Intent.EXTRA_TITLE, "Test")
                    // data = contentUri
                    putExtra(Intent.EXTRA_STREAM, contentUri)
                    flags = Intent.FLAG_GRANT_READ_URI_PERMISSION
                }, null)

                // Grant read/write permission to chooser
                val resInfoList: List<ResolveInfo> = context.getPackageManager().queryIntentActivities(shareFileIntent, PackageManager.MATCH_DEFAULT_ONLY)
                for (resolveInfo in resInfoList) {
                    val packageName = resolveInfo.activityInfo.packageName
                    context.grantUriPermission(packageName, contentUri, Intent.FLAG_GRANT_WRITE_URI_PERMISSION or Intent.FLAG_GRANT_READ_URI_PERMISSION)
                }
                startActivity(shareFileIntent)
                result.success(true)
            } else if (call.method == "emptyCache") {
                val dir: File = context.cacheDir
                dir.deleteRecursively();
            } else if (call.method == "getPicturesPath"){
                result.success(Environment.getExternalStoragePublicDirectory(
                        Environment.DIRECTORY_PICTURES).absolutePath);
            } else if (call.method == "getCachePath"){
                result.success(context.cacheDir.absolutePath);
            }
            else if (call.method == "getSdkVersion"){
                result.success(android.os.Build.VERSION.SDK_INT);
            }
            else if (call.method == "writeImage"){
                var imageBytes = call.argument<ByteArray>("imageData");
                val fileName = call.argument<String>("fileName");
                val mediaType = call.argument<String>("mediaType");
                val fileExt = call.argument<String>("fileExt");
                val extPathOverride = call.argument<String?>("extPathOverride")
                if (imageBytes!= null && mediaType != null && fileExt != null && fileName != null){
                    writeImage(imageBytes,fileName,mediaType,fileExt,extPathOverride);
                    result.success(fileName);
                } else {
                    result.success(null);
                }

            } else if (call.method == "toast"){
                val toastString: String? = call.argument("toastStr");
                val toast: Toast = Toast.makeText(this, toastString, Toast.LENGTH_SHORT);
                toast.setGravity(Gravity.TOP or Gravity.CENTER, 0, 30);
                toast.show();

            } else if (call.method == "systemUIMode") {
                val modeString: String? = call.argument("mode");
                if (modeString.equals("immersive")) {
                    window.decorView.systemUiVisibility = (View.SYSTEM_UI_FLAG_IMMERSIVE
                            // Set the content to appear under the system bars so that the
                            // content doesn't resize when the system bars hide and show.
                            or View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                            or View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                            or View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                            // Hide the nav bar and status bar
                            or View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                            or View.SYSTEM_UI_FLAG_FULLSCREEN)

                } else if (modeString.equals("normal")) {
                    window.decorView.systemUiVisibility = (View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                            or View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                            or View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN)

                }
            } else if(call.method == "setBrightness") {
                val brightness: Double? = call.argument("brightness")
                val layoutParams: WindowManager.LayoutParams = (context as Activity).getWindow().getAttributes()
                layoutParams.screenBrightness = brightness!!.toFloat();
                (context as Activity).getWindow().setAttributes(layoutParams)
                result.success(null)
            } else if(call.method == "setVolume") {
                val i: Int? = call.argument("newVol")
                val showUiFlag: Int? = call.argument("showVolumeUiFlag")
                if(audioManager == null) audioManager = applicationContext.getSystemService(AUDIO_SERVICE) as AudioManager
                audioManager!!.setStreamVolume(AudioManager.STREAM_MUSIC, i!!, AudioManager.FLAG_SHOW_UI)
                result.success(null) //audioManager.getStreamVolume(3))
            } else if(call.method == "setVolumeButtons") {
                val state: Boolean? = call.argument("setActive")
                isSinkingVolume = !state!!
            } else if(call.method == "launchURL") {
                val urlString: String? = call.argument("url");
                if (!urlString.isNullOrBlank()) {
                    val uri = Uri.parse(urlString);
                    val urlLauncher = Intent(CATEGORY_BROWSABLE, uri);
                    urlLauncher.action = ACTION_VIEW;
                    startActivity(urlLauncher);
                }
            } else if (call.method == "disableSleep"){
                window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
            } else if (call.method == "enableSleep"){
                window.clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
            } else if (call.method == "makeVidThumb"){
                val videoURL = call.argument<String>("videoURL");
                val retriever = MediaMetadataRetriever()
                retriever.setDataSource(videoURL, HashMap())
                val image = retriever.getFrameAtTime(2000000, MediaMetadataRetriever.OPTION_CLOSEST_SYNC);
                val stream = ByteArrayOutputStream()
                image?.compress(Bitmap.CompressFormat.PNG, 100, stream);
                val byteArray = stream.toByteArray();
                image?.recycle();
                result.success(byteArray);
            } else if(call.method == "getIP"){
               result.success(getIpv4HostAddress());
            } else if (call.method == "setExtPath"){
                methodResult = result
                getDirAccess();
            } else if (call.method == "selectImage"){
                methodResult = result
                getImageAccess();
            } else if (call.method == "getFileBytes"){
                val uri: String? = call.argument("uri");
                result.success(uri?.let { getFileBytesFromUri(it) });
            } else if (call.method == "getFileExtension"){
                val uri: String? = call.argument("uri");
                result.success(uri?.let { getFileExt(it)});
            }
            else if (call.method == "testSAF"){
                val uri: String? = call.argument("uri");
                val permissions =
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
                            this.contentResolver.persistedUriPermissions.takeWhile { it.isReadPermission && it.isWritePermission }
                        } else {
                            TODO("VERSION.SDK_INT < KITKAT")
                        }

                if (permissions.isEmpty()) {
                    getDirAccess()
                } else {
                    val cr = this.contentResolver;
                    val docFile: DocumentFile? = DocumentFile.fromTreeUri(context, Uri.parse(uri))
                    val newFile = docFile?.createFile("text/*","testpersist")
                    try {
                        val output : String? = "test writing"
                        val stream = newFile?.uri?.let { cr.openOutputStream(it) }
                        if (output != null) {
                            stream?.write(output.toByteArray())
                        }
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
                Log.i(tag, parentUri.toString());
                Log.i(tag, permissions.toString());


            }
        }

        EventChannel(flutterEngine.dartExecutor, VOLUME_CHANNEL).setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, eventSink: EventChannel.EventSink?) {
                sink = eventSink;
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

    private fun getImageAccess(){
        val intent = Intent(Intent.ACTION_OPEN_DOCUMENT)
        val mimeTypes = arrayOf("image/png", "image/jpeg","image/jpg","image/gif")
        intent.type = "*/*"
        intent.putExtra("pickerMode","image")
        intent.putExtra(Intent.EXTRA_MIME_TYPES, mimeTypes);
        intent.flags = Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION or Intent.FLAG_GRANT_READ_URI_PERMISSION or Intent.FLAG_GRANT_WRITE_URI_PERMISSION
        startActivityForResult(intent, 1)
    }

    @RequiresApi(Build.VERSION_CODES.KITKAT)
    override fun onActivityResult(requestCode: Int, resultCode: Int, resultData: Intent?)
    {
        super.onActivityResult(requestCode, resultCode, resultData)

        if (resultCode == Activity.RESULT_OK && resultData != null) {
            resultData?.data?.also { uri ->
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
        if (uri != null && uri != Uri.EMPTY) {
            println()
            val inputStream: InputStream? = contentResolver.openInputStream(uri)
            return inputStream?.readBytes();
        }
        return null;
    }

    private fun getFileExt(uriString: String): String {
        val uri: Uri = Uri.parse(uriString)
        var fileExt: String? = null
        fileExt = if (ContentResolver.SCHEME_CONTENT.equals(uri.scheme)) {
            val cr: ContentResolver = context.contentResolver
            cr.getType(uri)?.split("/")?.get(1)
        } else {
            MimeTypeMap.getFileExtensionFromUrl(uri.toString());
        }
        return fileExt ?: ""
    }
    /*override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode == RESULT_OK && requestCode == 1) {
            data?.data?.also { uri ->
                print("uri is $uri")
            }

        }
    }*/
    override fun onKeyDown(keyCode: Int, event: KeyEvent?): Boolean {
        if ((keyCode == KeyEvent.KEYCODE_VOLUME_DOWN || keyCode == KeyEvent.KEYCODE_VOLUME_UP) && isSinkingVolume)
        {
            sink?.success(if (keyCode == KeyEvent.KEYCODE_VOLUME_DOWN) "down" else "up")
            return true;
        }

        return super.onKeyDown(keyCode, event)
    }
    private fun getIpv4HostAddress(): String {
        NetworkInterface.getNetworkInterfaces()?.toList()?.map { networkInterface ->
            networkInterface.inetAddresses?.toList()?.find {
                !it.isLoopbackAddress && it is Inet4Address
            }?.let { return it.hostAddress }
        }
        return ""
    }

    private fun getExtDir(): String {
        if (android.os.Build.VERSION.SDK_INT <= android.os.Build.VERSION_CODES.Q) {
            return Environment.getExternalStorageDirectory().absolutePath;
        } else {
            return context.dataDir.absolutePath;
        }

    }

    @Throws(IOException::class)
    private fun writeImage(fileBytes: ByteArray, name: String, mediaType: String, fileExt: String,extPathOverride: String?) {
        val fos: OutputStream?
        val resolver = contentResolver
        val contentValues = ContentValues()
        var imageUri: Uri?
        var thisMediaType: String = mediaType;
        if (thisMediaType == "animation"){
            thisMediaType = "image";
        }
        if (extPathOverride != null && extPathOverride.isNotEmpty()){
            val doc = DocumentFile.fromTreeUri(context,Uri.parse(extPathOverride))
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
                fos = imageUri?.let { resolver.openOutputStream(it) };
                fos?.write(fileBytes);
                Objects.requireNonNull(fos)?.close()
            }
        }


    }
}
