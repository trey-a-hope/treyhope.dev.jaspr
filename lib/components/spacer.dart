import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Predefined spacing sizes in pixels
enum SpacerDistance {
  xs(4),
  sm(8),
  md(16),
  lg(24),
  xl(32)
  ;

  const SpacerDistance(this.value);
  final int value;
}

/// A flexible spacing component that can create vertical or horizontal gaps
class Spacer extends StatelessComponent {
  final SpacerDistance space;
  final bool vertical;

  const Spacer(this.space, {this.vertical = true});

  @override
  Component build(BuildContext context) {
    // Apply height for vertical spacing, width for horizontal
    final style = vertical ? Styles(height: space.value.px) : Styles(width: space.value.px);

    return div(
      id: 'spacer',
      styles: style,
      [],
    );
  }
}
