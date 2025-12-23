part of '../quiz.dart';

/// List of quiz questions about the developer
/// Correct answers are pulled from the _QuizAnswers enum
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
