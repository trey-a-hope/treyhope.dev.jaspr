import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:treyhope_dev/components/about_card.dart';
import 'package:treyhope_dev/components/bulma_hero.dart';
import 'package:treyhope_dev/components/embedded_quiz_widget.dart';
import 'package:treyhope_dev/components/spacer.dart';
import 'package:treyhope_dev/components/work_history_card.dart';
import 'package:treyhope_dev/constants/globals.dart';

// By using the @client annotation this component will be automatically compiled to javascript and mounted
// on the client. Therefore:
// - this file and any imported file must be compilable for both server and client environments.
// - this component and any child components will be built once on the server during pre-rendering and then
//   again on the client during normal rendering.
class About extends StatelessComponent {
  const About({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'container is-max-desktop', [
      BulmaHero(title: 'About', subtitle: 'Nice to meet you—let me tell you my story.'),
      section(classes: 'container is-max-desktop section', [
        div(classes: 'columns', [
          div(classes: 'column is-two-thirds', [
            AboutCard(),
          ]),
          div(classes: 'column is-one-third', [
            h4(classes: 'title is-4 has-text-centered', [.text('Take my quiz')]),
            h5(classes: 'has-text-centered', [.text('It won\'t take long, I promise.')]),
            Spacer(.md),
            EmbeddedQuizWidget(),
            Spacer(.md),
            _Sentence(),
          ]),
        ]),
        Spacer(.xl),
        h4(classes: 'title is-4', [.text('Employment History')]),
        h5([.text('Flutter development has been my focus since the beginning.')]),
        Spacer(.xl),
        div(classes: 'columns is-multiline', [
          for (final workHistory in Globals.workHistories)
            div(classes: 'column is-half', [
              WorkHistoryCard(data: workHistory),
            ]),
        ]),
      ]),
    ]);
  }
}

class _Sentence extends StatelessComponent {
  const _Sentence();

  static const String _dartHref = 'https://dart.dev';
  static const String _flutterHref = 'https://flutter.dev';

  @override
  Component build(BuildContext context) => div(id: 'footer-sentence', classes: 'content', [
    p(classes: 'has-text-centered', [
      .text(
        'One of the many reasons I love ',
      ),
      Link(
        target: Target.blank,
        to: _dartHref,
        children: [
          .text('Dart'),
        ],
      ),
      .text(' and '),
      Link(
        target: Target.blank,
        to: _flutterHref,
        children: [
          .text('Flutter'),
        ],
      ),
      .text('Flutter'),
    ]),
    .text(
      ', is the ability to embed Flutter widgets. This site is HTML and CSS, but this widget is pure Flutter.',
    ),
  ]);
}
