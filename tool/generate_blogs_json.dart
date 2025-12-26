import 'dart:convert';
import 'dart:io';

import '../lib/utils/blog_loader.dart';

// Import your blog loader

void main() async {
  print('🔄 Generating blogs.json...');

  // Load all blogs from filesystem
  final blogs = await BlogLoader.loadAllBlogs();

  // Convert to JSON
  final json = jsonEncode(blogs.map((b) => b.toJson()).toList());

  // Write to web directory
  final file = File('web/blogs.json');
  await file.create(recursive: true);
  await file.writeAsString(json);

  print('Generated blogs.json with ${blogs.length} blogs');
}


// run "dart run tool/generate_blogs_json.dart" to sync blogs.json with content/blogs/ dir
// When determine slugs for blogs, grab the first 5 words in the title

// For Claude to update images

  // Option 1: Simple Request Pattern

  // You can just ask me something like:
  // - "Update images to local paths for the [directory-name] blog post"
  // - "Convert Medium URLs to local images in content/blogs/2024-05-23-coffee-code-working-with-nakama/"

  // And I'll do the same process.