import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:treyhope_dev/components/blog_category_selector.dart';
import 'package:treyhope_dev/components/blog_panel.dart';
import 'package:treyhope_dev/components/bulma_hero.dart';
import 'package:treyhope_dev/components/bulma_pagination.dart';
import 'package:treyhope_dev/components/spacer.dart';
import 'package:treyhope_dev/riverpod/providers.dart';

/// Blog page entry point with Riverpod provider scope

/// Main blog view component that displays blog posts with pagination
class BlogsPage extends StatelessComponent {
  const BlogsPage({super.key});

  @override
  Component build(BuildContext context) {
    final currentCategory = context.watch(blogCategoryProvider);
    final blogList = context.watch(blogListProvider);

    return div(classes: 'container is-max-desktop', [
      BulmaHero(title: 'Blog', subtitle: 'Thoughts on code, culture, and everything in between.'),
      Spacer(.xl),
      section(classes: 'section', [
        BlogCategorySelector(),
        Spacer(.xl),
        p(classes: 'has-text-centered', [
          .text(currentCategory.description),
        ]),
      ]),
      div(classes: 'container is-multiline columns is-mobile', [
        // Add is-mobile
        // Render blog cards
        for (final blog in blogList.blogs)
          div(classes: 'column is-12-mobile is-6-tablet is-4-desktop', [
            // Responsive columns
            // Applying key to BlogPanel to prevent old blog posts from being re-rendered
            BlogPanel(key: ValueKey(blog.slug), blog: blog),
          ]),
        // Pagination controls
      ]),
      div(classes: 'container section', [
        BulmaPagination(
          key: ValueKey('${blogList.currentIndex}-${currentCategory.name}'), // Add category to key
          currentIndex: blogList.currentIndex,
        ),
      ]),
    ]);
  }
}
