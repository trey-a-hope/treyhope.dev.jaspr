// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:treyhope_dev/components/header.dart' deferred as _header;
import 'package:treyhope_dev/pages/about.dart' deferred as _about;
import 'package:treyhope_dev/pages/blog_page.dart' deferred as _blog_page;
import 'package:treyhope_dev/pages/code_flows.dart' deferred as _code_flows;
import 'package:treyhope_dev/pages/home.dart' deferred as _home;
import 'package:treyhope_dev/pages/page_not_found.dart'
    deferred as _page_not_found;
import 'package:treyhope_dev/pages/projects.dart' deferred as _projects;
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
  clients: {
    'header': ClientLoader(
      (p) => _header.Header(),
      loader: _header.loadLibrary,
    ),
    'about': ClientLoader((p) => _about.About(), loader: _about.loadLibrary),
    'blog_page': ClientLoader(
      (p) => _blog_page.BlogPage(),
      loader: _blog_page.loadLibrary,
    ),
    'code_flows': ClientLoader(
      (p) => _code_flows.CodeFlows(),
      loader: _code_flows.loadLibrary,
    ),
    'home': ClientLoader((p) => _home.Home(), loader: _home.loadLibrary),
    'page_not_found': ClientLoader(
      (p) => _page_not_found.PageNotFound(),
      loader: _page_not_found.loadLibrary,
    ),
    'projects': ClientLoader(
      (p) => _projects.Projects(),
      loader: _projects.loadLibrary,
    ),
  },
);
