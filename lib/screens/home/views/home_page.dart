import 'package:flutter/cupertino.dart';
import 'package:quiz_app/models/menu_item_model.dart';

import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  final List<MenuItemModel> itemList = [
    MenuItemModel(name: "Linux", category: "Linux", imgPath: "assets/oskar-yildiz-cOkpTiJMGzA-unsplash.jpg"),
    MenuItemModel(name: "DevOps", category: "DevOps", imgPath: "assets/oskar-yildiz-cOkpTiJMGzA-unsplash.jpg"),
    MenuItemModel(name: "Networking", category: "Networking", imgPath: "assets/oskar-yildiz-cOkpTiJMGzA-unsplash.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
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
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
