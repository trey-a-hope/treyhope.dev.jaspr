import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

@client // Add this annotation
class Header extends StatefulComponent {
  const Header({super.key});

  @override
  State<Header> createState() => HeaderState();
}

class HeaderState extends State<Header> {
  bool isMenuOpen = false;

  void _toggleMenu() => setState(() => isMenuOpen = !isMenuOpen);

  @override
  Component build(BuildContext context) {
    return nav(
      classes: 'navbar',
      attributes: {'role': 'navigation', 'aria-label': 'main navigation'},
      [
        // Navbar hamburger (mobile)
        div(classes: 'navbar-brand', [
          a(classes: 'navbar-item', href: '/', [
            strong([.text('Trey Hope')]),
          ]),
          button(
            onClick: () {
              print('Menu toggled! isMenuOpen: $isMenuOpen');
              _toggleMenu();
            },
            classes: 'navbar-burger${isMenuOpen ? ' is-active' : ''}',
            attributes: {
              'role': 'button',
              'aria-label': 'menu',
              'aria-expanded': '$isMenuOpen',
              'data-target': 'navMenu',
            },
            [
              span(attributes: {'aria-hidden': 'true'}, []),
              span(attributes: {'aria-hidden': 'true'}, []),
              span(attributes: {'aria-hidden': 'true'}, []),
              span(attributes: {'aria-hidden': 'true'}, []),
            ],
          ),
        ]),
        // Navbar menu (desktop)
        div(
          id: 'navMenu',
          classes: 'navbar-menu${isMenuOpen ? ' is-active' : ''}',
          [
            div(classes: 'navbar-start', []),
            div(classes: 'navbar-end', [
              a(href: '/about', classes: 'navbar-item', [
                .text('About'),
              ]),
              a(href: '/projects', classes: 'navbar-item', [
                .text('Projects'),
              ]),
              a(href: '/code-flows', classes: 'navbar-item', [
                .text('Code Flows'),
              ]),
              a(href: '/blog', classes: 'navbar-item', [
                .text('Blog'),
              ]),
            ]),
          ],
        ),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.navbar-burger').styles(
      border: Border.none,
      cursor: Cursor.pointer,
      backgroundColor: Colors.transparent,
    ),
    css('.navbar').styles(
      padding: Padding.all(1.rem),
      backgroundColor: Color('#333'),
    ),
    css('.navbar-burger span').styles(
      raw: {'pointer-events': 'none'},
    ),
  ];
}
