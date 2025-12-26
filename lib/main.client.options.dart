// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:treyhope_dev/app.dart' deferred as _app;
import 'package:webview_flutter_web/webview_flutter_web.dart'
    as _webview_flutter_web;

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
    _webview_flutter_web.WebWebViewPlatform.registerWith(registrar);
    registrar.registerMessageHandler();
  },
  clients: {'app': ClientLoader((p) => _app.App(), loader: _app.loadLibrary)},
);
