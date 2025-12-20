import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_flutter_embed/jaspr_flutter_embed.dart';
import 'package:treyhope_dev/extensions/widget_extensions.dart';

@Import.onWeb('../widgets/lottie_widget.dart', show: [#LottieWidget])
import 'embedded_lottie_widget.imports.dart' deferred as _import;

class EmbeddedLottieWidget extends StatelessComponent {
  const EmbeddedLottieWidget({super.key});

  @override
  Component build(BuildContext context) => FlutterEmbedView.deferred(
    id: 'counter_widget',
    styles: Styles(margin: .only(top: 2.rem)),
    constraints: ViewConstraints(
      minWidth: 500,
      minHeight: 300,
      maxWidth: double.infinity,
      maxHeight: double.infinity,
    ),
    loadLibrary: _import.loadLibrary(),
    builder: () => _import.LottieWidget().mApp(),
  );
}
