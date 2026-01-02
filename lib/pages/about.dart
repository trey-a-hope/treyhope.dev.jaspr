import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/embedded_quiz_widget.dart';
import 'package:treyhope_dev/components/scaffold.dart';
import 'package:treyhope_dev/components/smart_link.dart';
import 'package:treyhope_dev/components/spacer.dart';
import 'package:treyhope_dev/components/spotify_artist_preview.dart';
import 'package:treyhope_dev/components/work_history_card.dart';
import 'package:treyhope_dev/constants/globals.dart';
import 'package:treyhope_dev/constants/spotify_artist.dart';

// By using the @client annotation this component will be automatically compiled to javascript and mounted
// on the client. Therefore:
// - this file and any imported file must be compilable for both server and client environments.
// - this component and any child components will be built once on the server during pre-rendering and then
//   again on the client during normal rendering.
class About extends StatelessComponent {
  const About({super.key});

  @override
  Component build(BuildContext context) {
    return Scaffold(
      title: 'About',
      subtitle: 'Nice to meet you—let me tell you my story.',
      sections: [
        section(classes: 'section has-background-dark', [
          div(classes: 'container', [
            div(
              classes: 'columns is-multiline is-mobile is-vcentered',
              [
                div(classes: 'column is-12-mobile is-3-tablet is-3-desktop', [
                  // Only using section here for extra padding around image.
                  div(classes: 'section', [
                    figure(classes: 'image is-square', [
                      img(classes: 'is-rounded', src: '/images/profile.jpg'),
                    ]),
                  ]),
                ]),
                div(classes: 'column is-12-mobile is-9-tablet is-9-desktop', [
                  div(classes: 'block', [
                    h4(classes: 'title is-4', [
                      .text(
                        'I\'m a software developer that has a knack for creating. A small town in Ohio named '
                        'Trotwood is the start, and Austin, TX is my base currently. Being a quote unquote, "tech guy", what started as '
                        'graphic design using Photoshop, has evolved into a core love for software development.',
                      ),
                    ]),
                    h5(classes: 'subtitle is-5', [
                      .text(
                        'My hobbies include;',
                      ),
                    ]),
                    div(
                      classes: 'block',
                      styles: Styles(
                        display: Display.flex,
                        flexWrap: FlexWrap.wrap,
                        gap: Gap(column: 0.5.rem, row: 0.5.rem),
                      ),
                      [
                        for (final hobby in Globals.hobbies)
                          span(classes: 'tag is-warning is-medium', [
                            .text(hobby),
                          ]),
                      ],
                    ),
                  ]),
                ]),
              ],
            ),
          ]),
        ]),
        section(classes: 'section has-background-link-dark', [
          div(classes: 'container', [
            div(classes: 'has-text-centered', [
              h3(classes: 'title is-3', [.text('Take my quiz')]),
              h5(classes: 'subtitle is-5', [.text('It won\'t take long, I promise.')]),
            ]),
            Spacer(.xl),
            EmbeddedQuizWidget(),
            _Sentence(),
          ]),
        ]),
        section(classes: 'section has-background-dark', [
          div(classes: 'container', [
            div(classes: 'has-text-centered', [
              h3(classes: 'title is-3', [.text('Who I Listen To')]),
              h5(classes: 'subtitle is-5', [.text('Some of my favorite music artists')]),
            ]),
            Spacer(.xl),
            div(
              classes: 'columns is-multiline is-mobile',
              [
                for (int i = 0; i < SpotifyArtist.values.length; i++)
                  div(classes: 'column is-12-mobile is-6-tablet is-3-desktop', [
                    SpotifyArtistPreview(
                      artist: SpotifyArtist.values[i],
                    ),
                  ]),
              ],
            ),
          ]),
        ]),
        section(classes: 'section has-background-link-dark', [
          div(classes: 'container', [
            div(classes: 'has-text-centered', [
              h3(classes: 'title is-3', [.text('Employment History')]),
              h5(classes: 'subtitle is-5', [.text('Flutter development has been my focus since the beginning.')]),
            ]),
            Spacer(.xl),
            div(classes: 'columns', [
              div(classes: 'columns is-multiline', [
                for (final workHistory in Globals.workHistories)
                  div(classes: 'column is-half', [
                    WorkHistoryCard(data: workHistory),
                  ]),
              ]),
            ]),
          ]),
        ]),
      ],
    );
  }
}

class _Sentence extends StatelessComponent {
  const _Sentence();

  static const String _dartHref = 'https://dart.dev';
  static const String _flutterHref = 'https://flutter.dev';

  @override
  Component build(BuildContext context) => div(id: 'footer-sentence', classes: 'content has-text-centered', [
    p([
      .text(
        'One of the many reasons I love ',
      ),
      SmartLink(
        href: _dartHref,
        children: [
          .text('Dart'),
        ],
      ),
      .text(' and '),
      SmartLink(
        href: _flutterHref,
        children: [
          .text('Flutter'),
        ],
      ),
    ]),
    .text(
      ' is the ability to embed Flutter widgets. This site is HTML and CSS, but this widget is pure Flutter.',
    ),
  ]);
}
