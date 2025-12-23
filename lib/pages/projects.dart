import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/button_group.dart';
import 'package:treyhope_dev/components/spacer.dart';

@client
class Projects extends StatelessComponent {
  const Projects({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'container is-max-desktop section', [
      div(classes: 'block', [
        h1(classes: 'title is-1', [.text('Projects')]),
      ]),

      ButtonGroup(
        isAttached: true,
        children: [
          Button(
            child: IconLabel(icon: 'mobile', label: 'Mobile'),
            onPressed: () {},
          ),
          Button(
            child: IconLabel(icon: 'window-maximize', label: 'Web'),
            onPressed: () {},
          ),
          Button(
            child: IconLabel(icon: 'desktop', label: 'Desktop'),
            onPressed: () {},
          ),
        ],
      ),
      Spacer(.xl),
      div(classes: 'block', [
        h3(classes: 'title is-3 has-text-centered', [.text('Mobile')]),
        p(classes: 'has-text-centered', [.text('Applications I\'ve made for iOS and Android')]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [];
}
