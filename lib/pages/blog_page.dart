import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/blog_tags.dart';
import 'package:treyhope_dev/components/clock_icon.dart';
import 'package:treyhope_dev/components/smart_link.dart';
import 'package:treyhope_dev/components/spacer.dart';
import 'package:treyhope_dev/constants/globals.dart';
import 'package:treyhope_dev/constants/share_platform.dart';
import 'package:treyhope_dev/extensions/blog_extensions.dart';
import 'package:treyhope_dev/extensions/datetime_extensions.dart';
import 'package:treyhope_dev/models/blog.dart';
import 'package:markdown/markdown.dart' as md;

class BlogPage extends StatelessComponent {
  final String slug;

  const BlogPage({required this.slug});

  @override
  Component build(BuildContext context) {
    final blog = Globals.allBlogs.where((b) => b.slug == slug).firstOrNull;

    if (blog == null) {
      return div(classes: 'container section has-text-centered', [
        .text('Blog post not found'),
      ]);
    }

    return BlogView(blog);
  }
}

class BlogView extends StatelessComponent {
  final Blog blog;

  const BlogView(this.blog);

  @override
  Component build(BuildContext context) {
    // Convert markdown to HTML
    final htmlContent = md.markdownToHtml(
      blog.content,
      extensionSet: md.ExtensionSet.gitHubFlavored,
    );

    return div([
      Document.head(
        title: '${blog.title} | Trey Hope',
        children: [
          ...blog.metaTags,
          link(
            rel: 'stylesheet',
            href: 'https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/styles/github-dark.min.css',
          ),
          script(
            src: 'https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/highlight.min.js',
          ),
          script(
            src: 'https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/languages/dart.min.js',
          ),
          RawText('<script>hljs.highlightAll();</script>'),
        ],
      ),
      section(classes: 'section has-background-dark', [
        div(classes: 'container', [
          div(classes: 'blog-content-wrapper', [
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
            h1(classes: 'title is-1', [.text(blog.title)]),
            Spacer(.sm),
            div(classes: 'subtitle', [
              .text('${blog.description}'),
            ]),
            Spacer(.xs),

            span(
              classes: 'is-flex is-align-items-center',
              styles: Styles(gap: Gap(column: 0.5.rem)),
              [
                ClockIcon(),
                .text('${(blog.date).formatDate} by ${blog.author}'),
              ],
            ),

            Spacer(.md),
            BlogTags(blog: blog),
            hr(),
            div(
              classes: 'content',
              [RawText(htmlContent)],
            ),
            hr(),
            div(
              classes: 'is-flex is-align-items-center',
              styles: Styles(
                justifyContent: JustifyContent.end,
              ),
              [
                SmartLink(
                  href: blog.getShareLink(SharePlatform.x),
                  classes: 'button is-warning',
                  children: [
                    span(classes: 'icon', [i(classes: 'fab fa-x-twitter', [])]),
                    span([.text('Share')]),
                  ],
                ),
                Spacer(.md, vertical: false),
                SmartLink(
                  href: blog.getShareLink(SharePlatform.linkedIn),
                  classes: 'button is-warning',
                  children: [
                    span(classes: 'icon', [i(classes: 'fab fa-linkedin', [])]),
                    span([.text('Share')]),
                  ],
                ),
              ],
            ),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    // Constrain content width for better readability
    css('.blog-content-wrapper').styles(
      maxWidth: 680.px,
      margin: Spacing.symmetric(horizontal: Unit.auto),
    ),
    // Make images fill the full width of the content area
    css('.content img').styles(
      display: Display.block,
      width: 100.percent,
      height: Unit.auto,
      maxWidth: 100.percent,
    ),
  ];
}
