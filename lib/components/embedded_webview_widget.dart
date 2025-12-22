import 'package:jaspr/jaspr.dart';
import 'package:jaspr_flutter_embed/jaspr_flutter_embed.dart';

@Import.onWeb('../widgets/webview_widget.dart', show: [#WebviewWidget])
import 'embedded_webview_widget.imports.dart' deferred as _import;

class EmbeddedWebviewWidget extends StatelessComponent {
  final String url;
  const EmbeddedWebviewWidget(this.url, {super.key});

  @override
  Component build(BuildContext context) => FlutterEmbedView.deferred(
    id: 'webview_widget',
    constraints: ViewConstraints(minWidth: 500, minHeight: 300, maxWidth: 1000, maxHeight: 750),
    loadLibrary: _import.loadLibrary(),

    builder: () => _import.WebviewWidget(url),
  );
}
