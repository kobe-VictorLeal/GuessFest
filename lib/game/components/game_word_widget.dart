import 'package:flutter/material.dart';

class GameWordWidget extends StatefulWidget {
  const GameWordWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<GameWordWidget> createState() => _GameWordWidgetState();
}

class _GameWordWidgetState extends State<GameWordWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/game/elements/arcade.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 60, top: 50, right: 60, bottom: 80),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      children: [
                        _timeText(),
                        const Spacer(),
                        _crownImage(),
                      ],
                    ),
                    const SizedBox(height: 30),
                    _teamNameWidget(context),
                    const SizedBox(height: 80),
                    _wordText("aeroporto"),
                    const SizedBox(height: 70),
                    _actionPanelWidget(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Image _crownImage() {
    return Image.asset(
      'assets/images/game/elements/pinkCrown.png',
      width: 85,
      fit: BoxFit.fill,
    );
  }

  Text _timeText() {
    return Text(
      "1:12",
      style: _setTextStyle(fontSize: 38),
      textAlign: TextAlign.center,
    );
  }

  Widget _teamNameWidget(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 0),
        width: MediaQuery.of(context).size.width * 0.75,
        height: 56,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/game/bars/blueTeam.png',
              width: MediaQuery.of(context).size.width * 0.75,
              height: 52,
              fit: BoxFit.fill,
            ),
            Center(
              child: Text(
                "Time Azul",
                style: _setTextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }

  Text _wordText(String word) {
    return Text(
      word,
      style: _setTextStyle(fontSize: 42),
      textAlign: TextAlign.center,
    );
  }

  Row _actionPanelWidget(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        _jumpButton(context),
        const Spacer(),
        _hitButton(context),
        const Spacer(),
      ],
    );
  }

  IconButton _hitButton(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/game/buttons/hit.png'),
      iconSize: 75,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  IconButton _jumpButton(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/game/buttons/jump.png'),
      iconSize: 75,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GameWordWidget()),
        );
      },
    );
  }

  TextStyle _setTextStyle({double fontSize = 12}) {
    return TextStyle(
      fontFamily: "Bebas",
      fontSize: fontSize,
      color: Colors.white,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
    );
  }
}
