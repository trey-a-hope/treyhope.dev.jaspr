import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:treyhope_dev/components/embedded_lottie_widget.dart';
import 'package:treyhope_dev/constants/lottie_type.dart';

@client
class Blog extends StatelessComponent {
  const Blog({super.key});

  @override
  Component build(BuildContext context) {
    return const section(classes: 'container is-max-desktop section', [
      h1(classes: 'title', [.text('Blog')]),
      h4([
        .text('Page currently under construction'),
      ]),
      EmbeddedLottieWidget(type: LottieType.underConstruction),
    ]);
  }

  @css
  static List<StyleRule> get styles => [];
}
