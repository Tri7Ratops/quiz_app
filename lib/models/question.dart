import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final int id;
  final String question;
  final String? description;

  final Map<String, String?> answers;
  final Map<String, String?> correctAnswers;
  final bool multipleCorrectAnswers;

  final String? explanation;
  final List<Map<String, String>> tags;
  final String category;
  final String difficulty;

  final bool userCorrectAnswer = false;

  const Question({
    required this.id,
    required this.question,
    this.description,
    required this.answers,
    required this.correctAnswers,
    required this.multipleCorrectAnswers,
    this.explanation,
    required this.tags,
    required this.category,
    required this.difficulty,
  });

  @override
  List<Object?> get props => [
        id,
        question,
        description,
        answers,
        correctAnswers,
        multipleCorrectAnswers,
        explanation,
        tags,
        category,
        difficulty,
      ];

  static Question fromJson(dynamic json) {
    return Question(
      id: json['id'],
      question: json['question'],
      description: json['description'],
      answers: json['answers'],
      correctAnswers: json['correct_answers'],
      multipleCorrectAnswers: json['multiple_correct_answers'],
      explanation: json['explanation'],
      tags: json['tags'],
      category: json['category'],
      difficulty: json['difficulty'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "question": question,
      "description": description,
      "answers": answers,
      "multiple_correct_answers": multipleCorrectAnswers,
      "correct_answers": correctAnswers,
      "correct_answer": null,
      "explanation": explanation,
      "tip": null,
      "tags": tags,
      "category": category,
      "difficulty": difficulty,
    };
  }
}
