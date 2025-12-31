import 'package:treyhope_dev/constants/globals.dart';
import 'package:treyhope_dev/utils/blog_loader.dart';

void main() async {
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

  final yamlContent =
      '''
targets:
${routes.map((r) => '  - $r').join('\n')}
''';

  print('Add this to your pubspec.yaml under jaspr:');
  print(yamlContent);
}

// run "dart run tool/generate_routes.dart" to generate routes in pubspec.yaml
