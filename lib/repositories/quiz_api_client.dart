import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/config/config.dart';
import 'package:quiz_app/models/models.dart';


class QuizApiClient {
  String baseUrl = "https://quizapi.io/api/v1/questions";
  final http.Client httpClient;

  QuizApiClient({
    required this.httpClient,
  });

  Future<List<Question>> fetchQuiz({int limit = 10}) async {
    final uri = Uri.parse('$baseUrl?apiKey=${AppConfig.apiKey}&limit=$limit');
    final response = await this.httpClient.get(uri);
    List<Question> result = [];

    if (response.statusCode != 200) {
      throw Exception('Error [QuizApiClient]: fetchQuiz');
    }
    final responseJson = jsonDecode(response.body);
    for (var item in responseJson) {
      result.add(Question.fromJson(item));
    }

    return result;
  }

  Future<List<Question>> fetchQuizCategory({required String category, int limit = 10}) async {
    final uri = Uri.parse('$baseUrl?apiKey=${AppConfig.apiKey}&limit=$limit&category=$category');
    final response = await this.httpClient.get(uri);
    List<Question> result = [];

    if (response.statusCode != 200) {
      throw Exception('Error [QuizApiClient]: fetchQuiz');
    }
    final responseJson = jsonDecode(response.body);
    for (var item in responseJson) {
      result.add(Question.fromJson(item));
    }

    return result;
  }

}
