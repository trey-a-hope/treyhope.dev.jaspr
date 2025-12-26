import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

// By using the @client annotation this component will be automatically compiled to javascript and mounted
// on the client. Therefore:
// - this file and any imported file must be compilable for both server and client environments.
// - this component and any child components will be built once on the server during pre-rendering and then
//   again on the client during normal rendering.
class PageNotFound extends StatelessComponent {
  const PageNotFound({super.key});

  @override
  Component build(BuildContext context) {
    return const section(classes: 'container is-max-desktop', [
      div(classes: 'block', [
        h1(classes: 'title', [.text('Page not found')]),
      ]),
      div(classes: 'block', [
        p([
          .text(
            'The request resource is not available.',
          ),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [];
}
