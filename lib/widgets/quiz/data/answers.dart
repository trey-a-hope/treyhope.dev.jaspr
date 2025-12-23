part of '../quiz.dart';

/// Enum defining the correct answers for each quiz question
enum _QuizAnswers {
  q1('q1', 'The Matrix'),
  q2('q2', 'Trotwood, Ohio'),
  q3('q3', 'Photoshop'),
  q4('q4', 'Travisty'),
  q5('q5', 'June')
  ;

  final String value; // The correct answer text
  final String id;    // Question identifier

  const _QuizAnswers(this.id, this.value);

  /// Returns a list of all correct answer values
  static List<String> get answers => _QuizAnswers.values.map((e) => e.value).toList();
}
