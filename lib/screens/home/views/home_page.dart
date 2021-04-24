import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/blocs/blocs.dart';
import 'package:quiz_app/config/routes.dart';
import 'package:quiz_app/models/menu_item_model.dart';
import 'package:quiz_app/models/models.dart';

import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  final List<MenuItemModel> itemList = [
    MenuItemModel(name: "General", category: null, imgPath: "assets/museums-victoria-jc_WMrSJ8EY-unsplash.jpg"),
    MenuItemModel(name: "Linux", category: "Linux", imgPath: "assets/long-ma-dXQHxSt2ShM-unsplash.jpg"),
    MenuItemModel(name: "DevOps", category: "DevOps", imgPath: "assets/ian-battaglia-9drS5E_Rguc-unsplash.jpg"),
    MenuItemModel(name: "Networking", category: "Networking", imgPath: "assets/bert-brrr-rhNff6hB41s-unsplash.jpg"),
    MenuItemModel(name: "Programming", category: "Programming", imgPath: "assets/oskar-yildiz-cOkpTiJMGzA-unsplash.jpg"),
    MenuItemModel(name: "Cloud", category: "Cloud", imgPath: "assets/ibrahim-mushan-uNnUdZILKB0-unsplash.jpg"),
    MenuItemModel(name: "Docker", category: "Docker", imgPath: "assets/david-maunsell-PMdNsBzn2To-unsplash.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizBloc, QuizState>(
      listener: (BuildContext context, state) {
        if (state is QuizCurrentQuestion) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            Navigator.pushNamed(context, Routes.quiz, arguments: QuizScreenArguments(quiz: state.quiz));
          });
        }
      },
      builder: (context, QuizState state) {
        return Column(
          children: [
            Header(),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: itemList.map((MenuItemModel item) {
                return MenuItem(
                  data: item,
                  onPressed: () {
                    print("onPressed: ${item.name}");
                    BlocProvider.of<QuizBloc>(context).add(QuizRequested(category: item.category));
                  },
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
