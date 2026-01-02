import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/constants/spotify_artist.dart';

class SpotifyArtistPreview extends StatelessComponent {
  final SpotifyArtist artist;

  const SpotifyArtistPreview({required this.artist});

  @override
  Component build(BuildContext context) {
    return iframe(
      id: 'spotify-embed-iframe',
      src: artist.src,
      styles: Styles(radius: BorderRadius.circular(12.px)),
      allow: 'autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture',
      attributes: {
        'width': '100%',
        'height': '352',
      },
      [],
    );
  }
}
