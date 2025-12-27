import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

/// A smart link component that automatically handles internal and external links.
/// External links open in a new tab with security attributes, while internal
/// links use client-side routing.
class SmartLink extends StatelessComponent {
  final String href;
  final List<Component> children;
  final String? classes;

  SmartLink({required this.href, required this.children, this.classes});

  @override
  Component build(BuildContext context) {
    // Check if the link is external by looking for http/https protocol
    final isExternal = href.startsWith('http://') || href.startsWith('https://');

    if (isExternal) {
      // External links open in new tab with security attributes
      return a(
        href: href,
        classes: classes,
        target: Target.blank,
        attributes: {'rel': 'noopener noreferrer'},
        children,
      );
    } else {
      // Internal links use Jaspr Router for client-side navigation
      return Link(to: href, classes: classes, children: children);
    }
  }
}
