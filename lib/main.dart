import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizz_app/config/routes.dart';
import 'package:quizz_app/config/theme.dart';

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(new QuizApp());
  });
}