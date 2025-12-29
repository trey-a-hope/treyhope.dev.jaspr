import 'package:treyhope_dev/models/blog.dart';

extension BlogExtensions on Blog {
  Map<String, String> get meta => {
    'description': excerpt,
    'keywords': tags.join(', '),
    'og:title': title,
    'og:description': excerpt,
    'og:type': 'article',
    'og:url': 'https://treyhope.dev/blog/$slug',
    'og:image': 'https://upload.wikimedia.org/wikipedia/commons/9/91/Pizza-3007395.jpg', // TODO (Trey) - Update
    'twitter:card': 'summary_large_image',
    'twitter:title': title,
    'twitter:description': excerpt,
    'twitter:image': 'https://upload.wikimedia.org/wikipedia/commons/9/91/Pizza-3007395.jpg', // TODO (Trey) - Update
  };
}
