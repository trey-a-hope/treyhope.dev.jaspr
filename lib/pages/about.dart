import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/about_card.dart';
import 'package:treyhope_dev/components/spacer.dart';
import 'package:treyhope_dev/components/work_history_card.dart';
import 'package:treyhope_dev/constants/globals.dart';

// By using the @client annotation this component will be automatically compiled to javascript and mounted
// on the client. Therefore:
// - this file and any imported file must be compilable for both server and client environments.
// - this component and any child components will be built once on the server during pre-rendering and then
//   again on the client during normal rendering.
@client
class About extends StatelessComponent {
  const About({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'container is-max-desktop section', [
      div(classes: 'block', [
        h1(classes: 'title is-1', [.text('About')]),
      ]),
      AboutCard(),
      Spacer(.xl),
      h3(classes: 'title is-3', [.text('Hobbies')]),
      Spacer(.xl),
      h3(classes: 'title is-3', [.text('Employment History')]),
      div(classes: 'columns is-multiline', [
        for (final workHistory in Globals.workHistories)
          div(classes: 'column is-half', [
            WorkHistoryCard(data: workHistory),
          ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [];
}
