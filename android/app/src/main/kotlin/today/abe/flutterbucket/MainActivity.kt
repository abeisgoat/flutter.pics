package today.abe.flutterbucket

import android.app.PendingIntent.getActivity
import android.content.Intent
import android.os.Bundle
import android.net.Uri
import android.util.Log
import com.google.android.libraries.cloudtesting.screenshots.ScreenShotter

import org.json.JSONException
import org.json.JSONObject

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import android.app.Activity
import java.security.AccessController.getContext
import android.graphics.Bitmap
import android.os.Environment.getExternalStorageDirectory
import java.io.File
import java.io.FileOutputStream


class MainActivity : FlutterActivity() {
  lateinit var mChan : io.flutter.plugin.common.MethodChannel;

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    mChan = MethodChannel(getFlutterView(), "app.channel.shared.data")

    mChan.setMethodCallHandler { call, result ->
      if (call.method == "screenshot") {
        takeScreenshot(call.arguments<String>())
      }
    }
  }

  private fun takeScreenshot(filename: String) {
    try {
      // image naming and path  to include sd card  appending name you choose for file
      val directoryName = "/sdcard/screenshots";
      val mPath = directoryName + "/" + filename + ".jpg"

      val directory = File(directoryName)
      if (!directory.exists()) {
        directory.mkdir()
      }

      // create bitmap screen capture
      val bitmap = flutterView.bitmap;

      val imageFile = File(mPath)

      val outputStream = FileOutputStream(imageFile)
      val quality = 100
      bitmap.compress(Bitmap.CompressFormat.JPEG, quality, outputStream)
      outputStream.flush()
      outputStream.close()
    } catch (e: Throwable) {
      // Several error may come out with file handling or DOM
      e.printStackTrace()
    }

  }
}

