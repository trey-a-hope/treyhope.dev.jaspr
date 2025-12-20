import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/embedded_lottie_widget.dart';
import 'package:treyhope_dev/constants/lottie_type.dart';

@client
class Projects extends StatelessComponent {
  const Projects({super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'centered-container', [
      h1(classes: 'title', [.text('Projects')]),
      h4([
        .text('Page currently under construction'),
      ]),
      EmbeddedLottieWidget(type: LottieType.underConstruction),
    ]);
  }

  @css
  static List<StyleRule> get styles => [];
}
