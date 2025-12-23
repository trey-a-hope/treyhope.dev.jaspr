// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:treyhope_dev/components/header.dart' as _header;
import 'package:treyhope_dev/components/work_history_card.dart'
    as _work_history_card;
import 'package:treyhope_dev/pages/about.dart' as _about;
import 'package:treyhope_dev/pages/blog.dart' as _blog;
import 'package:treyhope_dev/pages/code_flows.dart' as _code_flows;
import 'package:treyhope_dev/pages/home.dart' as _home;
import 'package:treyhope_dev/pages/page_not_found.dart' as _page_not_found;
import 'package:treyhope_dev/pages/projects.dart' as _projects;
import 'package:treyhope_dev/app.dart' as _app;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _header.Header: ClientTarget<_header.Header>('header'),
    _about.About: ClientTarget<_about.About>('about'),
    _blog.Blog: ClientTarget<_blog.Blog>('blog'),
    _code_flows.CodeFlows: ClientTarget<_code_flows.CodeFlows>('code_flows'),
    _home.Home: ClientTarget<_home.Home>('home'),
    _page_not_found.PageNotFound: ClientTarget<_page_not_found.PageNotFound>(
      'page_not_found',
    ),
    _projects.Projects: ClientTarget<_projects.Projects>('projects'),
  },
  styles: () => [
    ..._header.HeaderState.styles,
    ..._work_history_card.WorkHistoryCard.styles,
    ..._about.About.styles,
    ..._blog.Blog.styles,
    ..._code_flows.CodeFlows.styles,
    ..._page_not_found.PageNotFound.styles,
    ..._projects.Projects.styles,
    ..._app.App.styles,
  ],
);
