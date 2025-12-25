import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:treyhope_dev/constants/globals.dart';
import 'package:treyhope_dev/riverpod/providers.dart';

/// Bulma-styled pagination component for navigating through blog posts
class BulmaPagination extends StatelessComponent {
  final int currentIndex;
  final int pages;

  const BulmaPagination({
    super.key,
    required this.currentIndex,
  }) : pages = (Globals.totalBlogCount ~/ Globals.blogPaginationCount) + 1; // Calculate total pages

  @override
  Component build(BuildContext context) {
    final blogListNotifier = context.read(blogListProvider.notifier);

    // Disable previous button on first page
    final isPreviousDisabled = currentIndex == 0;
    // Disable next button on last page
    final isNextDisabled = (currentIndex + 1) * Globals.blogPaginationCount >= Globals.totalBlogCount;

    return nav(classes: 'pagination', [
      // Previous button
      button(
        onClick: () => !isPreviousDisabled ? blogListNotifier.prevBatch() : null,
        classes: 'pagination-previous ${isPreviousDisabled ? 'is-disabled' : ''}',
        [.text('Previous')],
      ),
      // Next button
      button(
        onClick: () => !isNextDisabled ? blogListNotifier.nextBatch() : null,
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
