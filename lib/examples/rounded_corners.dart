// {"title": "Rounded Corners"}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExampleRoundedCorners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var symetricalRoundedCorners = Container(
      padding: EdgeInsets.all(20.0),
      child: Text("Symetrical Rounded Corners"),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: Colors.brown),
    );

    var asymetricalRoundedCorners = Container(
      padding: EdgeInsets.all(20.0),
      child: Text("Asymetrical Rounded Corners"),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20.0)),
          color: Colors.brown),
    );

    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
            child: symetricalRoundedCorners,
            padding: EdgeInsets.only(bottom: 16.0)),
        Padding(
            child: asymetricalRoundedCorners,
            padding: EdgeInsets.only(bottom: 16.0)),
      ],
    ));
  }
}
