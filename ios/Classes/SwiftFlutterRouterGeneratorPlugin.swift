import Flutter
import UIKit

public class SwiftFlutterRouterGeneratorPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_router_generator", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterRouterGeneratorPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
