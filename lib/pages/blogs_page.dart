import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:treyhope_dev/components/blog_panel.dart';
import 'package:treyhope_dev/components/bulma_hero.dart';
import 'package:treyhope_dev/components/bulma_pagination.dart';
import 'package:treyhope_dev/components/spacer.dart';
import 'package:treyhope_dev/riverpod/providers.dart';

/// Blog page entry point with Riverpod provider scope
@client
class BlogsPage extends StatelessComponent {
  const BlogsPage({super.key});

  @override
  Component build(BuildContext context) {
    return ProviderScope(
      overrides: [blogListProvider],
      child: BlogsView(),
    );
  }
}

/// Main blog view component that displays blog posts with pagination
class BlogsView extends StatelessComponent {
  const BlogsView({super.key});

  @css
  static List<StyleRule> get styles => [];

  @override
  Component build(BuildContext context) {
    final state = context.watch(blogListProvider);

    return div(classes: 'container is-max-desktop', [
      BulmaHero(title: 'Blog', subtitle: 'Thoughts on code, culture, and everything in between.'),
      Spacer(.md),
      div(classes: 'container is-multiline columns', [
        // Render blog cards
        for (final blog in state.blogs)
          div(classes: 'column is-half', [
            // Applying key to BlogPanel to prevent old blog posts from being re-rendered
            BlogPanel(key: ValueKey(blog.slug), blog: blog),
          ]),
        // Pagination controls
      ]),
      div(classes: 'container section', [
        BulmaPagination(key: ValueKey(state.currentIndex), currentIndex: state.currentIndex),
      ]),
    ]);
  }
}
