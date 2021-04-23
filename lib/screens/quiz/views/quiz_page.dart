import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/blocs/blocs.dart';
import 'package:quiz_app/models/models.dart';

import '../widgets/widgets.dart';

class QuizPage extends StatelessWidget {
  final List<QuestionModel> quiz;

  QuizPage({required this.quiz});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, QuizState state) {
        return Column(children: [
          Text("Hey !"),
        ]);
      },
    );
  }
}
