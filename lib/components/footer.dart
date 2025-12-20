import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class Footer extends StatelessComponent {
  static const String _jasprHref = 'https://jaspr.site/';
  static const String _bulmaHref = 'https://bulma.io/';
  static const String _githubHref = 'https://github.com/trey-a-hope/treyhope.dev.jaspr/tree/main';

  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'footer', [
      div(classes: 'content has-text-centered', [
        p([
          .text('Site built with '),
          a(target: Target.blank, href: _jasprHref, [
            .text('Jaspr'),
          ]),
          .text(' and '),
          a(target: Target.blank, href: _bulmaHref, [
            .text('Bulma'),
          ]),
          .text('; view source code'),
          a(target: Target.blank, href: _githubHref, [
            .text(' here.'),
          ]),
        ]),
      ]),
      div(classes: 'center-container button-row', [
        _socialButton(url: 'https://github.com/trey-a-hope/', icon: 'github'),
        _socialButton(url: 'https://x.com/trey_codes', icon: 'x-twitter'),
        _socialButton(url: 'https://www.linkedin.com/in/trey-hope-69a3a774/', icon: 'linkedin'),
        _socialButton(url: 'https://www.youtube.com/@TreyHope', icon: 'youtube'),
        _socialButton(url: 'https://www.tiktok.com/@trey_codes', icon: 'tiktok'),
      ]),
    ]);
  }

  Link _socialButton({required String url, required String icon}) => Link(
    target: Target.blank,
    to: url,
    child: button(classes: 'button is-dark', [
      span(classes: 'icon', [
        i(classes: 'fab fa-$icon', []),
      ]),
    ]),
  );

  @css
  static List<StyleRule> get styles => [
    css('.button-row', [
      css('&').styles(
        display: .flex,
        justifyContent: .center,
        gap: Gap.column(1.em),
      ),
    ]),
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
    ]),
  ];
}
