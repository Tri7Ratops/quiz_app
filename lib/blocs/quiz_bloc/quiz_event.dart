import 'package:equatable/equatable.dart';
import 'package:quiz_app/models/models.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object?> get props => [];
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
  final List<int> answer; // Answer choose (1 to 7)
  final List<QuestionModel> quiz;
  final int currentQuestion;

  const QuizAnswered({
    required this.answer,
    required this.quiz,
    required this.currentQuestion,
  });

  @override
  List<Object?> get props => [
        answer,
        currentQuestion,
        quiz,
      ];
}

class QuizNext extends QuizEvent {
  final int currentQuestion;
  final List<QuestionModel> quiz;

  const QuizNext({
    required this.currentQuestion,
    required this.quiz,
  });

  @override
  List<Object?> get props => [
        this.currentQuestion,
        this.quiz,
      ];
}

class QuizDone extends QuizEvent {}
