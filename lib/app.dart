import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:quiz_app/repositories/quiz_repository.dart';

import 'config/routes.dart';
import 'config/theme.dart';
import 'screens/home/home.dart';
import 'screens/quiz/quiz.dart';

class QuizApp extends StatelessWidget {
  final QuizRepository quizRepository;

  QuizApp({required this.quizRepository});

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/museums-victoria-jc_WMrSJ8EY-unsplash.jpg"), context);
    precacheImage(AssetImage("assets/ian-battaglia-9drS5E_Rguc-unsplash.jpg"), context);
    precacheImage(AssetImage("assets/bert-brrr-rhNff6hB41s-unsplash.jpg"), context);
    precacheImage(AssetImage("assets/david-maunsell-PMdNsBzn2To-unsplash.jpg"), context);
    precacheImage(AssetImage("assets/long-ma-dXQHxSt2ShM-unsplash.jpg"), context);

    return MaterialApp(
      title: 'Quiz App',
      theme: mainTheme,
      initialRoute: Routes.home,
      builder: EasyLoading.init(),
      routes: {
        Routes.home: (context) => HomeScreen(quizRepository: quizRepository),
        Routes.quiz: (context) => QuizScreen(),
      },
    );
  }
}
