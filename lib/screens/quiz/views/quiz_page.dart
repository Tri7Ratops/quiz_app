import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/blocs/blocs.dart';
import 'package:quiz_app/models/models.dart';

import '../widgets/widgets.dart';

class QuizPage extends StatelessWidget {
  final List<QuestionModel> quiz;

  QuizPage({required this.quiz});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizBloc, QuizState>(
      listener: (context, QuizState state) {
        if (state is QuizAnswer) {
          _alertResultAnswer(context, state);
        }
        if (state is QuizInitial) {
          Navigator.pop(context);
        }
      },
      builder: (context, QuizState state) {
        if (state is QuizCurrentQuestion) {
          QuestionModel question = state.quiz[state.currentQuestion];
          return Column(children: [
            QuizHeader(question: question),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: question.answers.length,
              itemBuilder: (context, index) {
                if (question.answers[index] == null) return Container();
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: QuizAnswerTile(
                    answer: question.answers[index]!,
                    onPressed: () {
                      BlocProvider.of<QuizBloc>(context).add(QuizAnswered(quiz: state.quiz, answer: index, currentQuestion: state.currentQuestion));
                    },
                  ),
                );
              },
            )
          ]);
        }
        return Center(
          child: Column(
            children: [
              SizedBox(
                height: 120,
              ),
              Text(
                'Quiz done!',
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<QuizBloc>(context).add(QuizDone());
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("Back to the home page", style: TextStyle(color: Colors.white),),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).accentColor),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _alertResultAnswer(BuildContext context, QuizState state) {
    if (state is QuizAnswerTrue) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        headerAnimationLoop: false,
        dismissOnTouchOutside: false,
        animType: AnimType.TOPSLIDE,
        dismissOnBackKeyPress: false,
        showCloseIcon: false,
        title: 'Good answer!',
        desc: state.quiz[state.currentQuestion].explanation ?? "No explanation",
        btnOkText: "Next",
        btnOkOnPress: () {
          BlocProvider.of<QuizBloc>(context).add(QuizNext(quiz: state.quiz, currentQuestion: state.currentQuestion));
        },
      )..show();
    } else if (state is QuizAnswerFalse) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        headerAnimationLoop: false,
        dismissOnTouchOutside: false,
        animType: AnimType.TOPSLIDE,
        dismissOnBackKeyPress: false,
        showCloseIcon: false,
        title: 'Wrong answer!',
        desc: state.quiz[state.currentQuestion].explanation ?? "No explanation",
        btnOkText: "Next",
        btnOkOnPress: () {
          BlocProvider.of<QuizBloc>(context).add(QuizNext(quiz: state.quiz, currentQuestion: state.currentQuestion));
        },
      )..show();
    }
  }
}
