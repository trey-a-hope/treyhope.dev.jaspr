part of '../../quiz.dart';

/// State class for the quiz, tracking current position and results
class _QuizState extends Equatable {
  final String? result; // Final quiz result message (null while in progress)
  final int pos;        // Current question index

  const _QuizState({this.result, this.pos = 0});

  /// Creates a copy of this state with updated values
  _QuizState copyWith({String? result, int? pos}) => _QuizState(result: result, pos: pos ?? this.pos);

  @override
  List<Object?> get props => [result, pos];
}
