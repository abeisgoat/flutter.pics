import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bucket/examples/default_text_style.dart';
import 'package:flutter_bucket/examples/icon.dart';
import 'package:flutter_bucket/examples/non_button_clickable.dart';
import 'package:flutter_bucket/examples/raised_button.dart';
import 'package:flutter_bucket/examples/rounded_corners.dart';
import 'package:flutter_bucket/examples/rounded_image.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Bucket',
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class Example {
  final name;
  final widget;
  const Example(this.widget, this.name);
}

class HomePageState extends State<HomePage> {
  var _counter = 0;

  initState() {
    const platform = const MethodChannel('app.channel.shared.data');

    Timer(Duration(seconds: 5), () {
      Timer.periodic(Duration(seconds: 3), (timer) {
        _incrementCounter();

        Timer(Duration(seconds: 1), () {
          platform.invokeMethod("screenshot", examples[_counter].name);
        });
      });
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter = (_counter + 1) % 7;

      if (_counter == 0) {
        exit(0);
      }
    });
  }

  var examples = [
    Example(Center(
      child: Text('Flutter Bucket Example App'),
    ), "home"),
    Example(ExampleRaisedButton(), "raised_button"),
    Example(ExampleRoundedImage(), "rounded_image"),
    Example(ExampleRoundedCorners(), "rounded_corners"),
    Example(ExampleIcon(), "icon"),
    Example(ExampleDefaultTextStyle(), "default_text_style"),
    Example(ExampleNonButtonClickable(),"nonbutton_clickable")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: examples[_counter].widget
    );
  }
}