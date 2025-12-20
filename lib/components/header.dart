import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class Header extends StatelessComponent {
  const Header({super.key});

  @override
  Component build(BuildContext context) {
    var activePath = context.url;

    return header([
      link(rel: 'stylesheet', href: 'https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/bulma.min.css'),
      nav(classes: 'center-container', [
        // Logo/Brand on the left
        const Link(
          to: '/',
          child: div(classes: 'brand', [.text('Trey Hope')]),
        ),

        // Nav items on the right
        div(classes: 'nav-links', [
          for (var route in [
            (label: 'About', path: '/about'),
            (label: 'Projects', path: '/projects'),
            (label: 'Code Flows', path: '/code-flows'),
            (label: 'Blog', path: '/blog'),
          ])
            Link(to: route.path, classes: activePath == route.path ? 'active' : null, child: .text(route.label)),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('header', [
      css('&').styles(
        width: 100.percent,
        border: Border.only(
          bottom: BorderSide(color: const Color('#1a2942'), width: 1.px),
        ), // Direct hex string
        backgroundColor: const Color('#0a1628'),
      ),
      css('nav', [
        css('&').styles(
          display: .flex,
          padding: .symmetric(vertical: 1.5.em),
          justifyContent: .spaceBetween,
          alignItems: .center,
        ),
        // Brand/Logo styling
        css('.brand', [
          css('&').styles(
            color: Colors.white,
            fontSize: 1.25.rem,
            fontWeight: .w600,
            textDecoration: const TextDecoration(line: .none),
          ),
        ]),
        // Nav links container
        css('.nav-links', [
          css('&').styles(
            display: .flex,
            alignItems: .center,
          ),
        ]),
        // Individual nav links
        css('a:not(.brand)', [
          css('&').styles(
            padding: Padding.symmetric(horizontal: 0.5.em),
            transition: const Transition('color ease', duration: Duration(milliseconds: 200)),
            color: const Color('#94a3b8'),
            fontSize: 1.em,
            fontWeight: .w500,
            textDecoration: const TextDecoration(line: .none),
          ),
          css('&:hover').styles(
            color: Colors.white,
          ),
          css('&.active').styles(
            color: Colors.white,
          ),
        ]),
      ]),
    ]),
  ];
}
