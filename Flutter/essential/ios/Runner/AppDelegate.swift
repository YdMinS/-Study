import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
  let controller: FlutterViewController = window!.rootViewController! as! FlutterViewController

  // message channel
  let channel = FlutterBasicMessageChannel(
    name: "messageChannelA",
    binaryMessenger: controller.binaryMessenger,
    codec: FlutterStringCodec.sharedInstance()
  )
      channel.setMessageHandler{
          (message: Any?, reply: FlutterReply) -> Void in reply("Hi from iOS")
          channel.sendMessage("This is ios native"){
              (reply: Any?) -> Void in print("%@", reply as! String)
          }
      }

  // method channel
  let methodChannel = FlutterMethodChannel(
      name: "methodChannelA",
      binaryMessenger: controller.binaryMessenger
  )

  methodChannel.setMethodCallHandler({
    (call: FlutterMethodCall, result: @escaping FlutterResult) in
             switch call.method {
             case "methodA":
            let argument = call.arguments as? Dictionary<String, Any>
            let resultArg = ["one":30, "two":40]
            result(resultArg)

        methodChannel.invokeMethod("methodB", arguments: "Hi from iOS"){
            (result: Any?) -> Void in
            if let error = result as? FlutterError{
            } else if FlutterMethodNotImplemented.isEqual(result){
            } else {
                print("%@", result as! String)
            }
        }
        default: break;
    }
  })

  GeneratedPluginRegistrant.register(with: self)
  return super.application(application, didFinishLaunchingWithOptions: launchOptions)
}
}