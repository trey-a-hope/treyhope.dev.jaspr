import 'package:jaspr/jaspr.dart';
import 'package:jaspr/dom.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:treyhope_dev/components/embedded_webview_widget.dart';
import 'package:treyhope_dev/components/spacer.dart';

// import '../components/counter.dart';

// By using the @client annotation this component will be automatically compiled to javascript and mounted
// on the client. Therefore:
// - this file and any imported file must be compilable for both server and client environments.
// - this component and any child components will be built once on the server during pre-rendering and then
//   again on the client during normal rendering.
@client
class Home extends StatelessComponent {
  static const String _walkdownUrl = 'https://walkdown.codemagic.app/';

  const Home({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'container is-max-desktop section', [
      img(src: 'images/logo.svg', width: 80),
      Spacer(.xl),
      h1(classes: 'title', [.text('Hey, I\'m Trey')]),
      Spacer(.sm),
      div(classes: 'content has-text-centered', [
        h4([
          .text(
            'I\'m a Flutter fanatic passionate about building websites, mobile apps, and desktop applications. Want to see what I\'m working on? Check out this 2D side scroller game I\'m creating with Flutter!',
          ),
        ]),
      ]),
      Spacer(.sm),
      EmbeddedWebviewWidget(_walkdownUrl),
      Spacer(.xl),
      _GameDetails(),
      Spacer(.xl),
      Link(
        to: '/about',
        child: button(
          classes: 'button',
          [.text('More about NOTHING!')],
        ),
      ),
    ]);
  }
}

class _GameDetails extends StatelessComponent {
  static const String _bonfireHref = 'https://bonfire-engine.github.io/#/';
  static const String _walkdownHref = 'https://github.com/trey-a-hope/walkdown';

  @override
  Component build(BuildContext context) => p([
    .text('Game built with '),
    a(target: Target.blank, href: _bonfireHref, [
      .text('Bonfire'),
    ]),
    .text('; view source code'),
    a(target: Target.blank, href: _walkdownHref, [
      .text(' here.'),
    ]),
  ]);
}
