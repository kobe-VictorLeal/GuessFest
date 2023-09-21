import 'package:flutter/material.dart';
import 'package:guessfest/menu/models/theme_enum.dart';
import 'package:guessfest/menu/models/theme_words_list.dart';
import 'package:guessfest/game/components/game_pause_widget.dart';
import 'package:guessfest/game/components/crown_widget.dart';
import 'dart:async';
import "dart:math";

class GameWordWidget extends StatefulWidget {
  final ThemeEnum theme;

  const GameWordWidget({
    Key? key,
    required this.theme,
  }) : super(key: key);

  @override
  State<GameWordWidget> createState() => _GameWordWidgetState();
}

class _GameWordWidgetState extends State<GameWordWidget> with SingleTickerProviderStateMixin {
  GameStatusEnum _gameStatus = GameStatusEnum.preGame;
  final Duration _defautDuration = const Duration(seconds: 1);

  double _wordSize = 42;
  Color _wordColor = Colors.white.withOpacity(1);

  final StreamController<TeamEnum> _winTeamController = StreamController<TeamEnum>();
  TeamEnum _winningTeam = TeamEnum.neutral;
  TeamEnum _playingTeam = TeamEnum.blue;
  int _blueTeamPoints = 0;
  int _pinkTeamPoints = 0;

  late Timer _timer;
  int _timeLeft = 120;

  List<String> _currentWordList = [];
  String _currentWord = "";

  @override
  void initState() {
    super.initState();
    //_startInitalCountdown();
  }

  void _startInitalCountdown() {
    Future.delayed(const Duration(seconds: 0)).then((val) {
      _startGame();
    });
  }

  void _startGame() {
    startTimer();
    _nextWord();
    setState(() {
      _gameStatus = GameStatusEnum.activeGame;
    });
  }

  void _setUserResponse({required bool isHit}) {
    _setWordAnimation(isHit: isHit);
    if (isHit) {
      _changeTeam();
    }
    Future.delayed(const Duration(milliseconds: 500)).then((val) {
      _nextWord();
    });
  }

  void _setWordAnimation({required bool isHit}) {
    setState(() {
      _wordSize = isHit ? 46 : 36;
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
    _timer.cancel();
    showDialog(
        context: context,
        barrierColor: Colors.black87,
        builder: (BuildContext context) {
          return GamePauseWidget(returnAction: _returnGame);
        });
  }

  _returnGame(BuildContext context) {
    Navigator.pop(context);
    startTimer();
  }

  _changeTeam() {
    setState(() {
      if (_playingTeam == TeamEnum.pink) {
        _playingTeam = TeamEnum.blue;
      } else {
        _playingTeam = TeamEnum.pink;
      }
    });
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_timeLeft == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          _setTeamPoints();
          setState(() {
            _timeLeft--;
            _winTeamController.add(_winningTeam);
          });
        }
      },
    );
  }

  _setTeamPoints() {
    _blueTeamPoints = _blueTeamPoints + (_playingTeam == TeamEnum.pink ? 1 : 0);
    _pinkTeamPoints = _pinkTeamPoints + (_playingTeam == TeamEnum.blue ? 1 : 0);
    if (_blueTeamPoints == _pinkTeamPoints) {
      _winningTeam = TeamEnum.neutral;
    } else {
      _winningTeam = _pinkTeamPoints > _blueTeamPoints ? TeamEnum.pink : TeamEnum.blue;
    }
  }

  String _intToTimeLeft(int value) {
    int minutes, seconds;

    minutes = (value) ~/ 60;
    seconds = value - (minutes * 60);
    final secondLeft = seconds.toString().padLeft(2, '0');

    String result = "$minutes:$secondLeft";

    return result;
  }

  _nextWord() {
    if (_currentWordList.isEmpty) {
      _currentWordList = List.from(themeWords.getWords(widget.theme));
    }
    final index = Random().nextInt(_currentWordList.length);

    setState(() {
      _currentWord = _currentWordList[index];
      _currentWordList.removeAt(index);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
              padding: const EdgeInsets.only(left: 60, top: 50, right: 60, bottom: 120),
              child: Center(
                child: Column(
                  children: [
                    Visibility(visible: _gameStatus == GameStatusEnum.preGame, child: _backButton()),
                    _gameHeaderWidget(),
                    const SizedBox(height: 10),
                    _infoText("Escolham entre si os seus times"),
                    const SizedBox(height: 5),
                    _teamNameWidget(context, _playingTeam),
                    const SizedBox(height: 15),
                    Visibility(visible: _gameStatus == GameStatusEnum.preGame, child: _teamNameWidget(context, TeamEnum.pink)),
                    const SizedBox(height: 10),
                    Visibility(visible: _gameStatus == GameStatusEnum.preGame, child: const SizedBox(height: 30)),
                    Visibility(visible: _gameStatus == GameStatusEnum.preGame, child: _playButton()),
                    const Spacer(),
                    Visibility(visible: _gameStatus == GameStatusEnum.activeGame, child: _wordText(_currentWord)),
                    const Spacer(),
                    Visibility(visible: _gameStatus == GameStatusEnum.activeGame, child: const SizedBox(height: 10)),
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
          CrownWidget(streamTeam: _winTeamController.stream),
        ],
      ),
    );
  }

  Text _timeText() {
    return Text(
      _intToTimeLeft(_timeLeft),
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
        _setUserResponse(isHit: true);
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
