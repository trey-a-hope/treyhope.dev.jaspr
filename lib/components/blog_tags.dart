import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/smart_link.dart';
import 'package:treyhope_dev/models/blog.dart';

/// Displays a list of clickable blog tags as links.
/// Each tag navigates to a filtered view of blogs with that tag.
class BlogTags extends StatelessComponent {
  final Blog blog;

  const BlogTags({super.key, required this.blog});

  @override
  Component build(BuildContext context) {
    return div(classes: 'blog-card-tags', [
      // Render each tag as a clickable link with hashtag prefix
      for (int i = 0; i < blog.tags.length; i++)
        SmartLink(
          href: '/blog/tags/${blog.tags[i]}',
          children: [.text('#${blog.tags[i]}')],
        ),
    ]);
  }

  /// Styles for the tag container with flex layout
  @css
  static List<StyleRule> get styles => [
    css('.blog-card-tags').styles(
      display: Display.flex,
      flexWrap: FlexWrap.wrap,
      gap: Gap(column: 0.5.rem),
    ),
  ];
}
