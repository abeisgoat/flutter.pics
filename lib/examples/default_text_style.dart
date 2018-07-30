// {"title": "Default Text Style"}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExampleDefaultTextStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var text_style = TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    );

    return Center(
        child: DefaultTextStyle(
            style: text_style, child: Text("This is styled text")));
  }
}
