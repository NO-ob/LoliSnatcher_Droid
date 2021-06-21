package com.noaisu.loliSnatcher

import android.app.Activity
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
import android.os.Environment
import android.provider.MediaStore
import android.view.Gravity
import android.view.View
import android.view.KeyEvent
import android.view.WindowManager
import android.widget.Toast
import androidx.annotation.NonNull
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.EventChannel
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.IOException
import java.io.OutputStream
import java.util.*
import android.R.attr.streamType
import android.content.Context
import java.net.Inet4Address
import java.net.NetworkInterface


class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.noaisu.loliSnatcher/services"
    private val VOLUME_CHANNEL = "com.noaisu.loliSnatcher/volume"
    private var sink: EventChannel.EventSink? = null
    private var isSinkingVolume: Boolean = false
    private var audioManager: AudioManager? = null

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

                if (imageBytes!= null && mediaType != null && fileExt != null && fileName != null){
                    writeImage(imageBytes,fileName,mediaType,fileExt);
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
                //val uwu = askPermission();
                //print(uwu);
                result.success("")
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
    /*private fun askPermission(): String {
        val intent = Intent(Intent.ACTION_OPEN_DOCUMENT_TREE)
        startActivityForResult(intent, 1);
        return intent.data.toString()

    }
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
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
    private fun writeImage(fileBytes: ByteArray, name: String, mediaType: String, fileExt: String) {
        val fos: OutputStream?
        val resolver = contentResolver
        val contentValues = ContentValues()
        val imageUri: Uri?
        if(mediaType == "image"){
            contentValues.put(MediaStore.MediaColumns.DISPLAY_NAME, "$name.$fileExt")
            contentValues.put(MediaStore.MediaColumns.MIME_TYPE, "$mediaType/$fileExt")
            contentValues.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_PICTURES + "/LoliSnatcher/")
            imageUri = resolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, contentValues)
        } else {
            contentValues.put(MediaStore.Video.Media.DISPLAY_NAME, "$name.$fileExt")
            contentValues.put(MediaStore.Video.Media.MIME_TYPE, "$mediaType/$fileExt")
            contentValues.put(MediaStore.Video.Media.RELATIVE_PATH, Environment.DIRECTORY_MOVIES + "/LoliSnatcher/")
            imageUri = resolver.insert(MediaStore.Video.Media.EXTERNAL_CONTENT_URI, contentValues)
        }

        if (imageUri != null){
            fos = resolver.openOutputStream(imageUri);
            fos?.write(fileBytes);
            Objects.requireNonNull(fos)?.close()
        }
    }
}
