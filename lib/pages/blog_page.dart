import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/server.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:treyhope_dev/components/blog_card.dart';
import 'package:treyhope_dev/components/bulma_hero.dart';
import 'package:treyhope_dev/components/bulma_pagination.dart';
import 'package:treyhope_dev/riverpod/providers.dart';

/// Blog page entry point with Riverpod provider scope
@client
class BlogPage extends StatelessComponent {
  const BlogPage({super.key});

  @override
  Component build(BuildContext context) {
    return ProviderScope(
      overrides: [blogListProvider],
      child: BlogView(),
    );
  }
}

/// Main blog view component that displays blog posts with pagination
class BlogView extends StatelessComponent {
  const BlogView({super.key});

  @css
  static List<StyleRule> get styles => [];

  @override
  Component build(BuildContext context) {
    final state = context.watch(blogListProvider);

    return div(classes: 'container is-max-desktop', [
      BulmaHero(title: 'Blog', subtitle: 'Thoughts on code, culture, and everything in between.'),
      section(classes: 'container is-max-desktop section', [
        // Render blog cards
        for (final blog in state.blogs) BlogCard(blog: blog),
        // Pagination controls
        BulmaPagination(key: ValueKey(state.currentIndex), currentIndex: state.currentIndex),
      ]),
    ]);
  }
}
