import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class BulmaMessageBody extends StatelessComponent {
  final String body;
  final String color;

  const BulmaMessageBody({super.key, required this.body, this.color = 'is-link'});

  @override
  Component build(Object context) {
    return article(classes: 'message $color', [
      div(classes: 'message-body', [
        .text(
          body,
        ),
      ]),
    ]);
  }
}
