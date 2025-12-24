import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// A reusable hero section component that displays a centered title and subtitle.
/// Uses Bulma CSS framework for styling.
class BulmaHero extends StatelessComponent {
  final String title;
  final String subtitle;

  const BulmaHero({
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Component build(BuildContext context) {
    // Renders a Bulma hero section with centered content
    return section(classes: 'container is-max-desktop section hero is-link', [
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
