import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Quiz app",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 50,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text(
            "Computer science edition",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).accentColor,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Divider(),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
