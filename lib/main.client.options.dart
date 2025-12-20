// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:audioplayers_web/audioplayers_web.dart' as _audioplayers_web;
import 'package:treyhope_dev/pages/about.dart' deferred as _about;
import 'package:treyhope_dev/pages/home.dart' deferred as _home;
import 'package:url_launcher_web/url_launcher_web.dart' as _url_launcher_web;

/// Default [ClientOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.client.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultClientOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ClientOptions get defaultClientOptions => ClientOptions(
  initialize: () {
    final Registrar registrar = webPluginRegistrar;
    _url_launcher_web.UrlLauncherPlugin.registerWith(registrar);
    _audioplayers_web.AudioplayersPlugin.registerWith(registrar);
    registrar.registerMessageHandler();
  },
  clients: {
    'about': ClientLoader((p) => _about.About(), loader: _about.loadLibrary),
    'home': ClientLoader((p) => _home.Home(), loader: _home.loadLibrary),
  },
);
