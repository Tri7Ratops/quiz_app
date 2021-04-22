import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/blocs/blocs.dart';
import 'package:quiz_app/models/menu_item_model.dart';

import '../widgets/widgets.dart';

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, QuizState state) {
        print("STATE QUIZ PAGE: $state");
        return Column(children: [
          Text("Hey !"),
        ]);
      },
    );
  }
}
