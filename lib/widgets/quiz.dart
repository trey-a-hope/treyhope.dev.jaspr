import 'package:flutter/material.dart';
import 'package:animated_quiz_widget/quiz_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';
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
              color: Colors.lightBlue,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      result,
                      style: textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => quizCubit.resetQuiz(),
                      child: const Text('Play Again'),
                    ),
                  ],
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
                options: [_QuizAnswers.q1.value, 'The Dark Knight', 'The Godfather', 'Toy Story'],
              ),
              QuizQuestion(
                id: 'q2',
                question: 'Where did I grow up?',
                options: ['Aurora, Colorado', 'Waco, Texas', _QuizAnswers.q2.value, 'Detroit, Michigan'],
              ),
              QuizQuestion(
                id: 'q3',
                question: 'What was my first creative tool?',
                options: [
                  _QuizAnswers.q3.value,
                  'Blender',
                  'Unity',
                  'Illustrator',
                ],
              ),
              QuizQuestion(
                id: 'q4',
                question: 'What is my rap name?',
                options: ['Lil T', _QuizAnswers.q4.value, 'trey.codes', 'Tremane'],
              ),
              QuizQuestion(
                id: 'q5',
                question: 'What month was I born?',
                options: [
                  'January',
                  'April',
                  _QuizAnswers.q5.value,
                  'September',
                ],
              ),
            ],
            onQuizCompleted: (questions) => quizCubit.gradeQuiz(questions),
            onAnswerChanged: (question, answer) {
              late bool isCorrect;

              switch (question.id) {
                case 'q1':
                  isCorrect = answer == _QuizAnswers.q1.value;
                  break;
                case 'q2':
                  isCorrect = answer == _QuizAnswers.q2.value;
                  break;
                case 'q3':
                  isCorrect = answer == _QuizAnswers.q3.value;
                  break;
                case 'q4':
                  isCorrect = answer == _QuizAnswers.q4.value;
                  break;
                case 'q5':
                  isCorrect = answer == _QuizAnswers.q5.value;
                  break;
                default:
                  isCorrect = false;
                  break;
              }

              if (isCorrect) {
                toastification.show(context: context, title: Text('Correct! :)'), type: ToastificationType.success);
              } else {
                toastification.show(
                  context: context,
                  title: Text('Sorry, incorrect :('),
                  type: ToastificationType.error,
                );
              }
            },
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
          if (question.selectedAnswer == _QuizAnswers.q1.value) {
            score++;
          }
          break;
        case 'q2':
          if (question.selectedAnswer == _QuizAnswers.q2.value) {
            score++;
          }
          break;
        case 'q3':
          if (question.selectedAnswer == _QuizAnswers.q3.value) {
            score++;
          }
          break;
        case 'q4':
          if (question.selectedAnswer == _QuizAnswers.q4.value) {
            score++;
          }
          break;
        case 'q5':
          if (question.selectedAnswer == _QuizAnswers.q5.value) {
            score++;
          }
          break;
      }
    }

    switch (score) {
      case 0:
        emit('0/5 - 😅 You were guessing on every question huh?');
      case 1:
        emit('1/5 - 😅 Let\'s start over - I\'m Trey!');
      case 2:
        emit('2/5 - 🤔 We should grab coffee and chat!');
      case 3:
        emit('3/5 - 👍 Not bad! You\'ve been paying attention!');
      case 4:
        emit('4/5 - 🌟 We\'re basically best friends now!');
      case 5:
        emit('5/5 - 🎉 You know me better than I know myself!');
      default:
        emit('How did we end up here?');
    }
  }

  void resetQuiz() => emit(null);
}

enum _QuizAnswers {
  q1('q1', 'The Matrix'),
  q2('q2', 'Trotwood, Ohio'),
  q3('q3', 'Photoshop'),
  q4('q4', 'Travisty'),
  q5('q5', 'June')
  ;

  final String value;
  final String id;

  const _QuizAnswers(this.id, this.value);
}
