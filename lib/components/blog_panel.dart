import 'package:intl/intl.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/bulma_panel.dart';
import 'package:treyhope_dev/components/clock_icon.dart';
import 'package:treyhope_dev/components/smart_link.dart';
import 'package:treyhope_dev/components/spacer.dart';
import 'package:treyhope_dev/models/blog.dart';

class BlogPanel extends StatelessComponent {
  final Blog blog;

  const BlogPanel({super.key, required this.blog});

  @override
  Component build(BuildContext context) {
    final src = 'blogs/${DateFormat('yyyy-MM-dd').format(blog.date)}-${blog.slug}/${blog.coverImage}';

    return BulmaPanel(
      title: blog.title,
      children: [
        div(classes: 'card-image', [
          figure(classes: 'image', [
            img(
              src: src,
              alt: blog.title,
            ),
          ]),
        ]),
        div(styles: Styles(display: Display.block), classes: 'panel-block', [
          i([.text('"${blog.excerpt}"')]),
          Spacer(.lg),
          span(
            classes: 'is-flex is-align-items-center',
            styles: Styles(gap: Gap(column: 0.5.rem)),
            [
              ClockIcon(),
              .text('${DateFormat('MMMM d, yyyy').format(blog.date)}'),
            ],
          ),
          Spacer(.md),
          div(classes: 'blog-card-tags', [
            for (int i = 0; i < blog.tags.length; i++)
              SmartLink(
                href: '#',
                children: [.text('#${blog.tags[i]}')],
              ),
          ]),
        ]),
        div(classes: 'panel-block', [
          SmartLink(
            href: '/blog/${blog.slug}',
            classes: 'button is-link is-fullwidth',
            children: [
              p([.text('Read more')]),
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
      flexWrap: FlexWrap.wrap,
      gap: Gap(column: 0.5.rem),
    ),
  ];
}
