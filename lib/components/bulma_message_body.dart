import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class BulmaMessageBody extends StatelessComponent {
  final String body;

  const BulmaMessageBody({super.key, required this.body});

  @override
  Component build(Object context) {
    return article(classes: 'message is-link', [
      div(classes: 'message-body', [
        .text(
          body,
        ),
      ]),
    ]);
  }
}
