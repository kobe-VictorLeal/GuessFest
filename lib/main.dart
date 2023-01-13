import 'package:flutter/material.dart';
import 'package:guessfest/menu/components/themes_row_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Bebas",
      ),
      home: ThemesRowWidget(),
    );
  }
}
