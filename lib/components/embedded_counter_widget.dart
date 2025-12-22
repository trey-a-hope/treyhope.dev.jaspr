import 'package:jaspr/jaspr.dart';
import 'package:jaspr_flutter_embed/jaspr_flutter_embed.dart';

@Import.onWeb('../widgets/counter_widget.dart', show: [#CounterWidget])
import 'embedded_counter_widget.imports.dart' deferred as _import;

class EmbeddedCounterWidget extends StatelessComponent {
  const EmbeddedCounterWidget({super.key});

  @override
  Component build(BuildContext context) => FlutterEmbedView.deferred(
    id: 'counter_widget',
    constraints: ViewConstraints(
      minWidth: 500,
      minHeight: 300,
      maxWidth: double.infinity,
      maxHeight: double.infinity,
    ),
    loadLibrary: _import.loadLibrary(),
    builder: () => _import.CounterWidget(),
  );
}
