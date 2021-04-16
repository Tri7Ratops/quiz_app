import 'package:equatable/equatable.dart';
import 'package:quizz_app/models/models.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();
}

class QuizRequested extends QuizEvent {
  final String? category;

  const QuizRequested({
    this.category,
  });

  @override
  List<Object?> get props => [
        category,
      ];
}

class QuizAnswered extends QuizEvent {
  final int answer; // Answer choose (1 to 7)
  final Question question;

  const QuizAnswered({
    required this.answer,
    required this.question,
  });

  @override
  List<Object?> get props => [
        answer,
        question,
      ];
}

class QuizNext extends Equatable {
  final int currentStep;
  final List<Question> quiz;

  const QuizNext({
    required this.currentStep,
    required this.quiz,
  });

  @override
  List<Object?> get props => [
    this.currentStep,
    this.quiz,
  ];
}
