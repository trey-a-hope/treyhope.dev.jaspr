import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_flutter_embed/jaspr_flutter_embed.dart';

@Import.onWeb('../widgets/quiz/quiz.dart', show: [#Quiz])
import 'embedded_quiz_widget.imports.dart' deferred as _import;

class EmbeddedQuizWidget extends StatelessComponent {
  const EmbeddedQuizWidget({super.key});

  @override
  Component build(BuildContext context) => FlutterEmbedView.deferred(
    id: 'quiz_widget',
    styles: Styles(padding: Spacing.all(8.px), raw: {'width': '100%', 'height': '400px'}),
    loadLibrary: _import.loadLibrary(),
    builder: () => _import.Quiz(),
  );
}
