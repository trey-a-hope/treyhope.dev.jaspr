import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidget extends StatelessWidget {
  const LottieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'animation.json',
      width: 400, // Optional: specify width
      height: 400, // Optional: specify height
      fit: BoxFit.fill, // Optional: specify fit
    );
  }
}
