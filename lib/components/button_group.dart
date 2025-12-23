import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// A container for grouping multiple buttons together.
/// Uses Bulma's button group styling with optional attached mode.
class ButtonGroup extends StatelessComponent {
  const ButtonGroup({required this.children, this.isAttached = false, super.key});

  final List<Button> children;
  /// When true, buttons are attached together without spacing
  final bool isAttached;

  @override
  Component build(BuildContext context) {
    return div(classes: 'buttons ${isAttached ? ' has-addons' : ''} block', children);
  }
}

/// A component that displays an icon with a text label.
/// Uses Font Awesome icons.
class IconLabel extends StatelessComponent {
  const IconLabel({required this.icon, required this.label, super.key});

  /// Font Awesome icon name (without 'fa-' prefix)
  final String icon;
  final String label;

  @override
  Component build(BuildContext context) {
    return .fragment([
      span(classes: 'icon', [i(classes: 'fas fa-$icon', [])]),
      span([.text(label)]),
    ]);
  }
}

/// A customizable button component using Bulma styling.
/// Supports various states and styling options.
class Button extends StatelessComponent {
  const Button({
    required this.child,
    required this.onPressed,
    this.color,
    this.isOutlined = false,
    this.isLoading = false,
    this.isBlock = false,
    this.isDisabled = false,
    super.key,
  });

  final Component child;
  final VoidCallback onPressed;
  final Color? color;
  /// When true, button takes full width of container
  final bool isBlock;
  /// When true, button has outlined style
  final bool isOutlined;
  /// When true, shows loading spinner
  final bool isLoading;
  final bool isDisabled;

  @override
  Component build(BuildContext context) {
    return button(
      classes:
          'button'
          // '${color != null ? ' is-${color!.name}' : ''}'
          '${isOutlined ? ' is-outlined' : ''}'
          '${isLoading ? ' is-loading' : ''}'
          '${isBlock ? ' block' : ''}',
      disabled: isDisabled,
      onClick: onPressed,
      [child],
    );
  }
}
