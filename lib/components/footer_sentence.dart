part of 'footer.dart';

class FooterSentence extends StatelessComponent {
  static const String _jasprHref = 'https://jaspr.site/';
  static const String _bulmaHref = 'https://bulma.io/';
  static const String _githubHref = 'https://github.com/trey-a-hope/treyhope.dev.jaspr/tree/main';

  const FooterSentence();

  @override
  Component build(BuildContext context) => div(classes: 'content has-text-centered', [
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
  ]);
}
