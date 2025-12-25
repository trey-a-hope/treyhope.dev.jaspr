import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/bulma_card.dart';
import 'package:treyhope_dev/dtos/blog.dart';

class BlogCard extends StatelessComponent {
  final Blog blog;

  const BlogCard({super.key, required this.blog});

  @override
  Component build(BuildContext context) {
    return BulmaCard(
      children: [
        div(classes: 'card-content', [
          div(classes: 'content', [
            .text(
              '''
${blog.title}
      ''',
            ),
          ]),
        ]),
      ],
    );
  }
}
