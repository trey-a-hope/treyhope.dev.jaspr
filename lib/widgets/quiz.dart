import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:animated_quiz_widget/quiz_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';
import 'package:treyhope_dev/extensions/widget_extensions.dart';

class Quiz extends StatelessWidget {
  Quiz({super.key}) {
    assert(_questions.length == _Gradiants.gradiants.length - 1);
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => _QuizCubit(),
    child: _QuizView().materialApp(),
  );
}

final List<QuizQuestion> _questions = [
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
];

class _QuizView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quizCubit = context.read<_QuizCubit>();
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<_QuizCubit, _QuizState>(
      builder: (context, state) {
        final result = state.result;
        final pos = state.pos;

        if (result != null) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              // color: Colors.lightBlue,
              gradient: LinearGradient(
                colors: _Gradiants.green,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
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
          config: QuizConfig(
            backgroundColor: Color(0xFF1E3A8A),
            cornerRadius: 16,
            padding: EdgeInsets.all(24),
            allowBackwardNavigation: false,
            autoNavigationDelay: Duration(milliseconds: 1000),
            gradientColors: _Gradiants.gradiants[pos],
            animationDuration: Duration(milliseconds: 300),
          ),
          questions: _questions,
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

            quizCubit.incrementPos();

            if (isCorrect) {
              toastification.show(
                context: context,
                title: Text('Correct!'),
                type: ToastificationType.success,
                autoCloseDuration: Duration(seconds: 2),
                closeButton: ToastCloseButton(showType: CloseButtonShowType.none),
              );
            } else {
              toastification.show(
                context: context,
                title: Text('Sorry, incorrect.'),
                type: ToastificationType.error,
                autoCloseDuration: Duration(seconds: 2),
                closeButton: ToastCloseButton(showType: CloseButtonShowType.none),
              );
            }
          },
        );
      },
    );
  }
}

class _QuizCubit extends Cubit<_QuizState> {
  _QuizCubit() : super(_QuizState());

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
        emit(_QuizState(result: '0/5 - 😅 You were guessing on every question huh?'));
      case 1:
        emit(_QuizState(result: '1/5 - 😅 Let\'s start over - I\'m Trey!'));
      case 2:
        emit(_QuizState(result: '2/5 - 🤔 We should grab coffee and chat!'));
      case 3:
        emit(_QuizState(result: '3/5 - 👍 Not bad! You\'ve been paying attention!'));
      case 4:
        emit(_QuizState(result: '4/5 - 🌟 We\'re basically best friends now!'));
      case 5:
        emit(_QuizState(result: '5/5 - 🎉 You know me better than I know myself!'));
      default:
        emit(_QuizState(result: 'How did we end up here?'));
    }
  }

  void resetQuiz() => emit(_QuizState(pos: 0));

  void incrementPos() {
    print('Current pos: ${state.pos}');
    emit(state.copyWith(pos: state.pos + 1));
  }
}

class _QuizState extends Equatable {
  final String? result;
  final int pos;

  const _QuizState({this.result, this.pos = 0});

  _QuizState copyWith({String? result, int? pos}) => _QuizState(result: result, pos: pos ?? this.pos);

  @override
  List<Object?> get props => [result, pos];
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

class _Gradiants {
  const _Gradiants._();

  static const blue = [
    Color(0xFF1E3A8A), // Deep blue
    Color(0xFF3B4CCA), // Royal blue
    Color(0xFF1E3A8A), // Back to deep blue
  ];

  static const green = [
    Color(0xFF064E3B), // Deep forest green
    Color(0xFF10B981), // Emerald green
    Color(0xFF064E3B), // Back to deep forest
  ];

  static const yellow = [
    Color(0xFF92400E), // Deep amber/brown
    Color(0xFFFBBF24), // Bright gold
    Color(0xFF92400E), // Back to deep amber
  ];

  static const red = [
    Color(0xFF7F1D1D), // Deep crimson
    Color(0xFFEF4444), // Bright red
    Color(0xFF7F1D1D), // Back to deep crimson
  ];

  static const purple = [
    Color(0xFF4C1D95), // Deep violet
    Color(0xFF8B5CF6), // Bright purple
    Color(0xFF4C1D95), // Back to deep violet
  ];

  static const grey = [
    Color(0xFF1F2937), // Deep charcoal
    Color(0xFF6B7280), // Bright grey
    Color(0xFF1F2937), // Back to deep charcoal
  ];

  static List<List<Color>> get gradiants => [blue, green, yellow, red, purple, grey];
}
