import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_flutter_embed/jaspr_flutter_embed.dart';

@Import.onWeb('../widgets/counter_widget.dart', show: [#CounterWidget])
import 'embedded_counter_widget.imports.dart' deferred as counter;

class EmbeddedCounterWidget extends StatelessComponent {
  const EmbeddedCounterWidget({super.key});

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
    loadLibrary: counter.loadLibrary(),
    builder: () => counter.CounterWidget(),
  );
}
