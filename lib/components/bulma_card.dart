import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class BulmaCard extends StatelessComponent {
  final List<Component> children;

  const BulmaCard({
    required this.children,
    super.key,
  });

  @override
  Component build(BuildContext context) => div(classes: 'card', children);
}
