import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/bulma_message_header.dart';
import 'package:treyhope_dev/components/bulma_hero.dart';
import 'package:treyhope_dev/components/spotify_preview.dart';
import 'package:treyhope_dev/constants/spotify_track.dart';

@client
class CodeFlows extends StatelessComponent {
  static const _youtubePlaylistHref =
      'https://youtube.com/playlist?list=PL6eNwCeOO4l7fAximdILxgQlZD4NIbozV&si=Nl1ICEpIRlx4HI4Y';

  const CodeFlows({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'container is-max-desktop', [
      BulmaHero(title: 'Code Flows', subtitle: 'Learning code has never been easier.'),
      section(classes: 'container is-max-desktop section', [
        div(classes: 'block', [
          p([
            .text(
              'Code Flows transforms programming tutorials into catchy, memorable rap songs. Each track breaks down a specific coding concept—from variables and loops to algorithms and design patterns—using rhythm, wordplay, and storytelling to make learning stick.',
            ),
          ]),
        ]),
        BulmaMessageHeader(
          title: 'Purpose of Code Flows',
          body: '''
    I created this project to combine my two greatest passions—rapping and coding—in a way that's both educational and fun. By teaching programming concepts through rap, I can make complex topics more accessible and engaging for others. At the same time, I'm deepening my own understanding, since the best way to truly learn something is to teach it. This project also serves a broader purpose: it challenges the narrow focus on hip hop's negative aspects and showcases the genre's incredible versatility as a form of expression for diverse, meaningful topics.          ''',
        ),
        div(classes: 'block', [
          p([
            .text(
              'Whether you\'re a beginner trying to grasp the basics or an experienced developer looking for a fresh perspective, Code Flows offers a unique learning experience. The combination of music and education taps into different parts of your brain, helping concepts click in ways traditional tutorials can\'t.',
            ),
          ]),
        ]),
        div(classes: 'block', [
          h4(classes: 'title is-4', [.text('Listen to some example code flows via Spotify')]),
        ]),
        div(classes: 'block', [
          p([
            .text(
              'Each track is carefully crafted to be both technically accurate and musically engaging. You\'ll find yourself replaying songs not just because they\'re catchy, but because they genuinely help you understand and remember important programming concepts.',
            ),
          ]),
        ]),
        div(
          classes: 'columns is-multiline',
          [
            for (int i = 0; i < SpotifyTrack.values.length; i++)
              div(classes: 'column is-half', [
                SpotifyPreview(
                  src: SpotifyTrack.values[i].src,
                ),
              ]),
          ],
        ),
        div(classes: 'block', [
          p([
            .text(
              'Want to learn more? Checkout out the full',
            ),
            a(href: _youtubePlaylistHref, target: Target.blank, [.text(' YouTube playlist ')]),
            .text(
              'to see video demonstrations for each track.',
            ),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    //     // Apply larger padding on desktop (screens wider than 768px)
    // css.media(MediaQuery.screen(minWidth: Globals.desktopBreakpoint.px), [
    //   css('.navbar-container').styles(
    //     padding: Padding.symmetric(horizontal: 3.5.rem),
    //   ),
    // ]),
  ];
}
