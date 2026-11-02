package opensource.wax

import android.content.ContentValues
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.hardware.biometrics.BiometricPrompt
import android.os.*
import android.provider.MediaStore
import android.util.Log
import android.view.Display
import android.view.KeyEvent
import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.nio.file.Files
import java.util.concurrent.Executors
import java.util.concurrent.LinkedBlockingQueue
import java.util.concurrent.TimeUnit

class MainActivity : FlutterActivity() {

    private val pool = Executors.newCachedThreadPool { runnable ->
        Thread(runnable).also { it.isDaemon = true }
    }
    private val uiThreadHandler = Handler(Looper.getMainLooper())

    private val notImplementedToken = Any()

    private fun MethodChannel.Result.withCoroutine(exec: () -> Any?) {
        pool.submit {
            try {
                val data = exec()
                uiThreadHandler.post {
                    when (data) {
                        notImplementedToken -> notImplemented()
                        is Unit, null -> success(null)
                        else -> success(data)
                    }
                }
            } catch (e: Exception) {
                Log.e("Method", "Exception", e)
                uiThreadHandler.post {
                    error("", e.message, "")
                }
            }
        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "methods"
        ).setMethodCallHandler { call, result ->
            result.withCoroutine {
                when (call.method) {
                    "saveImageToGallery" -> {
                        saveImage(call.argument("path")!!)
                    }
                    "androidGetModes" -> modes()
                    "androidSetMode" -> setMode(call.argument("mode")!!)
                    "androidGetVersion" -> Build.VERSION.SDK_INT
                    "dataLocal" -> androidDataLocal()
                    "migrate" -> androidMigrate(call.argument("path")!!)
                    "androidGetExtendDirs" -> androidGetExtendDirs()
                    "androidSecureFlag" -> androidSecureFlag(call.argument("flag")!!)
                    "verifyAuthentication" -> auth()
                    else -> notImplementedToken
                }
            }
        }

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, "volume_button")
            .setStreamHandler(volumeStreamHandler)
    }

    private fun androidDataLocal(): String {
        val localFile = File(context!!.filesDir.absolutePath, "data.local")
        if (localFile.exists()) {
            val path = String(FileInputStream(localFile).use { it.readBytes() })
            if (File(path).isDirectory) {
                return path
            }
        }
        return context!!.filesDir.absolutePath
    }

    private fun androidGetExtendDirs(): String {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
            val result = context!!.getExternalFilesDirs("")?.toMutableList()?.also {
                it.add(context!!.filesDir.absoluteFile)
            }?.joinToString("|")
            if (result != null) {
                return result
            }
        }
        throw Exception("System version too low")
    }

    private fun androidMigrate(path: String) {
        val current = androidDataLocal()
        if (current == path) {
            return
        }
        if (File(current, "data.local").exists()) {
            File(current, "data.local").delete()
        }
        val target = File(path)
        if (!target.exists()) {
            target.mkdirs()
        }
        target.listFiles()?.forEach { delete(it) }
        File(current).listFiles()?.forEach {
            move(it, File(target, it.name))
        }
        val localFile = File(context!!.filesDir.absolutePath, "data.local")
        if (path == context!!.filesDir.absolutePath) {
            localFile.delete()
        } else {
            FileOutputStream(localFile).use { it.write(path.toByteArray()) }
        }
    }

    private fun delete(f: File) {
        f.delete()
    }

    private fun move(f: File, t: File) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            if (f.isDirectory) {
                Files.createDirectories(t.toPath())
                f.listFiles()?.forEach { move(it, File(t, it.name)) }
                Files.delete(f.toPath())
            } else {
                Files.move(f.toPath(), t.toPath())
            }
        } else {
            if (f.isDirectory) {
                t.mkdirs()
                f.listFiles()?.forEach { move(it, File(t, it.name)) }
                f.delete()
            } else {
                FileOutputStream(t).use { o ->
                    FileInputStream(f).use { i ->
                        o.write(i.readBytes())
                    }
                }
                f.delete()
            }
        }
    }

    private fun saveImage(path: String) {
        BitmapFactory.decodeFile(path)?.let { bitmap ->
            val contentValues = ContentValues().apply {
                put(MediaStore.MediaColumns.DISPLAY_NAME, System.currentTimeMillis().toString())
                put(MediaStore.MediaColumns.MIME_TYPE, "image/jpeg")
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                    put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_PICTURES)
                    put(MediaStore.MediaColumns.IS_PENDING, 1)
                }
            }
            contentResolver.insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, contentValues)
                ?.let { uri ->
                    contentResolver.openOutputStream(uri)?.use { fos ->
                        bitmap.compress(Bitmap.CompressFormat.JPEG, 100, fos)
                    }
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                        contentValues.clear()
                        contentValues.put(MediaStore.Video.Media.IS_PENDING, 0)
                        contentResolver.update(uri, contentValues, null, null)
                    }
                }
        }
    }

    private fun mixDisplay(): Display? {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            display?.let { return it }
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            windowManager.defaultDisplay?.let { return it }
        }
        return null
    }

    private fun modes(): List<String> {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            mixDisplay()?.let { display ->
                return display.supportedModes.map { mode -> mode.toString() }
            }
        }
        return ArrayList()
    }

    private fun setMode(string: String) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            mixDisplay()?.let { display ->
                if (string == "") {
                    uiThreadHandler.post {
                        window.attributes = window.attributes.also { attr ->
                            attr.preferredDisplayModeId = 0
                        }
                    }
                    return
                }
                display.supportedModes.forEach { mode ->
                    if (mode.toString() == string) {
                        uiThreadHandler.post {
                            window.attributes = window.attributes.also { attr ->
                                attr.preferredDisplayModeId = mode.modeId
                            }
                        }
                        return
                    }
                }
            }
        }
    }

    private var volumeEvents: EventChannel.EventSink? = null

    private val volumeStreamHandler = object : EventChannel.StreamHandler {
        override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
            volumeEvents = events
        }

        override fun onCancel(arguments: Any?) {
            volumeEvents = null
        }
    }

    override fun onKeyDown(keyCode: Int, event: KeyEvent?): Boolean {
        volumeEvents?.let {
            if (keyCode == KeyEvent.KEYCODE_VOLUME_DOWN) {
                uiThreadHandler.post { it.success("DOWN") }
                return true
            }
            if (keyCode == KeyEvent.KEYCODE_VOLUME_UP) {
                uiThreadHandler.post { it.success("UP") }
                return true
            }
        }
        return super.onKeyDown(keyCode, event)
    }

    private fun androidSecureFlag(flag: Boolean) {
        uiThreadHandler.post {
            if (flag) {
                window.setFlags(
                    WindowManager.LayoutParams.FLAG_SECURE,
                    WindowManager.LayoutParams.FLAG_SECURE
                )
            } else {
                window.clearFlags(WindowManager.LayoutParams.FLAG_SECURE)
            }
        }
    }

    private fun auth(): Boolean {
        val queue = LinkedBlockingQueue<Boolean>()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            val prompt = BiometricPrompt.Builder(this)
                .setTitle("验证身份")
                .setDescription("需要验证您的身份")
                .setNegativeButton("取消", mainExecutor) { _, _ -> queue.add(false) }
                .build()
            val cancellation = CancellationSignal()
            cancellation.setOnCancelListener { queue.add(false) }
            val callback = object : BiometricPrompt.AuthenticationCallback() {
                override fun onAuthenticationError(errorCode: Int, errString: CharSequence?) {
                    super.onAuthenticationError(errorCode, errString)
                    queue.add(false)
                }

                override fun onAuthenticationFailed() {
                    super.onAuthenticationFailed()
                    queue.add(false)
                }

                override fun onAuthenticationSucceeded(result: BiometricPrompt.AuthenticationResult?) {
                    super.onAuthenticationSucceeded(result)
                    queue.add(true)
                }
            }
            prompt.authenticate(cancellation, mainExecutor, callback)
        } else {
            queue.add(false)
        }
        return queue.poll(5, TimeUnit.MINUTES) ?: false
    }
}
