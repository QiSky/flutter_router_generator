#import "FlutterRouterGeneratorPlugin.h"
#if __has_include(<flutter_router_generator/flutter_router_generator-Swift.h>)
#import <flutter_router_generator/flutter_router_generator-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_router_generator-Swift.h"
#endif

@implementation FlutterRouterGeneratorPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterRouterGeneratorPlugin registerWithRegistrar:registrar];
}
@end
