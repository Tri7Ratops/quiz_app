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
                  onPressed: () {},
                ),
              );
            },
          )
        ]);
      },
    );
  }
}
