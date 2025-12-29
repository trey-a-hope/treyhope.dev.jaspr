import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:treyhope_dev/constants/blog_category.dart';
import 'package:treyhope_dev/constants/globals.dart';
import 'package:treyhope_dev/riverpod/providers.dart';

/// Bulma-styled pagination component for navigating through blog posts
class BulmaPagination extends StatelessComponent {
  final int currentIndex;
  final String type;

  const BulmaPagination({
    super.key,
    required this.currentIndex,
    required this.type,
  });

  @override
  Component build(BuildContext context) {
    final blogListNotifier = context.read(blogListProvider(type).notifier);
    final currentCategory = context.watch(blogCategoryProvider);

    // Calculate total blog count directly based on current category
    final totalBlogCount = switch (currentCategory) {
      BlogCategory.all => Globals.allBlogs.length,
      BlogCategory.coffeeCode =>
        Globals.allBlogs.where((blog) => blog.category == BlogCategory.coffeeCode.label).length,
      BlogCategory.crashCourse =>
        Globals.allBlogs.where((blog) => blog.category == BlogCategory.crashCourse.label).length,
    };

    final pages = (totalBlogCount / Globals.blogPaginationCount).ceil();

    // Disable previous button on first page
    final isPreviousDisabled = currentIndex == 0;

    // Disable next button on last page
    final isNextDisabled = (currentIndex + 1) * Globals.blogPaginationCount >= totalBlogCount;

    return nav(classes: 'pagination', [
      // Previous button
      button(
        onClick: () {
          if (!isPreviousDisabled) {
            Future.microtask(() => blogListNotifier.prevBatch());
          }
          print('previous clicked');
        },
        classes: 'pagination-previous ${isPreviousDisabled ? 'is-disabled' : ''}',
        [.text('Previous')],
      ),
      // Next button
      button(
        onClick: () {
          if (!isNextDisabled) {
            Future.microtask(() => blogListNotifier.nextBatch());
          }
        },
        classes: 'pagination-next ${isNextDisabled ? 'is-disabled' : ''}',
        [
          .text('Next'),
        ],
      ),
      // Page number buttons
      ul(classes: 'pagination-list', [
        for (int i = 0; i < pages; i++)
          li([
            button(
              onClick: () => blogListNotifier.goToPage(i),
              classes: 'pagination-link ${currentIndex == i ? 'is-current' : ''}',
              [.text('${i + 1}')],
            ),
          ]),
      ]),
    ]);
  }
}
