// lib/blog_loader.dart
import 'dart:io';
import 'package:treyhope_dev/models/blog.dart';

class BlogLoader {
  /// Loads all blog posts from the web/blogs directory
  static Future<List<Blog>> loadAllBlogs() async {
    final blogs = <Blog>[];
    final blogDir = Directory('web/blogs');

    // Check if directory exists
    if (!await blogDir.exists()) {
      print('Warning: Blog directory not found at ${blogDir.path}');
      return blogs;
    }

    // List all subdirectories (each represents a blog post)
    await for (final entity in blogDir.list()) {
      if (entity is Directory) {
        try {
          // Look for index.md in each directory
          final indexFile = File('${entity.path}/index.md');

          if (await indexFile.exists()) {
            final content = await indexFile.readAsString();
            final blog = _parseMarkdownFile(content, entity.path);
            blogs.add(blog);
          } else {
            print('Warning: No index.md found in ${entity.path}');
          }
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
  static Blog _parseMarkdownFile(String content, String directoryPath) {
    final parts = _extractFrontmatter(content);
    final metadata = parts['frontmatter'] ?? {};
    final body = parts['body'] ?? '';

    // Get the directory name for image path transformation
    final dirName = directoryPath.split('/').last;

    // Transform relative image paths to absolute paths
    final transformedBody = _transformImagePaths(body, dirName);

    return Blog(
      title: metadata['title'] ?? 'Untitled',
      slug: metadata['slug'] ?? _slugFromPath(directoryPath),
      date: DateTime.tryParse(metadata['date'] ?? '') ?? DateTime.now(),
      author: metadata['author'] ?? '',
      tags: (metadata['tags'] as String?)?.split(',').map((t) => t.trim()).toList() ?? [],
      description: metadata['description'] ?? '',
      content: transformedBody.trim(),
      category: metadata['category'] ?? '', // Added category property
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

  /// Generates a slug from the directory path
  static String _slugFromPath(String path) {
    final dirname = path.split('/').last;
    // Remove date prefix (e.g., "2024-04-27-")
    return dirname.replaceAll(RegExp(r'^\d{4}-\d{2}-\d{2}-'), '');
  }

  /// Transforms relative image paths to absolute paths
  /// Converts: ![alt](./image.jpg) -> ![alt](/blogs/directory-name/image.jpg)
  static String _transformImagePaths(String content, String dirName) {
    // Match markdown image syntax: ![alt text](./path/to/image.ext)
    final imageRegex = RegExp(r'!\[([^\]]*)\]\(\.\/([^)]+)\)');

    return content.replaceAllMapped(imageRegex, (match) {
      final altText = match.group(1) ?? '';
      final imagePath = match.group(2) ?? '';

      // Transform to absolute path
      return '![$altText](/blogs/$dirName/$imagePath)';
    });
  }
}
