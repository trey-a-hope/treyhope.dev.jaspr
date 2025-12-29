import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:treyhope_dev/components/blog_category_selector.dart';
import 'package:treyhope_dev/components/blog_panel.dart';
import 'package:treyhope_dev/components/bulma_pagination.dart';
import 'package:treyhope_dev/components/scaffold.dart';
import 'package:treyhope_dev/components/spacer.dart';
import 'package:treyhope_dev/riverpod/providers.dart';

/// Blog page entry point with Riverpod provider scope

/// Main blog view component that displays blog posts with pagination
class BlogsTagPage extends StatelessComponent {
  final String tag;

  const BlogsTagPage({required this.tag, super.key});

  @override
  Component build(BuildContext context) {
    final blogList = context.watch(blogListProvider('tags'));

    return Scaffold(
      title: 'Posts Tagged with "#${tag}"',
      subtitle: '',
      sections: [
        section(classes: 'section has-background-dark', [
          Spacer(.xl),
          div(classes: 'container', [
            div(classes: 'is-multiline columns', [
              for (final blog in blogList.blogs)
                div(
                  classes: 'column is-12-mobile is-6-tablet is-4-desktop',
                  [
                    // Responsive columns
                    // Applying key to BlogPanel to prevent old blog posts from being re-rendered
                    BlogPanel(key: ValueKey(blog.slug), blog: blog),
                  ],
                ),
            ]),
          ]),
          Spacer(.xl),
          div(classes: 'container', [
            BulmaPagination(
              key: ValueKey('${blogList.currentIndex}'),
              currentIndex: blogList.currentIndex,
              type: 'tags',
            ),
          ]),
        ]),
      ],
    );
  }
}
