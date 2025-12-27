import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
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
    return section(classes: 'container is-max-desktop section', [
      // img(src: 'images/logo.svg', width: 80),
      Spacer(.xl),
      h1(classes: 'title is-1', [.text('Hi, I\'m Trey Hope')]),
      Spacer(.sm),
      div(classes: 'content has-text-centered', [
        h3(classes: 'subtitle is-3', [
          .text(
            'I\'m a Flutter fanatic passionate about building websites, mobile apps, and desktop applications.',
          ),
        ]),
      ]),
      div(classes: 'buttons', [
        SmartLink(href: '/projects', classes: 'button is-warning', children: [.text('See my Work')]),

        SmartLink(href: '/blog', classes: 'button is-warning is-outlined', children: [.text('Read my Blog')]),
      ]),
      // Spacer(.sm),
      // EmbeddedWebviewWidget(_walkdownUrl),
      // Spacer(.xl),
      // _GameDetails(),
      // Spacer(.xl),
      // SmartLink(href: '/about', classes: 'button', children: [.text('More about me')]),
    ]);
  }
}

class _GameDetails extends StatelessComponent {
  static const String _bonfireHref = 'https://bonfire-engine.github.io/#/';
  static const String _walkdownHref = 'https://github.com/trey-a-hope/walkdown';

  @override
  Component build(BuildContext context) => p([
    .text('Game built with '),
    SmartLink(
      href: _bonfireHref,
      children: [
        .text('Bonfire'),
      ],
    ),
    .text('; view source code'),
    SmartLink(
      href: _walkdownHref,
      children: [
        .text(' here.'),
      ],
    ),
  ]);
}
