part of '../quiz.dart';

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
