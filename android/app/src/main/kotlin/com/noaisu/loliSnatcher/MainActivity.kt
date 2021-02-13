package com.noaisu.loliSnatcher

import android.content.ContentValues
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.provider.MediaStore
import android.widget.Toast
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.io.OutputStream
import java.util.*


class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.noaisu.loliSnatcher/services"

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
            } else if (call.method == "shareItem") {
                val intent= Intent()
                intent.action=Intent.ACTION_SEND
                intent.putExtra(Intent.EXTRA_TEXT,"" + call.argument("fileURL"))
                intent.type="text/plain"
                startActivity(Intent.createChooser(intent,"Share To:"))
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
                val  mediaType = call.argument<String>("mediaType");
                val  fileExt = call.argument<String>("fileExt");

                if (imageBytes!= null && mediaType != null && fileExt != null && fileName != null){
                    print("writing file");
                    writeImage(imageBytes,fileName,mediaType,fileExt);
                    result.success(fileName);
                } else {
                    print("a value is null");
                    result.success(null);
                }

            } else if (call.method == "toast"){
                val toastString: String? = call.argument("toastStr");
                Toast.makeText(this, toastString, Toast.LENGTH_SHORT).show()
            }



        }
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
