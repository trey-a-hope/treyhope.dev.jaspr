import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/spacer.dart';

class Scaffold extends StatelessComponent {
  final String title;
  final String subtitle;
  final List<section> sections;
  final String heroSize;

  const Scaffold({required this.title, required this.subtitle, this.heroSize = 'is-small', this.sections = const []});

  @override
  Component build(BuildContext context) {
    return div([
      section(id: 'hero', classes: 'hero ${heroSize} is-link', [
        div(classes: 'hero-body has-text-centered', [
          div(classes: 'container', [
            h1(classes: 'title is-1', [.text(title)]),
            Spacer(.md),
            h3(classes: 'subtitle is-3', [
              .text(subtitle),
            ]),
          ]),
        ]),
      ]),
      for (final section in sections) section,
    ]);
  }
}
