import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/smart_link.dart';
import 'package:treyhope_dev/constants/globals.dart';

/// Main navigation header component with responsive mobile menu.
/// Uses Bulma's navbar system with hamburger menu toggle.
class Header extends StatefulComponent {
  const Header({super.key});

  @override
  State<Header> createState() => HeaderState();
}

class HeaderState extends State<Header> {
  /// Tracks whether the mobile hamburger menu is open
  bool isMenuOpen = false;

  /// Toggles the mobile menu open/closed state
  void _toggleMenu() => setState(() => isMenuOpen = !isMenuOpen);

  @override
  Component build(BuildContext context) {
    return nav(
      classes: 'navbar',
      attributes: {'role': 'navigation', 'aria-label': 'main navigation'},
      [
        div(classes: 'navbar-container container is-max-desktop', [
          // Navbar hamburger (mobile)
          div(classes: 'navbar-brand', [
            SmartLink(
              href: '/',
              classes: 'navbar-item',
              children: [.text('Trey Hope')],
            ),
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
                SmartLink(
                  href: '/about',
                  classes: 'navbar-item',
                  children: [.text('About')],
                ),
                SmartLink(
                  href: '/projects',
                  classes: 'navbar-item',
                  children: [.text('Projects')],
                ),
                SmartLink(
                  href: '/code-flows',
                  classes: 'navbar-item',
                  children: [.text('Code Flows')],
                ),
                SmartLink(
                  href: '/blog',
                  classes: 'navbar-item',
                  children: [.text('Blog')],
                ),
              ]),
            ],
          ),
        ]),
      ],
    );
  }

  /// Custom styles for the navbar component
  @css
  static List<StyleRule> get styles => [
    // Hamburger button styling
    css('.navbar-burger').styles(
      border: Border.none,
      cursor: Cursor.pointer,
      backgroundColor: Colors.transparent,
    ),
    css('.navbar').styles(
      padding: Padding.all(1.rem),
      backgroundColor: Color('#333'),
    ),
    // Prevent hover effects on hamburger spans
    css('.navbar-burger span').styles(
      raw: {'pointer-events': 'none'},
    ),
    // Apply larger padding on desktop (screens wider than 768px)
    css.media(MediaQuery.screen(minWidth: Globals.desktopBreakpoint.px), [
      css('.navbar-container').styles(
        padding: Padding.symmetric(horizontal: 3.5.rem),
      ),
    ]),
  ];
}
