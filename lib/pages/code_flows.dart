import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

@client
class CodeFlows extends StatelessComponent {
  const CodeFlows({super.key});

  @override
  Component build(BuildContext context) {
    return const section([
      h1([.text('Code Flows')]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [];
}
