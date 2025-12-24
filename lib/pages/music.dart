import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/spacer.dart';
import 'package:treyhope_dev/components/spotify_preview.dart';
import 'package:treyhope_dev/constants/spotify_track.dart';

@client
class Music extends StatelessComponent {
  const Music({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'container is-max-desktop section', [
      div(classes: 'block', [
        h1(classes: 'title is-1', [.text('Code Flows')]),
      ]),
      article(classes: 'message is-link', [
        div(classes: 'message-header', [
          p([
            .text('Purpose of Code Flows'),
          ]),
        ]),
        div(classes: 'message-body', [
          .text(
            '''
I created this project to combine my two greatest passions—rapping and coding—in a way that's both educational and fun. By teaching programming concepts through rap, I can make complex topics more accessible and engaging for others. At the same time, I'm deepening my own understanding, since the best way to truly learn something is to teach it. This project also serves a broader purpose: it challenges the narrow focus on hip hop's negative aspects and showcases the genre's incredible versatility as a form of expression for diverse, meaningful topics.          ''',
          ),
        ]),
      ]),
      div(classes: 'block', [
        h5([.text('Listen to some example code flows via Spotify')]),
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
    ]);
  }

  @css
  static List<StyleRule> get styles => [];
}
