// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:treyhope_dev/components/blog_panel.dart' as _blog_panel;
import 'package:treyhope_dev/components/blog_tags.dart' as _blog_tags;
import 'package:treyhope_dev/components/header.dart' as _header;
import 'package:treyhope_dev/components/work_history_card.dart'
    as _work_history_card;
import 'package:treyhope_dev/pages/blog_page.dart' as _blog_page;
import 'package:treyhope_dev/pages/code_flows.dart' as _code_flows;
import 'package:treyhope_dev/pages/page_not_found.dart' as _page_not_found;
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
  clients: {_app.App: ClientTarget<_app.App>('app')},
  styles: () => [
    ..._blog_panel.BlogPanel.styles,
    ..._blog_tags.BlogTags.styles,
    ..._header.HeaderState.styles,
    ..._work_history_card.WorkHistoryCard.styles,
    ..._blog_page.BlogView.styles,
    ..._code_flows.CodeFlows.styles,
    ..._page_not_found.PageNotFound.styles,
    ..._app.App.styles,
  ],
);
