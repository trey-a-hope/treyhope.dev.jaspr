import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:treyhope_dev/components/embedded_webview_widget.dart';
import 'package:treyhope_dev/components/smart_link.dart';
import 'package:treyhope_dev/components/spacer.dart';

// import '../components/counter.dart';

// By using the @client annotation this component will be automatically compiled to javascript and mounted
// on the client. Therefore:
// - this file and any imported file must be compilable for both server and client environments.
// - this component and any child components will be built once on the server during pre-rendering and then
//   again on the client during normal rendering.
class Home extends StatelessComponent {
  // TODO (Trey) - Add to project page
  static const String _walkdownUrl = 'https://walkdown.codemagic.app/';

  const Home({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'container is-max-desktop', [
      // TODO (Trey) - Make Bulma Hero more flexible
      section(id: 'bulma-hero', classes: 'container is-max-desktop section hero is-small is-warning', [
        div(classes: 'hero-body has-text-centered', [
          h1(classes: 'title is-1', [.text('Hi, I\'m Trey Hope')]),
          Spacer(.md),
          h3(classes: 'subtitle is-3', [
            .text(
              'I\'m a Flutter fanatic, passionate about building websites, mobile apps, and desktop applications.',
            ),
          ]),
        ]),
      ]),

      section(classes: 'section', [
        div(classes: 'block', [
          h5(classes: 'title is-5 has-text-centered', [
            .text('How passionate am I? Checkout this platform RPG I am working on in Flutter.'),
          ]),
        ]),
        EmbeddedWebviewWidget(_walkdownUrl),
      ]),

      section(classes: 'section', [
        _GameDetails(),
      ]),
      section(classes: 'section', [
        div(classes: 'buttons', [
          SmartLink(href: '/projects', classes: 'button is-link', children: [.text('See my Work')]),
          SmartLink(href: '/blog', classes: 'button is-link is-outlined', children: [.text('Read my Blog')]),
        ]),
      ]),
    ]);
  }
}

class _GameDetails extends StatelessComponent {
  static const String _bonfireHref = 'https://bonfire-engine.github.io/#/';
  static const String _walkdownHref = 'https://github.com/trey-a-hope/walkdown';

  @override
  Component build(BuildContext context) => p(classes: 'has-text-centered', [
    .text('Built with '),
    SmartLink(
      href: _bonfireHref,
      children: [
        .text('Bonfire'),
      ],
    ),
    .text('; view source code '),
    SmartLink(
      href: _walkdownHref,
      children: [
        .text('here'),
      ],
    ),
    .text('.'),
  ]);
}
