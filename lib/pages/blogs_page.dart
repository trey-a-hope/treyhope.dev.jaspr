import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:treyhope_dev/components/blog_panel.dart';
import 'package:treyhope_dev/components/bulma_hero.dart';
import 'package:treyhope_dev/components/bulma_pagination.dart';
import 'package:treyhope_dev/components/spacer.dart';
import 'package:treyhope_dev/riverpod/providers.dart';

/// Blog page entry point with Riverpod provider scope

/// Main blog view component that displays blog posts with pagination
class BlogsPage extends StatelessComponent {
  static const _coffeeCodeDescription =
      'Recent progress I\'ve made on various projects. Quick reads about Flutter, APIs,  and much more, all while enjoying a cup of Joe.';
  static const _crashCoursesDescription =
      'Extensive tutorials curated by yours truly. Teaching you a wide variety of mobile/web development topics.';

  const BlogsPage({super.key});

  @css
  static List<StyleRule> get styles => [];

  @override
  Component build(BuildContext context) {
    final state = context.watch(blogListProvider);

    return div(classes: 'container is-max-desktop', [
      BulmaHero(title: 'Blog', subtitle: 'Thoughts on code, culture, and everything in between.'),
      Spacer(.xl),
      section(classes: 'section', [
        BlogCategorySelector(),
        Spacer(.xl),
        p(classes: 'has-text-centered', [
          .text(_coffeeCodeDescription),
        ]),
      ]),
      div(classes: 'container is-multiline columns is-mobile', [
        // Add is-mobile
        // Render blog cards
        for (final blog in state.blogs)
          div(classes: 'column is-12-mobile is-6-tablet is-4-desktop', [
            // Responsive columns
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

class BlogCategorySelector extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return div(classes: 'has-text-centered', [
      // Add centered container
      div(classes: 'select', [
        // Remove is-centered from here
        select([
          option([
            .text('All'),
          ]),
          option([
            .text('Coffee & Code'),
          ]),
          option([
            .text('Crash Courses'),
          ]),
        ]),
      ]),
    ]);
  }
}
