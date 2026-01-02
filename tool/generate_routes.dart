import 'dart:io';

import 'package:treyhope_dev/constants/globals.dart';
import 'package:treyhope_dev/utils/blog_loader.dart';

void main() async {
  print('🔄 Generating routes in pubspec.yaml...');

  Globals.allBlogs = await BlogLoader.loadAllBlogs();

  final routes = [
    '/',
    '/about',
    '/projects',
    '/code-flows',
    '/blog',
    // Generate blog routes
    ...Globals.allBlogs.map((blog) => '/blog/${blog.slug}'),
    // Generate tag routes
    ...Globals.allBlogs.expand((blog) => blog.tags).toSet().map((tag) => '/blog/tags/$tag'),
  ];

  // Read the current pubspec.yaml
  final pubspecFile = File('pubspec.yaml');
  final lines = await pubspecFile.readAsLines();

  // Find the jaspr: section and update/add targets
  final updatedLines = <String>[];
  var inTargetsSection = false;
  var inJasprSection = false;
  var targetsFound = false;

  for (var i = 0; i < lines.length; i++) {
    final line = lines[i];

    // Check if we're entering the jaspr: section
    if (line.trim() == 'jaspr:') {
      inJasprSection = true;
      updatedLines.add(line);
      continue;
    }

    // Check for targets: under jaspr:
    if (inJasprSection && line.trim() == 'targets:') {
      inTargetsSection = true;
      targetsFound = true;
      updatedLines.add(line);

      // Add all the generated routes
      for (final route in routes) {
        updatedLines.add('    - $route');
      }
      continue;
    }

    if (inTargetsSection) {
      // Skip old target entries (lines starting with '    - ')
      if (line.startsWith('    - ')) {
        continue;
      } else {
        // End of targets section
        inTargetsSection = false;
        inJasprSection = false;
      }
    }

    // If we're at the end of jaspr section without finding targets, add them
    if (inJasprSection && !targetsFound && !line.startsWith('  ') && line.trim().isNotEmpty && line.contains(':')) {
      // We've reached the next top-level section, add targets before it
      updatedLines.add('  targets:');
      for (final route in routes) {
        updatedLines.add('    - $route');
      }
      updatedLines.add('');
      targetsFound = true;
      inJasprSection = false;
    }

    updatedLines.add(line);
  }

  // If we finished and still haven't added targets (jaspr was last section)
  if (inJasprSection && !targetsFound) {
    updatedLines.add('  targets:');
    for (final route in routes) {
      updatedLines.add('    - $route');
    }
  }

  // Write back to pubspec.yaml
  await pubspecFile.writeAsString(updatedLines.join('\n'));

  print('✅ Updated pubspec.yaml with ${routes.length} routes');
}

// run "dart run tool/generate_routes.dart" to generate routes in pubspec.yaml
