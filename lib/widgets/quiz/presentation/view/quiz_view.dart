part of '../../quiz.dart';

/// Main quiz view that displays either the active quiz or results screen
class _QuizView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final quizCubit = context.read<_QuizCubit>();

    return BlocBuilder<_QuizCubit, _QuizState>(
      builder: (context, state) {
        final result = state.result;
        final pos = state.pos;

        // Show results screen when quiz is complete
        if (result != null) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
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

        // Show active quiz with animated gradient backgrounds
        return QuizWidget(
          config: QuizConfig(
            backgroundColor: Color(0xFF1E3A8A),
            cornerRadius: 16,
            padding: EdgeInsets.all(24),
            allowBackwardNavigation: false,
            autoNavigationDelay: Duration(milliseconds: 1000),
            gradientColors: _Gradiants.gradiants[pos], // Dynamic gradient per question
            animationDuration: Duration(milliseconds: 300),
          ),
          questions: _questions,
          onQuizCompleted: (questions) => quizCubit.gradeQuiz(questions),
          onAnswerChanged: (question, answer) {
            // Validate answer against correct answer for this question
            final isCorrect = quizCubit.validate(answer);

            quizCubit.incrementPos();

            // Show feedback toast based on answer correctness
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
