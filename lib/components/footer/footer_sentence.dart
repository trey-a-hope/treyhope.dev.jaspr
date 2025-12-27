part of 'footer.dart';

class FooterSentence extends StatelessComponent {
  static const String _bulmaHref = 'https://bulma.io/';
  static const String _githubHref = 'https://github.com/trey-a-hope/treyhope.dev.jaspr/tree/main';

  const FooterSentence();

  @override
  Component build(BuildContext context) => div(id: 'footer-sentence', classes: 'content', [
    p([
      .text('Styling built with '),
      SmartLink(href: _bulmaHref, children: [.text('Bulma')]),
      .text('; view source code'),
      SmartLink(href: _githubHref, children: [.text(' here.')]),
    ]),
  ]);
}
