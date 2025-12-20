import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_flutter_embed/jaspr_flutter_embed.dart';

// and is imported as a deferred library, to not block hydration of the remaining website.
@Import.onWeb('../widgets/walkdown_game.dart', show: [#WalkdownGame])
import 'embedded_walkdown_game.imports.dart' deferred as game;

class EmbeddedWalkdownGame extends StatelessComponent {
  const EmbeddedWalkdownGame({super.key});

  @override
  Component build(BuildContext context) {
    return FlutterEmbedView.deferred(
      styles: Styles(margin: .only(top: 2.rem)),
      // We need to set constraints as the flutter view cannot dynamically size itself.
      constraints: ViewConstraints(
        minWidth: 300,
        minHeight: 100,
        maxWidth: double.infinity,
        maxHeight: double.infinity,
      ),
      // The [FlutterEmbedView.deferred] component will take care of loading
      // the widget and initializing flutter.
      loadLibrary: game.loadLibrary(),
      builder: () => game.WalkdownGame(),
    );
  }
}
