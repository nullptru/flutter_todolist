import 'package:base_form/style.dart';
import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: _theme(),
    );
  }
}

ThemeData _theme() {
  return ThemeData(textTheme: TextTheme(
    caption: categoryTextStyle,
    body1: PrimaryTextStyle
  ));
}
