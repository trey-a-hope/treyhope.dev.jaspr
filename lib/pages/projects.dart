import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/embedded_lottie_widget.dart';

@client
class Projects extends StatelessComponent {
  const Projects({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'centered-container', [
      h1(classes: 'title', [.text('Projects')]),
      p([
        .text('Here are some of the projects I have worked on.'),
      ]),
      div([
        .text('Projectss'),
      ]),
      EmbeddedLottieWidget(),
    ]);
  }

  @css
  static List<StyleRule> get styles => [];
}
