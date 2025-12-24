import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/blog_card.dart';
import 'package:treyhope_dev/components/bulma_hero.dart';
import 'package:treyhope_dev/components/bulma_pagination.dart';

@client
class Blog extends StatelessComponent {
  static const _batchCount = 10;

  const Blog({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'container is-max-desktop', [
      BulmaHero(title: 'Blog', subtitle: 'Thoughts on code, culture, and everything in between.'),
      section(classes: 'container is-max-desktop section', [
        for (int i = 0; i < _batchCount; i++) BlogCard(),
        BulmaPagination(totalBlogCount: 12, batchCount: _batchCount, currentIndex: 0),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [];
}
