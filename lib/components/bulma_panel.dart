import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class BulmaPanel extends StatelessComponent {
  final String title;
  final List<Component> children;

  const BulmaPanel({super.key, required this.title, this.children = const []});

  @override
  Component build(BuildContext context) {
    return nav(classes: 'panel is-warning', [
      p(classes: 'panel-heading', [
        .text('$title'),
      ]),
      ...children,
    ]);
  }
}
