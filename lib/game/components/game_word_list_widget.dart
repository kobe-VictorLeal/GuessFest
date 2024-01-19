import 'package:flutter/material.dart';
import 'package:guessfest/resources/resources.dart';

class GameWordListWidget extends StatelessWidget {
  GameWordListWidget({Key? key}) : super(key: key);

  final wordsList = ["1111", "2222", "3333", "4444"];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: Resources().isBigScreen(context) ? height * 0.45 : height * 0.45,
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/images/menu/settings/screen.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Palavras",
              style: _setTextStyle(color: Colors.white),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 0, top: 40, right: 0, bottom: 20),
            child: Material(
              color: Colors.transparent,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: wordsList.length,
                itemBuilder: (ctx, index) {
                  return Container(
                    color: index % 2 == 0 ? const Color.fromRGBO(68, 172, 210, 1) : const Color.fromRGBO(216, 58, 134, 1),
                    child: Column(
                      children: [
                        const SizedBox(height: 5),
                        Visibility(
                          visible: index != wordsList.length,
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              Image.asset(
                                'assets/images/game/elements/checkIcon.png',
                                width: 25,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                wordsList[index],
                                style: _setTextStyle(color: Colors.white),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  );
                },
              ),
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

  TextStyle _setTextStyle({required Color color}) {
    return TextStyle(
      fontFamily: "Bebas",
      fontSize: 24,
      color: color,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
    );
  }
}
