import 'package:flutter/material.dart';
import 'package:guessfest/menu/components/menu_widget.dart';

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
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              const Text(
                "GERALGERALGERAL",
                style: TextStyle(
                  fontFamily: "Bebas",
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              MenuWidget(),
            ],
          ),
        ));
  }
}
