import Flutter
import LocalAuthentication
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    let applicationSupportsPath = NSSearchPathForDirectoriesInDomains(
      .applicationSupportDirectory, .userDomainMask, true)[0]

    let controller = self.window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(
      name: "methods", binaryMessenger: controller.binaryMessenger)

    channel.setMethodCallHandler { (call, result) in
      let finish: (Any?) -> Void = { value in
        DispatchQueue.main.async { result(value) }
      }
      if call.method == "verifyAuthentication" {
        let context = LAContext()
        let can = context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
        guard can == true else {
          finish(false)
          return
        }
        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "身份验证") { success, _ in
          finish(success)
        }
      } else if call.method == "saveImageToGallery" {
        Thread {
          if let args = call.arguments as? [String: Any],
            let path = args["path"] as? String
          {
            do {
              let imageData = try Data(contentsOf: URL(fileURLWithPath: path))
              if let uiImage = UIImage(data: imageData) {
                UIImageWriteToSavedPhotosAlbum(uiImage, nil, nil, nil)
                finish("OK")
              } else {
                finish(FlutterError(code: "", message: "Error loading image ", details: ""))
              }
            } catch {
              finish(FlutterError(code: "", message: "Error loading image : \(error)", details: ""))
            }
          } else {
            finish(FlutterError(code: "", message: "params error", details: ""))
          }
        }.start()
      } else if call.method == "iosGetDocumentDir" {
        finish(documentsPath)
      } else if call.method == "iosGetApplicationSupportDir" {
        finish(applicationSupportsPath)
      } else {
        finish(FlutterMethodNotImplemented)
      }
    }

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
