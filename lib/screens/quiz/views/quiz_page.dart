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
        // TODO: On QuizDone state, push to done page
        // TODO: OnQuizAnswer show alert for response
      },
      builder: (context, QuizState state) {
        QuestionModel question = (state as QuizCurrentQuestion).quiz[state.currentQuestion];
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
