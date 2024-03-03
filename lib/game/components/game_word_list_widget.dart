import 'package:flutter/material.dart';
import 'package:guessfest/game/models/game_team_enum.dart';
import 'package:guessfest/resources/resources.dart';
import 'package:guessfest/game/models/game_word.dart';

class GameWordListWidget extends StatelessWidget {
  const GameWordListWidget({Key? key, required this.wordsList}) : super(key: key);

  final List<GameWord> wordsList;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
                    color: wordsList[index].team == TeamEnum.pink ? const Color.fromRGBO(216, 58, 134, 1) : const Color.fromRGBO(68, 172, 210, 1),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            Image.asset(
                              'assets/images/game/elements/${wordsList[index].isHit ? "checkIcon.png" : "jumpIcon.png"}',
                              width: 25,
                              fit: BoxFit.fitHeight,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                wordsList[index].word,
                                style: _setTextStyle(color: Colors.white),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                        const SizedBox(height: 8),
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
