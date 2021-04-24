import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/blocs/blocs.dart';
import 'package:quiz_app/models/models.dart';

import 'quiz_page.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final QuizScreenArguments args = ModalRoute.of(context)!.settings.arguments as QuizScreenArguments;

    return BlocProvider(
      create: (context) => QuizBloc(state: QuizCurrentQuestion(quiz: args.quiz)),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            titleSpacing: 0,
            leading: IconButton(
              icon: Icon(Icons.keyboard_arrow_left),
              onPressed: () => _leavePage(context),
            ),
            title: GestureDetector(
              onTap: () {
                _leavePage(context);
              },
              child: Text(
                "quit the quiz",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
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

  _leavePage(context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO,
      headerAnimationLoop: false,
      dismissOnTouchOutside: false,
      animType: AnimType.TOPSLIDE,
      dismissOnBackKeyPress: false,
      showCloseIcon: false,
      title: 'Are you sure you want to leave the quiz ?',
      desc: "You can't go back to the exact same quiz again.",
      btnCancelText: "Cancel",
      btnCancelOnPress: () {},
      btnOkText: "Continue",
      btnOkOnPress: () {
        Navigator.pop(context);
      },
    )..show();
  }
}
