import 'package:flutter/material.dart';

ThemeData mainTheme = ThemeData.dark().copyWith(
  primaryColor: Color(0xFFFAA482),
  accentColor: Color(0xFFE3B26B),
  appBarTheme: ThemeData.dark().appBarTheme.copyWith(
        backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
        elevation: 0,
      ),
);
