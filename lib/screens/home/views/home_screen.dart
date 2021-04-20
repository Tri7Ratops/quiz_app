import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_json/pretty_json.dart';
import 'package:quiz_app/blocs/blocs.dart';
import 'package:quiz_app/models/models.dart';
import 'package:quiz_app/repositories/quiz_repository.dart';
import 'package:quiz_app/screens/home/views/home_page.dart';

class HomeScreen extends StatelessWidget {
  final QuizRepository quizRepository;

  HomeScreen({required this.quizRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuizBloc(quizRepository: quizRepository),
      child: SafeArea(
        child: Scaffold(
          body: Scrollbar(
            isAlwaysShown: true,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: HomePage(),
            ),
          ),
        ),
      ),
    );
  }
}
