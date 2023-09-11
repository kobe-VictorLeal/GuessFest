import 'package:flutter/material.dart';

class GamePauseWidget extends StatelessWidget {
  const GamePauseWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(60, 60, 60, 100),
      child: Column(
        children: [
          const Spacer(),
          _playBalloonWidget(),
          const SizedBox(height: 15),
          _actionsWidget(context),
          const SizedBox(height: 15),
          _backBalloonWidget(),
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
          _backButton(),
        ],
      ),
    );
  }

  Widget _playBalloonWidget() {
    return Row(
      children: [
        const SizedBox(width: 40),
        _ballonTextWidget("Dale", toUp: false),
        const Spacer(),
      ],
    );
  }

  Widget _backBalloonWidget() {
    return Row(
      children: [
        const Spacer(),
        _ballonTextWidget("Dale"),
        const SizedBox(width: 40),
      ],
    );
  }

  Widget _ballonTextWidget(String text, {bool toUp = true}) {
    final imageName = toUp ? "balloonTop" : "balloonBottom";
    return Stack(
      children: [
        Image.asset(
          'assets/images/game/elements/$imageName.png',
          height: 55,
          width: 120,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  IconButton _playButton(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/menu/buttons/play.png'),
      iconSize: 75,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  IconButton _backButton() {
    return IconButton(
      icon: Image.asset('assets/images/game/buttons/back.png'),
      iconSize: 75,
      onPressed: () {},
    );
  }
}
