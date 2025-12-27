import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_flutter_embed/jaspr_flutter_embed.dart';

@Import.onWeb('../widgets/counter_widget.dart', show: [#CounterWidget])
import 'embedded_counter_widget.imports.dart' deferred as _import;

class EmbeddedCounterWidget extends StatelessComponent {
  const EmbeddedCounterWidget({super.key});

  @override
  Component build(BuildContext context) => FlutterEmbedView.deferred(
    id: 'counter_widget',
    styles: Styles(raw: {'width': '100%', 'height': '300px'}),
    loadLibrary: _import.loadLibrary(),
    builder: () => _import.CounterWidget(),
  );
}
