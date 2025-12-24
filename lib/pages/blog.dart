import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/bulma_hero.dart';

@client
class Blog extends StatelessComponent {
  const Blog({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'container is-max-desktop', [
      BulmaHero(title: 'Blog', subtitle: 'Thoughts on code, culture, and everything in between.'),
      section(classes: 'container is-max-desktop section', []),
    ]);
  }

  @css
  static List<StyleRule> get styles => [];
}
