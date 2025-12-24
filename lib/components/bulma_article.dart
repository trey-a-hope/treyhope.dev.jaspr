import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class BulmaArticle extends StatelessComponent {
  final String title;
  final String body;

  const BulmaArticle({super.key, required this.title, required this.body});

  @override
  Component build(Object context) {
    return article(classes: 'message is-link', [
      div(classes: 'message-header', [
        p([
          .text(title),
        ]),
      ]),
      div(classes: 'message-body', [
        .text(
          body,
        ),
      ]),
    ]);
  }
}
