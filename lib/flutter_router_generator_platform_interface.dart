import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_router_generator_method_channel.dart';

abstract class FlutterRouterGeneratorPlatform extends PlatformInterface {
  /// Constructs a FlutterRouterGeneratorPlatform.
  FlutterRouterGeneratorPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterRouterGeneratorPlatform _instance = MethodChannelFlutterRouterGenerator();

  /// The default instance of [FlutterRouterGeneratorPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterRouterGenerator].
  static FlutterRouterGeneratorPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterRouterGeneratorPlatform] when
  /// they register themselves.
  static set instance(FlutterRouterGeneratorPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
