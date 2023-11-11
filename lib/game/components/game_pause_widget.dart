import 'package:flutter/material.dart';

class GamePauseWidget extends StatelessWidget {
  final void Function(BuildContext) returnAction;

  const GamePauseWidget({
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
          const Spacer(),
          _playBalloonWidget(context),
          const SizedBox(height: 15),
          _actionsWidget(context),
          const SizedBox(height: 15),
          _backBalloonWidget(context),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _actionsWidget(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          _playButton(context),
          const Spacer(),
          _backButton(context),
        ],
      ),
    );
  }

  Widget _playBalloonWidget(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 40),
        _ballonTextWidget(context, "Continuar", toUp: false),
        const Spacer(),
      ],
    );
  }

  Widget _backBalloonWidget(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        _ballonTextWidget(context, "Categorias"),
        const SizedBox(width: 40),
      ],
    );
  }

  Widget _ballonTextWidget(BuildContext context, String text, {bool toUp = true}) {
    final imageName = toUp ? "balloonTop" : "balloonBottom";
    return SizedBox(
      height: 55,
      width: 120,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/game/elements/$imageName.png',
            fit: BoxFit.fill,
          ),
          Padding(
            padding: toUp ? const EdgeInsets.only(top: 12) : const EdgeInsets.only(bottom: 4),
            child: Center(
              child: Text(
                text,
                style: _setTextStyle(fontSize: 24, color: const Color.fromRGBO(65, 30, 101, 1)),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  IconButton _playButton(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/menu/buttons/play.png'),
      iconSize: 75,
      onPressed: () {
        returnAction(context);
      },
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
