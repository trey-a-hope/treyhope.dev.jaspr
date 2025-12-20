import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget embed() => MaterialApp(
    debugShowCheckedModeBanner: false,
    home: this,
  );
}
