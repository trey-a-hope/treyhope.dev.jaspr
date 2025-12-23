import 'package:jaspr/jaspr.dart';
import 'package:jaspr_flutter_embed/jaspr_flutter_embed.dart';

@Import.onWeb('../widgets/quiz.dart', show: [#Quiz])
import 'embedded_quiz_widget.imports.dart' deferred as _import;

class EmbeddedQuizWidget extends StatelessComponent {
  const EmbeddedQuizWidget({super.key});

  @override
  Component build(BuildContext context) => FlutterEmbedView.deferred(
    id: 'quiz_widget',
    constraints: ViewConstraints(
      minWidth: 300,
      minHeight: 300,
      maxWidth: 300,
      maxHeight: 500,
    ),
    loadLibrary: _import.loadLibrary(),
    builder: () => _import.Quiz(),
  );
}
