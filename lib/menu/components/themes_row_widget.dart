import 'package:flutter/material.dart';

class ThemesRowWidget extends StatelessWidget {
  final List<String> themes = ["action", "beatle", "bible", "NBA", "NFL"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          const Text("Dalee"),
          Container(
            padding: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 15),
            child: Image.asset('assets/images/menu/bars/greenBar.png'),
          ),
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: themes.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    width: 200,
                    child: Image.asset('assets/images/menu/themes/action.png'),
                  );
                }),
          )
        ],
      ),
    );
  }
}
