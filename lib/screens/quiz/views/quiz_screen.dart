import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_json/pretty_json.dart';
import 'package:quiz_app/blocs/blocs.dart';
import 'package:quiz_app/models/models.dart';
import 'package:quiz_app/repositories/quiz_repository.dart';
import 'package:quiz_app/screens/home/views/home_page.dart';

import 'quiz_page.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final QuizScreenArguments args = ModalRoute.of(context)!.settings.arguments as QuizScreenArguments;

    return BlocProvider(
      create: (context) => QuizBloc(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            titleSpacing: 0,
            title: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text("quit the quiz", style: TextStyle(fontSize: 14),),
            ),
          ), // TODO ALERT LEAVING THE QUIZ
          body: Scrollbar(
            isAlwaysShown: true,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: QuizPage(
                quiz: args.quiz,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
