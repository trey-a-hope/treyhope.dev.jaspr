import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class ClockIcon extends StatelessComponent {
  const ClockIcon({super.key});

  @override
  Component build(BuildContext context) {
    return svg(
      attributes: {
        'width': '16',
        'height': '16',
        'viewBox': '0 0 16 16',
        'fill': 'currentColor',
        'xmlns': 'http://www.w3.org/2000/svg',
      },
      [
        path(
          attributes: {
            'd': 'M8 0a8 8 0 1 0 0 16A8 8 0 0 0 8 0zM1.5 8a6.5 6.5 0 1 1 13 0 6.5 6.5 0 0 1-13 0z',
          },
          [],
        ),
        path(
          attributes: {
            'd':
                'M7.5 3a.5.5 0 0 1 .5.5v4.793l2.854 2.853a.5.5 0 0 1-.708.708l-3-3A.5.5 0 0 1 7 8.5v-5a.5.5 0 0 1 .5-.5z',
          },
          [],
        ),
      ],
    );
  }
}
