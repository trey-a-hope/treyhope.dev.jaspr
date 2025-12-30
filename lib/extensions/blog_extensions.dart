import 'package:treyhope_dev/models/blog.dart';

/// Extension methods for the Blog model
extension BlogExtensions on Blog {
  /// Generates meta tags for SEO and social media sharing
  Map<String, String> get meta => {
    // Basic SEO meta tags
    'description': excerpt,
    'keywords': tags.join(', '),

    // Open Graph meta tags for social sharing
    'og:title': title,
    'og:description': excerpt,
    'og:type': 'article',
    'og:url': 'https://treyhope.dev/blog/$slug',
    'og:image': 'https://upload.wikimedia.org/wikipedia/commons/9/91/Pizza-3007395.jpg', // TODO (Trey) - Update

    // Twitter Card meta tags
    'twitter:card': 'summary_large_image',
    'twitter:title': title,
    'twitter:description': excerpt,
    'twitter:image': 'https://upload.wikimedia.org/wikipedia/commons/9/91/Pizza-3007395.jpg', // TODO (Trey) - Update
  };
}
