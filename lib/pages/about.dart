import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/about_card.dart';
import 'package:treyhope_dev/components/embedded_quiz_widget.dart';
import 'package:treyhope_dev/components/spacer.dart';
import 'package:treyhope_dev/components/work_history_card.dart';
import 'package:treyhope_dev/constants/globals.dart';

// By using the @client annotation this component will be automatically compiled to javascript and mounted
// on the client. Therefore:
// - this file and any imported file must be compilable for both server and client environments.
// - this component and any child components will be built once on the server during pre-rendering and then
//   again on the client during normal rendering.
@client
class About extends StatelessComponent {
  const About({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'container is-max-desktop section', [
      div(classes: 'block', [
        h1(classes: 'title is-1', [.text('About')]),
      ]),

      div(classes: 'columns', [
        div(classes: 'column is-two-thirds', [
          AboutCard(),
        ]),
        div(classes: 'column is-one-third', [
          h3(classes: 'title is-3 has-text-centered', [.text('Take my quiz')]),
          h5(classes: 'has-text-centered', [.text('It won\'t take long, I promise.')]),
          Spacer(.md),
          EmbeddedQuizWidget(),
          Spacer(.md),
          _Sentence(),
        ]),
      ]),
      Spacer(.xl),
      h3(classes: 'title is-3', [.text('Employment History')]),
      h5([.text('Flutter development has been my focus since the beginning.')]),
      Spacer(.xl),
      div(classes: 'columns is-multiline', [
        for (final workHistory in Globals.workHistories)
          div(classes: 'column is-half', [
            WorkHistoryCard(data: workHistory),
          ]),
      ]),
    ]);
  }
}

class _Sentence extends StatelessComponent {
  const _Sentence();

  static const String _href = 'https://pub.dev/packages/animated_quiz_widget';

  @override
  Component build(BuildContext context) => div(id: 'footer-sentence', classes: 'content', [
    p(classes: 'has-text-centered', [
      .text(
        'The',
      ),
      a(target: Target.blank, href: _href, [
        .text(' Animated Quiz Widget '),
      ]),
      .text(' is an actual Flutter widget, created by an unknown publisher.'),
    ]),
  ]);
}
