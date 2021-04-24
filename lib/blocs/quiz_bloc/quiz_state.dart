import 'package:equatable/equatable.dart';
import 'package:quiz_app/models/models.dart';

abstract class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object?> get props => [];
}

class QuizInitial extends QuizState {}

class QuizLoadInProgress extends QuizState {}

class QuizLoadFailure extends QuizState {}

class QuizNoMoreQuestion extends QuizState {}

class QuizCurrentQuestion extends QuizState {
  final List<QuestionModel> quiz;
  final int currentQuestion;

  const QuizCurrentQuestion({
    required this.quiz,
    this.currentQuestion = 0,
  });

  @override
  List<Object?> get props => [
        quiz,
        currentQuestion,
      ];
}

class QuizAnswer extends QuizState {
  final List<QuestionModel> quiz;
  final int currentQuestion;

  const QuizAnswer({
    required this.quiz,
    required this.currentQuestion,
  });

  @override
  List<Object?> get props => [
        quiz,
        currentQuestion,
      ];
}

class QuizAnswerFalse extends QuizAnswer {
  const QuizAnswerFalse({
    required quiz,
    required currentQuestion,
  }) : super(
          quiz: quiz,
          currentQuestion: currentQuestion,
        );
}

class QuizAnswerTrue extends QuizAnswer {
  const QuizAnswerTrue({
    required quiz,
    required currentQuestion,
  }) : super(
    quiz: quiz,
    currentQuestion: currentQuestion,
  );
}
