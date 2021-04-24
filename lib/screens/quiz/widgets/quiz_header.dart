import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/models.dart';

class QuizHeader extends StatelessWidget {
  final QuestionModel question;

  QuizHeader({required this.question});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          question.question,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Divider(),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
