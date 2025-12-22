import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/embedded_lottie_widget.dart';
import 'package:treyhope_dev/constants/lottie_type.dart';

@client
class CodeFlows extends StatelessComponent {
  const CodeFlows({super.key});

  @override
  Component build(BuildContext context) {
    return const section(classes: 'container is-max-desktop section', [
      h1(classes: 'title', [.text('Code Flows')]),
      h4([
        .text('Page currently under construction'),
      ]),
      EmbeddedLottieWidget(type: LottieType.underConstruction),
    ]);
  }

  @css
  static List<StyleRule> get styles => [];
}
