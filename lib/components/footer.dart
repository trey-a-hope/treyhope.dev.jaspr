import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer([
      div(classes: 'footer-content', [
        // Copyright on the left
        div(classes: 'copyright', [
          .text('Copyright © 2025'),
        ]),

        // Social icons on the right
        div(classes: 'social-links', [
          // a(
          //   href: 'https://twitter.com/yourusername',
          //   target: .blank,
          //   classes: 'social-icon',
          //   [
          //     // X (Twitter) icon - using SVG
          //     DomComponent(
          //       tag: 'svg',
          //       attributes: {
          //         'width': '20',
          //         'height': '20',
          //         'viewBox': '0 0 24 24',
          //         'fill': 'currentColor',
          //       },
          //       child: DomComponent(
          //         tag: 'path',
          //         attributes: {
          //           'd':
          //               'M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z',
          //         },
          //       ),
          //     ),
          //   ],
          // ),
          // a(
          //   href: 'https://github.com/yourusername',
          //   target: .blank,
          //   classes: 'social-icon',
          //   [
          //     // GitHub icon
          //     DomComponent(
          //       tag: 'svg',
          //       attributes: {
          //         'width': '20',
          //         'height': '20',
          //         'viewBox': '0 0 24 24',
          //         'fill': 'currentColor',
          //       },
          //       child: DomComponent(
          //         tag: 'path',
          //         attributes: {
          //           'd':
          //               'M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z',
          //         },
          //       ),
          //     ),
          //   ],
          // ),
          // a(
          //   href: 'https://tiktok.com/@yourusername',
          //   target: .blank,
          //   classes: 'social-icon',
          //   [
          //     // TikTok icon
          //     DomComponent(
          //       tag: 'svg',
          //       attributes: {
          //         'width': '20',
          //         'height': '20',
          //         'viewBox': '0 0 24 24',
          //         'fill': 'currentColor',
          //       },
          //       child: DomComponent(
          //         tag: 'path',
          //         attributes: {
          //           'd':
          //               'M19.59 6.69a4.83 4.83 0 0 1-3.77-4.25V2h-3.45v13.67a2.89 2.89 0 0 1-5.2 1.74 2.89 2.89 0 0 1 2.31-4.64 2.93 2.93 0 0 1 .88.13V9.4a6.84 6.84 0 0 0-1-.05A6.33 6.33 0 0 0 5 20.1a6.34 6.34 0 0 0 10.86-4.43v-7a8.16 8.16 0 0 0 4.77 1.52v-3.4a4.85 4.85 0 0 1-1-.1z',
          //         },
          //       ),
          //     ),
          //   ],
          // ),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('footer', [
      css('&').styles(
        width: 100.percent,
        margin: .only(top: 2.rem),
        border: Border.only(
          top: BorderSide(color: const Color('#1a2942'), width: 1.px),
        ),
        backgroundColor: const Color('#0a1628'), // Push footer to bottom if using flexbox on body
      ),
      css('.footer-content', [
        css('&').styles(
          display: .flex,
          maxWidth: 1400.px,
          padding: .symmetric(horizontal: 3.em, vertical: 1.5.em),
          margin: .inherit,
          justifyContent: .spaceBetween,
          alignItems: .center,
        ),
      ]),
      // Copyright text
      css('.copyright', [
        css('&').styles(
          color: const Color('#94a3b8'),
          fontSize: 0.9.rem,
          fontWeight: .w400,
        ),
      ]),
      // Social links container
      css('.social-links', [
        css('&').styles(
          display: .flex,
          alignItems: .center,
          gap: Gap.row(1.5.em),
        ),
      ]),
      // Individual social icons
      css('.social-icon', [
        css('&').styles(
          display: .flex,
          transition: const Transition('color ease', duration: Duration(milliseconds: 200)),
          alignItems: .center,
          color: const Color('#94a3b8'),
        ),
        css('&:hover').styles(
          color: Colors.white,
        ),
      ]),
    ]),
  ];
}
