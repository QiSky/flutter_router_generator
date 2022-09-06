#include "include/flutter_router_generator/flutter_router_generator_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_router_generator_plugin.h"

void FlutterRouterGeneratorPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_router_generator::FlutterRouterGeneratorPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
