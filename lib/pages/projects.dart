import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

@client
class Projects extends StatelessComponent {
  const Projects({super.key});

  @override
  Component build(BuildContext context) {
    return const section(classes: 'centered-container', [
      h1(classes: 'title', [.text('Projects')]),
      p([
        .text('Here are some of the projects I have worked on.'),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [];
}
