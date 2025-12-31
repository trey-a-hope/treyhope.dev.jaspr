import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/blog_tags.dart';
import 'package:treyhope_dev/components/clock_icon.dart';
import 'package:treyhope_dev/components/smart_link.dart';
import 'package:treyhope_dev/components/spacer.dart';
import 'package:treyhope_dev/constants/globals.dart';
import 'package:treyhope_dev/extensions/blog_extensions.dart';
import 'package:treyhope_dev/extensions/datetime_extensions.dart';
import 'package:treyhope_dev/models/blog.dart';
import 'package:markdown/markdown.dart' as md;

class BlogPage extends StatelessComponent {
  final String slug;

  late final Blog? blog;

  BlogPage({required this.slug});

  @override
  Component build(BuildContext context) {
    blog = Globals.allBlogs.where((b) => b.slug == slug).firstOrNull;

    if (blog == null) {
      return div(classes: 'container section has-text-centered', [
        .text('Blog post not found'),
      ]);
    }

    // Convert markdown to HTML
    final htmlContent = md.markdownToHtml(
      blog!.content,
      extensionSet: md.ExtensionSet.gitHubFlavored,
    );

    return div([
      Document.head(
        title: '${blog!.title} | Trey Hope',
        children: blog!.metaTags,
      ),
      section(classes: 'section has-background-dark', [
        div(classes: 'container', [
          SmartLink(
            href: '/blog',
            classes: 'button is-light',
            children: [
              span(classes: 'icon', [
                i(classes: 'fas fa-arrow-left', []),
              ]),
              span([.text('Back to Blog')]),
            ],
          ),
          Spacer(.lg),
          // Blog header
          h1(classes: 'title is-1', [.text(blog!.title)]),
          Spacer(.sm),
          div(classes: 'subtitle', [
            .text('${blog!.description}'),
          ]),
          Spacer(.xs),

          span(
            classes: 'is-flex is-align-items-center',
            styles: Styles(gap: Gap(column: 0.5.rem)),
            [
              ClockIcon(),
              .text('${(blog!.date).formatDate} by ${blog!.author}'),
            ],
          ),

          Spacer(.md),
          BlogTags(blog: blog!),
          hr(),
          div(
            classes: 'content',
            [RawText(htmlContent)], // Use raw() to render HTML
          ),
          hr(),
          div(classes: 'is-flex is-align-items-center', [
            SmartLink(
              href: blog!.getShareLink,
              classes: 'button is-dark',
              children: [
                span(classes: 'icon', [i(classes: 'fab fa-x-twitter', [])]),
                span([.text('Share')]),
              ],
            ),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.content img').styles(
      display: Display.block,
      margin: Spacing.symmetric(horizontal: Unit.auto),
    ),
  ];
}
