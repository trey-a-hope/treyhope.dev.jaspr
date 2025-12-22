import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

enum SpacerHeight {
  xs(4),
  small(8),
  medium(16),
  large(24),
  xl(32)
  ;

  const SpacerHeight(this.value);
  final int value;
}

class Spacer extends StatelessComponent {
  final SpacerHeight spacerHeight;

  const Spacer(this.spacerHeight);

  @override
  Component build(BuildContext context) => div(styles: Styles(height: spacerHeight.value.px), []);
}
