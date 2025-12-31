import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/constants/share_platform.dart';
import 'package:treyhope_dev/extensions/datetime_extensions.dart';
import 'package:treyhope_dev/models/blog.dart';

/// Extension methods for the Blog model
extension BlogExtensions on Blog {
  /// Generates meta tags for SEO and social media sharing
  List<Component> get metaTags {
    final image = 'https://treyhope.dev/blogs/${date.formatDateString}-${slug}/cover.jpg';
    final url = 'https://treyhope.dev/blog/$slug';

    return [
      // Basic SEO meta tags
      meta(name: 'description', content: description),
      meta(name: 'keywords', content: tags.join(', ')),

      // Open Graph meta tags (use 'property')
      meta(attributes: {'property': 'og:title', 'content': title}),
      meta(attributes: {'property': 'og:description', 'content': description}),
      meta(attributes: {'property': 'og:type', 'content': 'article'}),
      meta(attributes: {'property': 'og:url', 'content': url}),
      meta(attributes: {'property': 'og:image', 'content': image}),

      // Twitter Card meta tags
      meta(name: 'twitter:card', content: 'summary_large_image'),
      meta(attributes: {'property': 'twitter:domain', 'content': 'treyhope.dev'}),
      meta(attributes: {'property': 'twitter:url', 'content': url}),
      meta(name: 'twitter:title', content: title),
      meta(name: 'twitter:description', content: description),
      meta(name: 'twitter:image', content: image),
    ];
  }

  String getShareLink(SharePlatform platform) {
    final url = 'https://treyhope.dev/blog/$slug';

    switch (platform) {
      case SharePlatform.x:
        return 'https://twitter.com/intent/tweet?text=${Uri.encodeComponent('New blog post!\n$title\n')}&url=${Uri.encodeComponent(url)}';
      case SharePlatform.linkedIn:
        return 'https://www.linkedin.com/sharing/share-offsite/?url=${Uri.encodeComponent(url)}';
    }
  }
}
