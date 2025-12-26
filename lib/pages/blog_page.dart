import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/spacer.dart';
import 'package:treyhope_dev/constants/globals.dart';
import 'package:treyhope_dev/models/blog.dart';
import 'package:markdown/markdown.dart' as md;

@client
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

    return div(classes: 'container is-max-desktop', [
      div(classes: 'section', [
        a(
          href: '/blog',
          classes: 'button is-light',
          [
            span(classes: 'icon', [
              i(classes: 'fas fa-arrow-left', []),
            ]),
            span([.text('Back to Blog')]),
          ],
        ),
        Spacer(.lg),
        // Blog header
        h1(classes: 'title is-1', [.text(blog!.title)]),
        div(classes: 'subtitle is-5', [
          .text('${blog!.excerpt}'),
        ]),
        div([
          .text('Posted ${_formatDate(blog!.date)} by ${blog!.author}'),
        ]),
        Spacer(.sm),
        // Tags
        div(classes: 'tags', [
          for (final tag in blog!.tags) span(classes: 'tag is-link', [.text(tag)]),
        ]),
        Spacer(.md),
        hr(),
        div(
          classes: 'content',
          [RawText(htmlContent)], // Use raw() to render HTML
        ),
      ]),
    ]);
  }

  String _formatDate(DateTime date) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
