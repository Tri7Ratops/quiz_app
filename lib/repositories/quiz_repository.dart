import 'package:quizz_app/models/models.dart';
import 'package:quizz_app/repositories/quiz_api_client.dart';

class QuizRepository {
  final QuizApiClient quizApiClient;

  QuizRepository({
    required this.quizApiClient,
  });

  Future<List<Question>> getQuiz({String? category, int limit = 10}) async {
    List<Question> quiz = [];

    if (category != null) {
      quiz = await quizApiClient.fetchQuizCategory(category: category, limit: limit);
    } else {
      quiz = await quizApiClient.fetchQuiz(limit: limit);
    }
    return quiz;
  }
}
