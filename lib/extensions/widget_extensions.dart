import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

extension WidgetExtensions on Widget {
  ToastificationWrapper mApp() => ToastificationWrapper(
    child: MaterialApp(
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
      home: Material(
        color: Colors.transparent,
        child: this,
      ),
    ),
  );
}
