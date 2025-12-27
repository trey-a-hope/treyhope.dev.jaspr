import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// A reusable hero section component that displays a centered title and subtitle.
/// Uses Bulma CSS framework for styling.
class BulmaHero extends StatelessComponent {
  final String title;
  final String subtitle;
  final String classes;

  const BulmaHero({
    required this.title,
    required this.subtitle,
    this.classes = 'is-small is-link',
    super.key,
  });

  @override
  Component build(BuildContext context) {
    return section(id: 'bulma-hero', classes: 'container is-max-desktop section hero $classes', [
      div(classes: 'hero-body has-text-centered', [
        p(classes: 'title', [
          .text(title),
        ]),
        p(classes: 'subtitle', [
          .text(subtitle),
        ]),
      ]),
    ]);
  }
}
