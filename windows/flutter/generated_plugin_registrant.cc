//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <file_selector_windows/file_selector_windows.h>
#include <local_auth_windows/local_auth_plugin.h>
#include <mantra_biometric/mantra_biometric_plugin.h>
#include <permission_handler_windows/permission_handler_windows_plugin.h>
#include <share_plus/share_plus_windows_plugin_c_api.h>
#include <smart_auth/smart_auth_plugin.h>
#include <url_launcher_windows/url_launcher_windows.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  FileSelectorWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FileSelectorWindows"));
  LocalAuthPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("LocalAuthPlugin"));
  MantraBiometricPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("MantraBiometricPlugin"));
  PermissionHandlerWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("PermissionHandlerWindowsPlugin"));
  SharePlusWindowsPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("SharePlusWindowsPluginCApi"));
  SmartAuthPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("SmartAuthPlugin"));
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
}
