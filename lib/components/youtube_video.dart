import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/bulma_message_body.dart';
import 'package:treyhope_dev/constants/youtube_short.dart';

class YoutubeVideo extends StatelessComponent {
  final YoutubeShort short;

  const YoutubeVideo({required this.short});

  @override
  Component build(BuildContext context) {
    return div([
      iframe(
        src: 'https://www.youtube.com/embed/${short.id}',
        allow: 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share',
        referrerPolicy: ReferrerPolicy.strictOriginWhenCrossOrigin,
        attributes: {
          'width': '100%',
          'height': '352',
          'title': 'YouTube video player',
          'frameborder': '0',
          'allowfullscreen': '',
        },
        [],
      ),
      BulmaMessageBody(
        body: short.description,
        color: 'is-warning',
      ),
    ]);
  }
}
