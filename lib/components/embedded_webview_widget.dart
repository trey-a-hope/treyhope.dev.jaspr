import 'package:jaspr/dom.dart';
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
    styles: Styles(
      radius: BorderRadius.circular(120.px),
      raw: {'width': '100%', 'height': '500px'},
    ),
    loadLibrary: _import.loadLibrary(),
    builder: () => _import.WebviewWidget(url),
  );
}
