import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'config/routes.dart';
import 'config/theme.dart';

import 'screens/home/home.dart';

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: mainTheme,
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => HomeScreen(),
      },
    );
  }
}