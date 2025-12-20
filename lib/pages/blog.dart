import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

@client
class Blog extends StatelessComponent {
  const Blog({super.key});

  @override
  Component build(BuildContext context) {
    return const section([
      h1([.text('Blog')]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [];
}
