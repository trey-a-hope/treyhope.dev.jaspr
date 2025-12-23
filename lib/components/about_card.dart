import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

class AboutCard extends StatelessComponent {
  static const _imageUrl = 'https://i.ytimg.com/vi/mp5N0ENPuOw/maxresdefault.jpg';
  static const _videoUrl = 'https://www.youtube.com/watch?v=mp5N0ENPuOw';

  const AboutCard({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'card', [
      div(classes: 'card-image', [
        figure(classes: 'image is-4by2', [
          img(
            src: _imageUrl,
            alt: 'Placeholder image',
          ),
        ]),
      ]),
      div(classes: 'card-content', [
        div(classes: 'media', [
          p(classes: 'title is-4', [
            .text('Trey Hope'),
          ]),
        ]),
        div(classes: 'content', [
          div(classes: 'block', [
            p([
              .text(
                'I\'m a software developer that has a knack for creating. A small town in Ohio named '
                'Trotwood is the start, and Austin, TX is my base currently. Being a quote unquote, "tech guy", what started as '
                'graphic design using Photoshop, has evolved into a core love for mobile app development.',
              ),
            ]),
          ]),
          div(classes: 'block', [
            p([
              .text(
                'My favorite framework to work with is',
              ),
              strong([
                .text(' Flutter'),
              ]),
              .text(
                ' if you haven\'t figured out yet. Being able to make video games, web apps, and desktop dashboards, all from a single code base is what has kept me coding. My goal is to keep learning about the best hybrid framework on the planet, while continuing that knack for creativity.',
              ),
            ]),
          ]),
          Link(
            to: _videoUrl,
            child: button(
              classes: 'button',
              [.text('Watch video')],
            ),
          ),
        ]),
      ]),
    ]);
  }
}
