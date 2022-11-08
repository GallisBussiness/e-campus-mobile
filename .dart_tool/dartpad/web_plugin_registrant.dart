// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// @dart = 2.13
// ignore_for_file: type=lint

import 'package:audioplayer_web/audioplayer_web.dart';
import 'package:audioplayers_web/audioplayers_web.dart';
import 'package:camera_web/camera_web.dart';
import 'package:flutter_native_splash/flutter_native_splash_web.dart';
import 'package:mobile_scanner/mobile_scanner_web_plugin.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  AudioplayerPlugin.registerWith(registrar);
  AudioplayersPlugin.registerWith(registrar);
  CameraPlugin.registerWith(registrar);
  FlutterNativeSplashWeb.registerWith(registrar);
  MobileScannerWebPlugin.registerWith(registrar);
  SharedPreferencesPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
