import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_router_generator_platform_interface.dart';

/// An implementation of [FlutterRouterGeneratorPlatform] that uses method channels.
class MethodChannelFlutterRouterGenerator extends FlutterRouterGeneratorPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_router_generator');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
