import 'dart:convert';
import 'dart:io';

// Import your blog loader
import 'package:treyhope_dev/utils/blog_loader.dart';

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
