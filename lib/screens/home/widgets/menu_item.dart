import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/menu_item_model.dart';

class MenuItem extends StatelessWidget {
  final MenuItemModel data;
  final Function() onPressed;

  MenuItem({required this.data, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Theme.of(context).accentColor, width: 2.0),
      ),
      margin: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: onPressed,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: AssetImage(data.imgPath),
              ),
            ),
            Center(
              child: Text(
                data.name,
                overflow: TextOverflow.clip,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
