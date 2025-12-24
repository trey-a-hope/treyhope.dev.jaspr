part of '../../quiz.dart';

/// Cubit that manages quiz state and logic
class _QuizCubit extends Cubit<_QuizState> {
  _QuizCubit() : super(_QuizState());

  /// Checks if the provided answer matches any correct answer
  bool validate(String? answer) => _QuizAnswers.answers.contains(answer);

  /// Grades the quiz by comparing selected answers to correct answers
  /// Emits a result state with personalized message based on score
  void gradeQuiz(List<QuizQuestion> questions) {
    var score = 0;

    // Calculate score by checking each answer
    for (final question in questions) {
      if (validate(question.selectedAnswer)) {
        score++;
      }
    }

    // Emit personalized result based on score
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
    }
  }

  /// Resets quiz back to the beginning
  void resetQuiz() => emit(_QuizState(pos: 0));

  /// Moves to the next question
  void incrementPos() => emit(state.copyWith(pos: state.pos + 1));
}
