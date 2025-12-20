import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

// By using the @client annotation this component will be automatically compiled to javascript and mounted
// on the client. Therefore:
// - this file and any imported file must be compilable for both server and client environments.
// - this component and any child components will be built once on the server during pre-rendering and then
//   again on the client during normal rendering.
@client
class About extends StatelessComponent {
  const About({super.key});

  @override
  Component build(BuildContext context) {
    return const section(classes: 'pagespacing', [
      h1([.text('About')]),
      p([
        .text(
          'Greetings, my name is Trey, a software developer that has a knack for creating. A small town in Ohio named '
          'Trotwood is the start, and Austin, TX is my base currently. Being a quote unquote, "tech guy", what started as '
          'graphic design using Photoshop, has evolved into a core love for mobile app development.',
        ),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.pagespacing').styles(
      margin: Spacing.symmetric(horizontal: 20.px),
    ),
  ];
}
