import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizAnswerTile extends StatelessWidget {
  final String answer;
  final Function() onPressed;

  QuizAnswerTile({required this.answer, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Text(
          answer,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
