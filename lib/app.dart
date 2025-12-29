import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:treyhope_dev/components/scroll_to_top.dart';
import 'package:treyhope_dev/components/footer/footer.dart';
import 'package:treyhope_dev/constants/globals.dart';
import 'package:treyhope_dev/pages/blogs_page.dart';
import 'package:treyhope_dev/pages/blog_page.dart';
import 'package:treyhope_dev/pages/blogs_tag_page.dart';
import 'package:treyhope_dev/pages/code_flows.dart';
import 'package:treyhope_dev/pages/page_not_found.dart';
import 'package:treyhope_dev/pages/projects.dart';

import 'components/header.dart';
import 'pages/about.dart';
import 'pages/home.dart';

// The main component of your application.
//
// By adding @client, this component runs on both server (for SSR) and client (for navigation).
// This enables client-side routing without full page reloads.
@client
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return // This method is rerun every time the component is rebuilt.
    // Renders a <div class="main"> html element with children.
    div(classes: 'main', [
      const Header(),
      Router(
        routes: [
          Route(
            path: '/',
            title: 'Home',
            builder: (context, state) => ScrollToTop(child: Home()),
          ),
          Route(
            path: '/about',
            title: 'About',
            builder: (context, state) => ScrollToTop(child: const About()),
          ),
          Route(
            path: '/projects',
            title: 'Projects',
            builder: (context, state) => ScrollToTop(child: const Projects()),
          ),
          Route(
            path: '/code-flows',
            title: 'Code Flows',
            builder: (context, state) => ScrollToTop(child: const CodeFlows()),
          ),
          Route(
            path: '/blog',
            title: 'Blog',
            builder: (context, state) => ScrollToTop(child: const BlogsPage()),
          ),
          Route(
            path: '/blog/tags/:tag',
            title: 'Blog',
            builder: (context, state) => ScrollToTop(child: BlogsTagPage(tag: state.params['tag']!)),
          ),
          // Generate a static route for each blog post
          ...Globals.allBlogs.map(
            (blog) => Route(
              path: '/blog/${blog.slug}',
              title: blog.title,
              builder: (context, state) => ScrollToTop(child: BlogPage(slug: blog.slug)),
            ),
          ),
        ],
        errorBuilder: (context, state) => const PageNotFound(),
      ),
      const Footer(),
    ]);
  }

  // Defines the css styles for elements of this component.
  //
  // By using the @css annotation, these will be rendered automatically to css inside the <head> of your page.
  // Must be a variable or getter of type [List<StyleRule>].
  @css
  static List<StyleRule> get styles => [
    css('.main', [
      // The '&' refers to the parent selector of a nested style rules.
      css('&').styles(
        display: .contents,
        minHeight: 100.vh,
        flexDirection: .column,
      ),
      css('section').styles(
        display: .flex,
        flexDirection: .column,
        justifyContent: .center,
        alignItems: .center,
        flex: const Flex(grow: 1, shrink: 0),
      ),
    ]),
  ];
}
