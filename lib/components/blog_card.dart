import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/bulma_card.dart';

class BlogCard extends StatelessComponent {
  @override
  Component build(BuildContext context) {
    return BulmaCard(
      children: [
        div(classes: 'card-content', [
          div(classes: 'content', [
            .text(
              '''
      Lorem ipsum leo risus, porta ac consectetur ac, vestibulum at eros. Donec
      id elit non mi porta gravida at eget metus. Cum sociis natoque penatibus
      et magnis dis parturient montes, nascetur ridiculus mus. Cras mattis
      consectetur purus sit amet fermentum.
      ''',
            ),
          ]),
        ]),
      ],
    );
  }
}
