import 'package:flutter/material.dart';

class GameWordListWidget extends StatelessWidget {
  final void Function(BuildContext) returnAction;

  const GameWordListWidget({
    Key? key,
    required this.returnAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: width * 0.15, top: height * 0.1, right: width * 0.15, bottom: height * 0.2),
      child: Column(
        children: [
          Center(
            child: Text(
              "Jogo Pausado",
              style: _setTextStyle(fontSize: 40, color: const Color.fromRGBO(247, 235, 94, 1)),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  IconButton _backButton(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/game/buttons/menu.png'),
      iconSize: 75,
      onPressed: () {
        Navigator.of(context).popUntil((route) => route.isFirst);
      },
    );
  }

  TextStyle _setTextStyle({double fontSize = 12, required Color color}) {
    return TextStyle(
      fontFamily: "Bebas",
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
    );
  }
}
