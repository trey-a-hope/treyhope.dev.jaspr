import 'package:intl/intl.dart';
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
            h1(classes: 'is-1', [.text('"${blog.title}"')]),
            h4(classes: 'is-4', [.text(DateFormat('EEEE, MMMM d, yyyy').format(blog.date))]),
            p(classes: '', [.text(blog.excerpt)]),
          ]),
          div(classes: 'blog-card-tags', [
            for (int i = 0; i < blog.tags.length; i++) a(href: '#', [.text('#${blog.tags[i]}')]),
          ]),
        ]),
        footer(classes: 'card-footer', [
          p(
            classes: 'card-footer-item',
            [
              button(onClick: () {}, [.text('Read more')]),
            ],
          ),
          p(
            classes: 'card-footer-item',
            [
              button(onClick: () {}, [.text('Share')]),
            ],
          ),
        ]),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.blog-card-tags').styles(
      display: Display.flex,
      gap: Gap(column: 0.5.rem),
    ),
  ];
}
