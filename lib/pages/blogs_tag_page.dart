import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:treyhope_dev/components/blog_panel.dart';
import 'package:treyhope_dev/components/bulma_pagination.dart';
import 'package:treyhope_dev/components/scaffold.dart';
import 'package:treyhope_dev/components/spacer.dart';
import 'package:treyhope_dev/riverpod/providers.dart';

/// Page component that displays blog posts filtered by a specific tag
class BlogsTagPage extends StatelessComponent {
  /// The tag to filter blogs by
  final String tag;

  const BlogsTagPage({required this.tag, super.key});

  @override
  Component build(BuildContext context) {
    // Watch the blog list provider for the given tag
    final state = context.watch(blogListProvider(tag));

    // Extract state values for current page
    final paginatedBlogs = state.paginatedBlogs;
    final totalBlogCount = state.totalBlogCount;
    final currentIndex = state.currentIndex;

    return Scaffold(
      title: '"#${tag}"',
      subtitle: 'Found ${totalBlogCount} blogs with tag.',
      sections: [
        section(classes: 'section has-background-dark', [
          Spacer(.xl),
          div(classes: 'container', [
            // Responsive grid: full width on mobile, 2 columns on tablet, 3 on desktop
            div(classes: 'is-multiline columns', [
              for (final blog in paginatedBlogs)
                div(
                  classes: 'column is-12-mobile is-6-tablet is-4-desktop',
                  [
                    // Use blog slug as key for efficient re-rendering
                    BlogPanel(key: ValueKey(blog.slug), blog: blog),
                  ],
                ),
            ]),
          ]),
          Spacer(.xl),
          div(classes: 'container', [
            // Key combines index and tag to ensure proper updates when either changes
            BulmaPagination(
              key: ValueKey('${currentIndex}-${tag}'),
              currentIndex: currentIndex,
              tag: tag,
            ),
          ]),
        ]),
      ],
    );
  }
}
