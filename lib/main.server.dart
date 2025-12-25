/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
/// To run code on the client, check the `main.client.dart` file.
library;

import 'package:jaspr/dom.dart';
// Server-specific Jaspr import.
import 'package:jaspr/server.dart';
import 'package:treyhope_dev/constants/globals.dart';
import 'package:treyhope_dev/utils/blog_loader.dart';

// Imports the [App] component.
import 'app.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';

void main() async {
  // Initializes the server environment with the generated default options.
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  Globals.allBlogs = await BlogLoader.loadAllBlogs();

  // Starts the app.
  //
  // [Document] renders the root document structure (<html>, <head> and <body>)
  // with the provided parameters and components.
  runApp(
    Document(
      title: 'treyhope_dev',
      styles: [
        // Special import rule to include to another css file.
        css.import('https://fonts.googleapis.com/css?family=Roboto'),
        // Each style rule takes a valid css selector and a set of styles.
        // Styles are defined using type-safe css bindings and can be freely chained and nested.
        css('html, body').styles(
          width: 100.percent,
          minHeight: 100.vh,
          padding: .zero,
          margin: .zero,
          fontFamily: const .list([FontFamily('Roboto'), FontFamilies.sansSerif]),
        ),
        css('h1').styles(
          margin: .unset,
          fontSize: 4.rem,
        ),
      ],
      head: [
        // The generated flutter manifest and bootstrap script.
        const link(rel: 'manifest', href: 'manifest.json'),
        link(rel: 'stylesheet', href: 'https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/bulma.min.css'),
        link(rel: 'stylesheet', href: 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css'),
        const script(src: "flutter_bootstrap.js", async: true),
      ],
      body: const App(),
    ),
  );
}
