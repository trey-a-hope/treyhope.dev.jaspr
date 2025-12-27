import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/constants/blog_category.dart';

class BulmaTabs extends StatefulComponent {
  const BulmaTabs({super.key});

  @override
  State<BulmaTabs> createState() => BulmaTabsState();
}

class BulmaTabsState extends State<BulmaTabs> {
  BlogCategory cateogry = BlogCategory.all;

  /// Toggles the mobile menu open/closed state
  void _updateIndex(BlogCategory newCategory) => setState(() => this.cateogry = newCategory);

  @override
  Component build(BuildContext context) {
    return div(classes: 'tabs is-toggle is-toggle-rounded is-centered', [
      ul([
        li(classes: '${cateogry == BlogCategory.all ? 'is-active' : ''}', [
          a(
            href: '',
            events: {
              'click': (event) {
                event.preventDefault();
                _updateIndex(BlogCategory.all);
              },
            },
            [
              span(classes: 'icon is-small', [
                i(classes: 'fas fa-border-all', []),
              ]),
              span([
                .text('All'),
              ]),
            ],
          ),
        ]),
        li(classes: '${cateogry == BlogCategory.coffeeCode ? 'is-active' : ''}', [
          a(
            href: '',
            events: {
              'click': (event) {
                event.preventDefault();
                _updateIndex(BlogCategory.coffeeCode);
              },
            },
            [
              span(classes: 'icon is-small', [
                i(classes: 'fas fa-mug-saucer', []),
              ]),
              span([
                .text('Coffee & Code'),
              ]),
            ],
          ),
        ]),
        li(
          classes: '${cateogry == BlogCategory.crashCourse ? 'is-active' : ''}',
          [
            a(
              href: '',
              events: {
                'click': (event) {
                  event.preventDefault();
                  _updateIndex(BlogCategory.crashCourse);
                },
              },
              [
                span(classes: 'icon is-small', [
                  i(classes: 'fas fa-person-chalkboard', []),
                ]),
                span([
                  .text('Crash Courses'),
                ]),
              ],
            ),
          ],
        ),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    // Target the active tab and change its background color
    css(
      '.tabs.is-toggle li.is-active a',
    ).styles(backgroundColor: Colors.navy), // Change to your desired color
    // Optional: Also change the text color for better contrast
    css('.tabs.is-toggle li.is-active a').styles(color: Colors.white),
  ];
}
