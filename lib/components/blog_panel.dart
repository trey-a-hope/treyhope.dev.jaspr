import 'package:intl/intl.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/bulma_panel.dart';
import 'package:treyhope_dev/components/spacer.dart';
import 'package:treyhope_dev/models/blog.dart';

class BlogPanel extends StatelessComponent {
  final Blog blog;

  const BlogPanel({super.key, required this.blog});

  @override
  Component build(BuildContext context) {
    return BulmaPanel(
      title: blog.title,
      children: [
        div(styles: Styles(display: Display.block), classes: 'panel-block', [
          i([.text('"${blog.excerpt}"')]),
          Spacer(.lg),
          p(classes: 'control has-icons-left', [
            .text('Posted ${DateFormat('E - MMMM d, yyyy').format(blog.date)}'),
          ]),
          div(classes: 'blog-card-tags', [
            for (int i = 0; i < blog.tags.length; i++) a(href: '#', [.text('#${blog.tags[i]}')]),
          ]),
        ]),
        div(classes: 'panel-block', [
          button(onClick: () => print('Read more about ${blog.title}'), classes: 'button is-dark is-fullwidth', [
            .text('Read more'),
          ]),
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
