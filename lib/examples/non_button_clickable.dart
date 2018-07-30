import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExampleNonButtonClickable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
            onTap: () {
              print("I have been tapped!");
            },
            onLongPress: () {
              print("I have been long pressed!");
            },
            child: Container(
              child: Text("I'm basically a button."),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
            )));
  }
}
