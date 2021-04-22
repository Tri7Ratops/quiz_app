import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'bloc.dart';
import 'package:quiz_app/repositories/repositories.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final QuizRepository? quizRepository;

  QuizBloc({this.quizRepository}) : super(QuizInitial());

  @override
  Stream<QuizState> mapEventToState(QuizEvent event) async* {
    if (event is QuizRequested) {
      yield* _quizRequested(event);
    }
    if (event is QuizAnswered) {
      yield* _quizAnswered(event);
    }
    if (event is QuizNext) {
      yield* _quizNext(event);
    }
    if (event is QuizDone) {
      yield* _quizDone(event);
    }
  }

  Stream<QuizState> _quizRequested(QuizRequested event) async* {
    yield QuizLoadInProgress();
    EasyLoading.show(status: 'Fetching the quiz ...');
    try {
      if (quizRepository == null) {
        throw ("ERROR: quizRepository is null");
      }
      final List<QuestionModel> quiz = await this.quizRepository!.getQuiz(category: event.category);
      yield QuizCurrentQuestion(quiz: quiz, currentQuestion: 0);
      EasyLoading.dismiss();
    } catch (e) {
      print(e);
      yield QuizLoadFailure();
      EasyLoading.showError("Can't fetch data");
    }
  }

  Stream<QuizState> _quizAnswered(QuizAnswered event) async* {
    QuestionModel question = event.quiz.elementAt(event.currentQuestion);

    // TODO: Check if the answer is correct

    yield QuizAnswerTrue(quiz: event.quiz, currentQuestion: event.currentQuestion);
  }

  Stream<QuizState> _quizNext(QuizNext event) async* {
    if (event.quiz.length <= event.currentQuestion + 1) {
      yield QuizNoMoreQuestion();
    } else {
      yield QuizCurrentQuestion(quiz: event.quiz, currentQuestion: event.currentQuestion + 1);
    }
  }

  Stream<QuizState> _quizDone(QuizDone event) async* {
    yield QuizInitial();
  }
}
