import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:animated_quiz_widget/quiz_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';
import 'package:treyhope_dev/extensions/widget_extensions.dart';

// Quiz module parts - organized by layer (data, presentation)
part 'data/questions.dart';
part 'presentation/view/quiz_view.dart';
part 'presentation/cubit/quiz_cubit.dart';
part 'presentation/cubit/quiz_state.dart';
part 'data/answers.dart';
part 'presentation/gradiants.dart';

/// Main quiz widget that provides state management via BLoC pattern
class Quiz extends StatelessWidget {
  Quiz({super.key}) {
    // Ensure we have matching gradients for each question transition, plus one
    assert(_questions.length == _Gradiants.gradiants.length - 1);
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => _QuizCubit(),
    child: _QuizView().materialApp(),
  );
}
