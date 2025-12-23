import 'package:flutter/material.dart';
import 'package:animated_quiz_widget/quiz_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:treyhope_dev/extensions/widget_extensions.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => QuizCubit(),
    child: QuizView().mApp(),
  );
}

class QuizView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quizCubit = context.read<QuizCubit>();
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: BlocBuilder<QuizCubit, String?>(
        builder: (context, result) {
          if (result != null) {
            return Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    result,
                    style: textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }

          return QuizWidget(
            config: QuizConfig(),
            questions: [
              QuizQuestion(
                id: 'q1',
                question: 'What is my favorite movie?',
                options: [
                  'The Matrix',
                  'The Dark Knight',
                  'The Godfather',
                ],
              ),
              QuizQuestion(
                id: 'q2',
                question: 'Where did I grow up?',
                options: [
                  'Aurora, Colorado',
                  'Waco, Texas',
                  'Trotwood, Ohio',
                ],
              ),
              QuizQuestion(
                id: 'q3',
                question: 'What was my first creative tool?',
                options: [
                  'Photoshop',
                  'Blender',
                  'Unity',
                ],
              ),
              QuizQuestion(
                id: 'q4',
                question: 'What is my rap name?',
                options: [
                  'Lil T',
                  'Travisty',
                  'trey.codes',
                ],
              ),
              QuizQuestion(
                id: 'q5',
                question: 'What month was I born?',
                options: [
                  'January',
                  'April',
                  'June',
                ],
              ),
            ],
            onQuizCompleted: (questions) => quizCubit.gradeQuiz(questions),
          );
        },
      ),
    );
  }
}

class QuizCubit extends Cubit<String?> {
  QuizCubit() : super(null);

  void gradeQuiz(List<QuizQuestion> questions) {
    var score = 0;

    for (final question in questions) {
      switch (question.id) {
        case 'q1':
          if (question.selectedAnswer == 'The Matrix') {
            score++;
          }
          break;
        case 'q2':
          if (question.selectedAnswer == 'Trotwood, Ohio') {
            score++;
          }
          break;
        case 'q3':
          if (question.selectedAnswer == 'Photoshop') {
            score++;
          }
          break;
        case 'q4':
          if (question.selectedAnswer == 'Travisty') {
            score++;
          }
          break;
        case 'q5':
          if (question.selectedAnswer == 'June') {
            score++;
          }
          break;
      }
    }

    switch (score) {
      case 0:
        emit('You were guessing on every question huh?');
      case 1:
        emit('😅 Let\'s start over - I\'m Trey!');
      case 2:
        emit('🤔 We should grab coffee and chat!');
      case 3:
        emit('👍 Not bad! You\'ve been paying attention!');
      case 4:
        emit('🌟 We\'re basically best friends now!');
      case 5:
        emit('🎉 You know me better than I know myself!');
      default:
        emit('How did we end up here?');
    }
  }

  void resetQuiz() => emit(null);
}
