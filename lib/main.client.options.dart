// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';

import 'package:treyhope_dev/pages/about.dart' deferred as _about;
import 'package:treyhope_dev/pages/blog.dart' deferred as _blog;
import 'package:treyhope_dev/pages/code_flows.dart' deferred as _code_flows;
import 'package:treyhope_dev/pages/home.dart' deferred as _home;
import 'package:treyhope_dev/pages/page_not_found.dart'
    deferred as _page_not_found;
import 'package:treyhope_dev/pages/projects.dart' deferred as _projects;

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
  clients: {
    'about': ClientLoader((p) => _about.About(), loader: _about.loadLibrary),
    'blog': ClientLoader((p) => _blog.Blog(), loader: _blog.loadLibrary),
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
