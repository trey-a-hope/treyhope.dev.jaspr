/// The entrypoint for the **client** environment.
///
/// The [main] method will only be executed on the client when loading the page.
/// To run code on the server during pre-rendering, check the `main.server.dart` file.
library;

// Client-specific Jaspr import.
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jaspr/client.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:treyhope_dev/constants/globals.dart';
import 'package:treyhope_dev/models/blog.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.client.options.dart';

void main() async {
  // Initializes the client environment with the generated default options.
  Jaspr.initializeApp(
    options: defaultClientOptions,
  );

  try {
    final response = await http.get(Uri.parse('/blogs.json'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      Globals.allBlogs = data.map((item) => Blog.fromJson(item as Map<String, dynamic>)).toList();
      print('Loaded ${Globals.allBlogs.length} blogs on client');
    } else {
      print('Failed to load blogs: ${response.statusCode}');
      Globals.allBlogs = [];
    }
  } catch (e) {
    print('Error loading blogs: $e');
    Globals.allBlogs = [];
  }

  // Starts the app.
  //
  // [ClientApp] automatically loads and renders all components annotated with @client.
  //
  // You can wrap this with additional [InheritedComponent]s to share state across multiple
  // @client components if needed.
  runApp(
    ProviderScope(
      child: const ClientApp(),
    ),
  );
}
