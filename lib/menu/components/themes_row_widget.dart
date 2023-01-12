import 'package:flutter/material.dart';

class ThemesRowWidget extends StatelessWidget {
  final List<String> themes = ["action", "beatle", "bible", "NBA", "NFL"];

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Container(
            padding: const EdgeInsets.only(left: 30, top: 15, right: 15, bottom: 30),
            height: 120,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/menu/bars/greenBar.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                const Center(
                  child: Text(
                    "GERAL",
                    style: TextStyle(
                      fontFamily: "Bebas",
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )),
        SizedBox(
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: themes.length,
              itemBuilder: (ctx, index) {
                return Container(
                  padding: const EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
                  width: 150,
                  child: Image.asset('assets/images/menu/themes/action.png'),
                );
              }),
        )
      ],
    );
  }
}
