import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  MaterialApp mApp() => MaterialApp(
    darkTheme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
    theme: ThemeData(useMaterial3: true, brightness: Brightness.light),
    themeMode: ThemeMode.system,
    debugShowCheckedModeBanner: false,
    home: this,
  );
}
