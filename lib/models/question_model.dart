import 'package:equatable/equatable.dart';

class QuestionModel extends Equatable {
  final int id;
  final String question;
  final String? description;

  final List<String?> answers;
  final List<String?> correctAnswers;
  final bool multipleCorrectAnswers;

  final String? explanation;
  final List<dynamic> tags;
  final String category;
  final String difficulty;

  final bool userCorrectAnswer = false;

  const QuestionModel({
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

  static QuestionModel fromJson(dynamic json) {
    return QuestionModel(
      id: json['id'],
      question: json['question'],
      description: json['description'],
      answers: [
        json['answers']['answer_a'],
        json['answers']['answer_b'],
        json['answers']['answer_c'],
        json['answers']['answer_d'],
        json['answers']['answer_e'],
        json['answers']['answer_f'],
      ],
      correctAnswers: [
        json['correct_answers']['answer_a_correct'],
        json['correct_answers']['answer_b_correct'],
        json['correct_answers']['answer_c_correct'],
        json['correct_answers']['answer_d_correct'],
        json['correct_answers']['answer_e_correct'],
        json['correct_answers']['answer_f_correct'],
      ],
      multipleCorrectAnswers: json['multiple_correct_answers'].toLowerCase() == 'true',
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
