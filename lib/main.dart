import 'package:base_form/screens/new_task.dart';
import 'package:base_form/style.dart';
import 'package:flutter/material.dart';

import 'screens/home.dart';

const HomeRoute = '/';
const NewTaskRoute = '/new_route';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _theme(),
      initialRoute: HomeRoute,
      routes: {
        HomeRoute: (context) => Home(),
        NewTaskRoute: (context) => NewTaskPane()
      },
    );
  }
}

ThemeData _theme() {
  return ThemeData(textTheme: TextTheme(
    caption: categoryTextStyle,
    body1: PrimaryTextStyle
  ));
}
