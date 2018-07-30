// {"title": "Raised Button"}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExampleRaisedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          print("I have been pressed!");
        },
        child: Text('I am a button.'),
      ),
    );
  }
}
