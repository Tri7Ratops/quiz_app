import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/repositories/quiz_repository.dart';
import 'package:quiz_app/screens/home/views/home_page.dart';

class HomeScreen extends StatelessWidget {
  final QuizRepository quizRepository;

  HomeScreen({required this.quizRepository});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomePage(),
            ],
          ),
        ),
      ),
    );
  }
}