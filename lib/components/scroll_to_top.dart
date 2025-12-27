import 'package:jaspr/jaspr.dart';
import 'package:universal_web/web.dart' as web;

/// A wrapper component that scrolls the window to the top when rendered.
/// Typically used with route navigation to ensure pages start at the top.
class ScrollToTop extends StatelessComponent {
  final Component child;

  const ScrollToTop({required this.child, super.key});

  @override
  Component build(BuildContext context) {
    // Only execute on client-side
    if (kIsWeb) {
      Future.microtask(() {
        web.window.scroll(
          web.ScrollToOptions(
            top: 0,
            left: 0,
          ),
        );
      });
    }

    return child;
  }
}
