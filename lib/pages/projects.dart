import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

@client
class Projects extends StatelessComponent {
  const Projects({super.key});

  @override
  Component build(BuildContext context) {
    return const section([
      h1([.text('Projects')]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [];
}
