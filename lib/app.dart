import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:treyhope_dev/components/footer.dart';
import 'package:treyhope_dev/pages/blog.dart';
import 'package:treyhope_dev/pages/code_flows.dart';
import 'package:treyhope_dev/pages/page_not_found.dart';
import 'package:treyhope_dev/pages/projects.dart';

import 'components/header.dart';
import 'pages/about.dart';
import 'pages/home.dart';

// The main component of your application.
//
// By using multi-page routing, this component will only be built on the server during pre-rendering and
// **not** executed on the client. Instead only the nested [Home] and [About] components will be mounted on the client.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    // This method is rerun every time the component is rebuilt.

    // Renders a <div class="main"> html element with children.
    return div(classes: 'main', [
      const Header(),
      Router(
        routes: [
          Route(path: '/', title: 'Home', builder: (context, state) => const Home()),
          Route(path: '/about', title: 'About', builder: (context, state) => const About()),
          Route(path: '/projects', title: 'Projects', builder: (context, state) => const Projects()),
          Route(path: '/code-flows', title: 'Code Flows', builder: (context, state) => const CodeFlows()),
          Route(path: '/blog', title: 'Blog', builder: (context, state) => const Blog()),
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
