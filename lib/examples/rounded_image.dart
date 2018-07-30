// {"title": "Rounded Image"}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExampleRoundedImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://jpg.cool/abeisgreat.jpg"),
                    fit: BoxFit.cover),
                shape: BoxShape.circle)));
  }
}
