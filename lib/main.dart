import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/repositories/quiz_api_client.dart';
import 'package:quiz_app/repositories/repositories.dart';
import 'package:quiz_app/utils/simple_bloc_observer.dart';
import 'package:http/http.dart' as http;

import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();

  final QuizRepository quizRepository = QuizRepository(quizApiClient: QuizApiClient(httpClient: http.Client()));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(new QuizApp(quizRepository: quizRepository));
  });
}