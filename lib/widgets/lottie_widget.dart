import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:treyhope_dev/constants/lottie_type.dart';
import 'package:treyhope_dev/extensions/widget_extensions.dart';

class LottieWidget extends StatelessWidget {
  final LottieType type;

  const LottieWidget(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      type.path,
      width: 400, // Optional: specify width
      height: 400, // Optional: specify height
      fit: BoxFit.fill, // Optional: specify fit
    ).mApp();
  }
}
