import 'package:flutter/material.dart';
import 'package:guessfest/game/components/game_pause_widget.dart';
import 'package:guessfest/game/components/crown_widget.dart';
import 'dart:async';

class GameWordWidget extends StatefulWidget {
  const GameWordWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<GameWordWidget> createState() => _GameWordWidgetState();
}

class _GameWordWidgetState extends State<GameWordWidget> with SingleTickerProviderStateMixin {
  GameStatusEnum _gameStatus = GameStatusEnum.preGame;
  final Duration _defautDuration = const Duration(seconds: 1);

  double _wordSize = 42;
  Color _wordColor = Colors.white.withOpacity(1);

  StreamController<TeamEnum> _teamController = StreamController<TeamEnum>();
  TeamEnum _winningTeam = TeamEnum.neutral;
  TeamEnum _playingTeam = TeamEnum.blue;

  void initState() {
    //_startInitalCountdown();
  }

  void _startInitalCountdown() {
    Future.delayed(const Duration(seconds: 0)).then((val) {
      _startGame();
    });
  }

  void _startGame() {
    setState(() {
      _gameStatus = GameStatusEnum.activeGame;
    });
  }

  void _setUserResponse({required bool isHit}) {
    _setWordAnimation(isHit: isHit);
  }

  void _setWordAnimation({required bool isHit}) {
    setState(() {
      _wordSize = isHit ? 50 : 34;
      _wordColor = isHit ? Colors.green.withOpacity(0) : Colors.red.withOpacity(0);
    });

    Future.delayed(const Duration(milliseconds: 500)).then((val) {
      setState(() {
        _wordSize = 42;
        _wordColor = Colors.white.withOpacity(1);
      });
    });
  }

  _openPause(BuildContext context) {
    showDialog(
        context: context,
        barrierColor: Colors.black87,
        builder: (BuildContext context) {
          return const GamePauseWidget();
        });
  }

  _changeTeam() {
    setState(() {
      if (_playingTeam == TeamEnum.pink) {
        _playingTeam = TeamEnum.blue;
      } else {
        _playingTeam = TeamEnum.pink;
      }
    });
    _teamController.add(_playingTeam);
    print(_teamController.stream);
  }

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
                    Visibility(visible: _gameStatus == GameStatusEnum.preGame, child: _backButton()),
                    _gameHeaderWidget(),
                    const SizedBox(height: 10),
                    _infoText("Escolham entre si os seus times"),
                    const SizedBox(height: 5),
                    _teamNameWidget(context, TeamEnum.blue),
                    const SizedBox(height: 15),
                    Visibility(visible: _gameStatus == GameStatusEnum.preGame, child: _teamNameWidget(context, TeamEnum.pink)),
                    const SizedBox(height: 50),
                    Visibility(visible: _gameStatus == GameStatusEnum.preGame, child: _playButton()),
                    _wordText("aeroporto"),
                    Visibility(visible: _gameStatus == GameStatusEnum.activeGame, child: const SizedBox(height: 70)),
                    Visibility(visible: _gameStatus == GameStatusEnum.activeGame, child: _actionPanelWidget(context)),
                    Visibility(visible: _gameStatus == GameStatusEnum.activeGame, child: const SizedBox(height: 20)),
                    Visibility(visible: _gameStatus == GameStatusEnum.activeGame, child: _pauseButton(context)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _gameHeaderWidget() {
    return AnimatedOpacity(
      opacity: _gameStatus == GameStatusEnum.activeGame ? 1 : 0,
      duration: _defautDuration,
      child: Row(
        children: [
          _timeText(),
          const Spacer(),
          CrownWidget(streamTeam: _teamController.stream),
        ],
      ),
    );
  }

  Text _timeText() {
    return Text(
      "1:12",
      style: _setTextStyle(fontSize: 38),
      textAlign: TextAlign.center,
    );
  }

  Widget _teamNameWidget(BuildContext context, TeamEnum team) {
    String imageName = "";
    String title = "";

    switch (team) {
      case TeamEnum.pink:
        imageName = "pinkTeam.png";
        title = "Time Rosa";
        break;

      case TeamEnum.blue:
        imageName = "blueTeam.png";
        title = "Time Azul";
        break;

      case TeamEnum.neutral:
        break;
    }

    return Container(
      padding: const EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 0),
      width: MediaQuery.of(context).size.width * 0.75,
      height: 56,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/game/bars/$imageName',
            width: MediaQuery.of(context).size.width * 0.75,
            height: 52,
            fit: BoxFit.fill,
          ),
          Center(
            child: Text(
              title,
              style: _setTextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoText(String info) {
    return AnimatedContainer(
      duration: _defautDuration,
      height: _gameStatus == GameStatusEnum.activeGame ? 0 : 80,
      child: Opacity(
        opacity: _gameStatus == GameStatusEnum.preGame ? 1 : 0,
        child: Text(
          info,
          style: _setTextStyle(fontSize: 35),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _wordText(String word) {
    return AnimatedOpacity(
        opacity: _gameStatus == GameStatusEnum.activeGame ? 1 : 0,
        duration: _defautDuration,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          style: _setTextStyle(fontSize: _wordSize, color: _wordColor),
          child: Text(
            word,
            textAlign: TextAlign.center,
          ),
        ));
  }

  Widget _actionPanelWidget(BuildContext context) {
    return AnimatedOpacity(
      opacity: _gameStatus == GameStatusEnum.activeGame ? 1 : 0,
      duration: _defautDuration,
      child: Row(
        children: [
          const Spacer(),
          _jumpButton(context),
          const Spacer(),
          _hitButton(context),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _backButton() {
    return AnimatedContainer(
      height: _gameStatus == GameStatusEnum.preGame ? 60 : 0,
      duration: _defautDuration,
      child: Row(
        children: [
          IconButton(
            icon: Image.asset('assets/images/game/buttons/back.png'),
            iconSize: 45,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _pauseButton(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Image.asset('assets/images/game/buttons/pause.png'),
          iconSize: 45,
          onPressed: () {
            _openPause(context);
          },
        ),
        const Spacer(),
      ],
    );
  }

  IconButton _playButton() {
    return IconButton(
      icon: Image.asset('assets/images/menu/buttons/play.png'),
      iconSize: 75,
      onPressed: () {
        _startInitalCountdown();
      },
    );
  }

  IconButton _hitButton(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/game/buttons/hit.png'),
      iconSize: 75,
      onPressed: () {
        _setWordAnimation(isHit: true);
        _changeTeam();
      },
    );
  }

  IconButton _jumpButton(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/game/buttons/jump.png'),
      iconSize: 75,
      onPressed: () {
        _setUserResponse(isHit: false);
      },
    );
  }

  TextStyle _setTextStyle({double fontSize = 12, Color color = Colors.white}) {
    return TextStyle(
      fontFamily: "Bebas",
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
    );
  }
}

enum GameStatusEnum { preGame, activeGame, endGame }
enum TeamEnum { pink, blue, neutral }
