import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/embedded_lottie_widget.dart';
import 'package:treyhope_dev/constants/lottie_type.dart';

@client
class Projects extends StatelessComponent {
  const Projects({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'centered-container', [
      h1(classes: 'title', [.text('Projects')]),
      h4([
        .text('Page currently under construction'),
      ]),
      // TODO (Trey) - Add buttons for web, mobile, and desktop
      // ButtonGroup(
      //   isAttached: true,
      //   children: [
      //     Button(
      //       child: IconLabel(icon: 'align-left', label: 'Left'),
      //       onPressed: () {},
      //     ),
      //     Button(
      //       child: IconLabel(icon: 'align-center', label: 'Center'),
      //       onPressed: () {},
      //     ),
      //     Button(
      //       child: IconLabel(icon: 'align-right', label: 'Right'),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      EmbeddedLottieWidget(type: LottieType.underConstruction),
    ]);
  }

  @css
  static List<StyleRule> get styles => [];
}

/// Bulma Button Group Component
class ButtonGroup extends StatelessComponent {
  const ButtonGroup({required this.children, this.isAttached = false, super.key});

  final List<Button> children;
  final bool isAttached;

  @override
  Component build(BuildContext context) {
    return div(classes: 'buttons ${isAttached ? ' has-addons' : ''} block', children);
  }
}

class IconLabel extends StatelessComponent {
  const IconLabel({required this.icon, required this.label, super.key});

  final String icon;
  final String label;

  @override
  Component build(BuildContext context) {
    return fragment([
      span(classes: 'icon', [i(classes: 'fas fa-$icon', [])]),
      span([text(label)]),
    ]);
  }
}

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
  final bool isBlock;
  final bool isOutlined;
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
