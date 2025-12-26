import 'package:jaspr/jaspr.dart';
import 'package:universal_web/web.dart' as web;

class ScrollToTop extends StatelessComponent {
  final Component child;

  const ScrollToTop({required this.child, super.key});

  @override
  Component build(BuildContext context) {
    Future.microtask(() {
      web.window.scroll(
        web.ScrollToOptions(
          top: 0,
          left: 0,
        ),
      );
    });

    return child;
  }
}
