import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension WidgetExtensions on Widget {
  MaterialApp mApp() => MaterialApp(
    darkTheme: ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      textTheme: GoogleFonts.robotoTextTheme(),
    ),
    theme: ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      textTheme: GoogleFonts.robotoTextTheme(),
    ),
    themeMode: ThemeMode.light,
    debugShowCheckedModeBanner: false,
    home: this,
  );
}
