import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class SpotifyPreview extends StatelessComponent {
  final String src;

  const SpotifyPreview({required this.src});

  @override
  Component build(BuildContext context) {
    return iframe(
      id: 'spotify-embed-iframe',
      src: src,
      styles: Styles(radius: BorderRadius.circular(12.px)),
      allow: 'autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture',
      attributes: {
        'width': '100%',
        'height': '100%',
      },
      [],
    );
  }
}
