package com.noaisu.loliSnatcher

import android.content.Intent
import android.net.Uri
import android.os.Environment
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


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
                Log.i("MediaScanner called on ",call.argument("path"));
            } else if (call.method == "shareItem") {
                val intent= Intent()
                intent.action=Intent.ACTION_SEND
                intent.putExtra(Intent.EXTRA_TEXT,"" + call.argument("fileURL"))
                intent.type="text/plain"
                startActivity(Intent.createChooser(intent,"Share To:"))
            }
        }
    }
    private fun getExtDir(): String? {
        return Environment.getExternalStorageDirectory().absolutePath;
    }
}
