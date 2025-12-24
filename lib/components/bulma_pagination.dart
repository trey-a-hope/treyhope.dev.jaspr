import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class BulmaPagination extends StatelessComponent {
  final int totalBlogCount;
  final int batchCount;
  final int currentIndex;
  final int pages;

  const BulmaPagination({super.key, required this.totalBlogCount, required this.batchCount, required this.currentIndex})
    : pages = (totalBlogCount ~/ batchCount) + 1;

  @override
  Component build(BuildContext context) {
    return nav(classes: 'pagination', [
      a(classes: 'pagination-previous ${currentIndex == 0 ? 'is-disabled' : ''}', href: '#', [.text('Previous')]),
      a(
        classes: 'pagination-next ${(currentIndex + 1) * batchCount >= totalBlogCount ? 'is-disabled' : ''}',
        href: '#',
        [
          .text('Next'),
        ],
      ),
      ul(classes: 'pagination-list', [
        for (int i = 0; i < pages; i++)
          li([
            a(classes: 'pagination-link ${currentIndex == i ? 'is-current' : ''}', href: '#', [.text('${i + 1}')]),
          ]),
      ]),
    ]);
  }
}
