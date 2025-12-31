import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/bulma_message_header.dart';
import 'package:treyhope_dev/components/scaffold.dart';
import 'package:treyhope_dev/components/smart_link.dart';
import 'package:treyhope_dev/components/spacer.dart';
import 'package:treyhope_dev/components/spotify_preview.dart';
import 'package:treyhope_dev/components/youtube_video.dart';
import 'package:treyhope_dev/constants/spotify_track.dart';
import 'package:treyhope_dev/constants/youtube_short.dart';

class CodeFlows extends StatelessComponent {
  static const _youtubePlaylistHref =
      'https://youtube.com/playlist?list=PL6eNwCeOO4l7fAximdILxgQlZD4NIbozV&si=Nl1ICEpIRlx4HI4Y';

  const CodeFlows({super.key});

  @override
  Component build(BuildContext context) {
    return Scaffold(
      title: 'Code Flows',
      subtitle: 'Learning code has never been easier',
      sections: [
        section(
          classes: 'section has-background-dark',
          [
            div(
              classes: 'container',
              [
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
                  color: 'is-warning',
                ),
              ],
            ),
          ],
        ),
        section(
          classes: 'section has-background-link-dark',
          [
            div(classes: 'container', [
              div(classes: 'has-text-centered', [
                h3(classes: 'title is-3', [.text('Watch some example code flows via YouTube')]),
                h5(classes: 'subtitle is-5', [
                  .text(
                    'Step by step instructions for each track.',
                  ),
                ]),
              ]),
              Spacer(.xl),
              div(
                classes: 'columns is-multiline is-mobile',
                [
                  for (int i = 0; i < YoutubeShort.values.length; i++)
                    div(classes: 'column is-12-mobile is-4-tablet', [
                      YoutubeVideo(
                        short: YoutubeShort.values[i],
                      ),
                    ]),
                ],
              ),
              div(classes: 'block', [
                p(classes: 'has-text-centered', [
                  .text(
                    'Want to learn more? Checkout out the full',
                  ),
                  SmartLink(
                    href: _youtubePlaylistHref,
                    children: [
                      .text(' YouTube playlist '),
                    ],
                  ),
                  .text(
                    'to see video demonstrations for each track.',
                  ),
                ]),
              ]),
            ]),
          ],
        ),
        section(
          classes: 'section has-background-dark',
          [
            div(
              classes: 'container',
              [
                div(classes: 'has-text-centered', [
                  h3(classes: 'title is-3', [.text('Listen to some example code flows via Spotify')]),
                  h5(classes: 'subtitle is-5', [
                    .text(
                      'Each track is carefully crafted to be both technically accurate and musically engaging.',
                    ),
                  ]),
                ]),
                Spacer(.xl),
                div(
                  classes: 'columns is-multiline is-mobile',
                  [
                    for (int i = 0; i < SpotifyTrack.values.length; i++)
                      div(classes: 'column is-12-mobile is-6-tablet', [
                        // Changed to is-12-mobile and is-6-tablet
                        SpotifyPreview(
                          src: SpotifyTrack.values[i].src,
                        ),
                      ]),
                  ],
                ),
                div(classes: 'block', [
                  p(classes: 'has-text-centered', [
                    .text(
                      'Available also on',
                    ),
                    SmartLink(
                      href: 'https://music.apple.com/us/artist/travisty/1469723679',
                      children: [
                        .text(' Apple Music'),
                      ],
                    ),
                    .text(','),
                    SmartLink(
                      href: 'https://www.youtube.com/channel/UCx01WT9gGrPCzuuzzc8NDlA',
                      children: [
                        .text(' YouTube Music'),
                      ],
                    ),

                    .text(
                      ', and all other streaming platforms.',
                    ),
                  ]),
                ]),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @css
  static List<StyleRule> get styles => [];
}
