import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:treyhope_dev/extensions/widget_extensions.dart';

class LottieWidget extends StatelessWidget {
  const LottieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/animation.json',
      width: 400, // Optional: specify width
      height: 400, // Optional: specify height
      fit: BoxFit.fill, // Optional: specify fit
    ).mApp();
  }
}
