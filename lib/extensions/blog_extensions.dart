import 'package:treyhope_dev/extensions/datetime_extensions.dart';
import 'package:treyhope_dev/models/blog.dart';

/// Extension methods for the Blog model
extension BlogExtensions on Blog {
  /// Generates meta tags for SEO and social media sharing
  Map<String, String> get meta {
    final image = 'https://treyhope.dev/blogs/${date.formatDateString}-${slug}/${coverImage}';

    return {
      // Basic SEO meta tags
      'description': excerpt,
      'keywords': tags.join(', '),

      // Open Graph meta tags for social sharing
      'og:title': title,
      'og:description': excerpt,
      'og:type': 'article',
      'og:url': 'https://treyhope.dev/blog/$slug',
      'og:image': image,

      // Twitter Card meta tags
      'twitter:card': 'summary_large_image',
      'twitter:title': title,
      'twitter:description': excerpt,
      'twitter:image': image,
    };
  }

  String get getShareLink {
    final url = 'https://treyhope.dev/blog/$slug';
    return 'https://twitter.com/intent/tweet?text=${Uri.encodeComponent('New blog post!\n$title\n')}&url=${Uri.encodeComponent(url)}';
  }
}
