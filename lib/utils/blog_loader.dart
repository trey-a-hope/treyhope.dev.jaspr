// lib/blog_loader.dart
import 'dart:io';
import 'package:treyhope_dev/models/blog.dart';

class BlogLoader {
  /// Loads all blog posts from the content/blogs directory
  static Future<List<Blog>> loadAllBlogs() async {
    final blogs = <Blog>[];
    final blogDir = Directory('content/blogs');

    // Check if directory exists
    if (!await blogDir.exists()) {
      print('Warning: Blog directory not found at ${blogDir.path}');
      return blogs;
    }

    // List all markdown files
    await for (final entity in blogDir.list()) {
      if (entity is File && entity.path.endsWith('.md')) {
        try {
          final content = await entity.readAsString();
          final blog = _parseMarkdownFile(content, entity.path);
          blogs.add(blog);
        } catch (e) {
          print('Error loading ${entity.path}: $e');
        }
      }
    }

    // Sort by date (newest first)
    blogs.sort((a, b) => b.date.compareTo(a.date));

    return blogs;
  }

  /// Parses a markdown file with frontmatter
  static Blog _parseMarkdownFile(String content, String filepath) {
    final parts = _extractFrontmatter(content);
    final metadata = parts['frontmatter'] ?? {};
    final body = parts['body'] ?? '';

    return Blog(
      title: metadata['title'] ?? 'Untitled',
      slug: metadata['slug'] ?? _slugFromPath(filepath),
      date: DateTime.tryParse(metadata['date'] ?? '') ?? DateTime.now(),
      author: metadata['author'] ?? '',
      tags: (metadata['tags'] as String?)?.split(',').map((t) => t.trim()).toList() ?? [],
      excerpt: metadata['excerpt'] ?? '',
      content: body.trim(),
    );
  }

  /// Extracts frontmatter and body from markdown content
  static Map<String, dynamic> _extractFrontmatter(String content) {
    final lines = content.split('\n');
    final metadata = <String, String>{};
    final bodyLines = <String>[];

    bool inFrontmatter = false;
    bool frontmatterEnded = false;

    for (final line in lines) {
      if (line.trim() == '---') {
        if (!inFrontmatter) {
          inFrontmatter = true;
          continue;
        } else {
          inFrontmatter = false;
          frontmatterEnded = true;
          continue;
        }
      }

      if (inFrontmatter) {
        final colonIndex = line.indexOf(':');
        if (colonIndex != -1) {
          final key = line.substring(0, colonIndex).trim();
          final value = line.substring(colonIndex + 1).trim();
          metadata[key] = value;
        }
      } else if (frontmatterEnded) {
        bodyLines.add(line);
      }
    }

    return {
      'frontmatter': metadata,
      'body': bodyLines.join('\n'),
    };
  }

  /// Generates a slug from the filepath
  static String _slugFromPath(String path) {
    final filename = path.split('/').last;
    return filename.replaceAll('.md', '').replaceAll(RegExp(r'^\d{4}-\d{2}-\d{2}-'), ''); // Remove date prefix
  }
}
