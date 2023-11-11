import 'package:flutter/material.dart';
import 'package:guessfest/game/resources/game_sound.dart';
import 'package:guessfest/menu/models/theme_enum.dart';
import 'package:guessfest/menu/models/theme_words_list.dart';
import 'package:guessfest/game/components/game_pause_widget.dart';
import 'package:guessfest/game/components/crown_widget.dart';
import 'package:guessfest/resources/resources.dart';
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
  TeamEnum _winTeam = TeamEnum.neutral;
  TeamEnum _playingTeam = TeamEnum.blue;
  int _blueTeamPoints = 0;
  int _pinkTeamPoints = 0;

  late Timer _countdownTimer;
  int _countdownLeft = 2;

  late Timer _timer;
  int _timeLeft = 120;

  List<String> _currentWordList = [];
  String _currentWord = "";

  String _infoTextString = "Escolham entre si os seus times";

  final GameSound _sound = GameSound();

  void _startInitalCountdown() {
    _sound.playCountdownStart();
    _sortTeam();
    setState(() {
      _infoTextString = "A partida começa com";
      _gameStatus = GameStatusEnum.countdown;
    });

    const oneSec = Duration(seconds: 1);
    _countdownTimer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_countdownLeft == 0) {
          setState(() {
            timer.cancel();
            _startGame();
          });
        } else {
          setState(() {
            _countdownLeft--;
          });
        }
      },
    );
  }

  void _startGame() {
    _sound.playMusic();
    startTimer();
    _nextWord();
    setState(() {
      _gameStatus = GameStatusEnum.activeGame;
    });
  }

  void _setUserResponse({required bool isHit}) {
    _setWordAnimation(isHit: isHit);
    if (isHit) {
      _sound.playHit();
      _changeTeam();
    } else {
      _sound.playMiss();
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
    _sound.pauseMusic();
    _sound.playPause();
    _timer.cancel();
    showDialog(
        context: context,
        barrierColor: Colors.black87,
        builder: (BuildContext context) {
          return GamePauseWidget(returnAction: _returnGame);
        });
  }

  _returnGame(BuildContext context) {
    _sound.playMusic();
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

  _sortTeam() {
    setState(() {
      _winningTeam = TeamEnum.neutral;
      _playingTeam = Random().nextInt(100) % 2 == 0 ? TeamEnum.blue : TeamEnum.pink;
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
            _gameOver();
          });
        } else {
          _setTeamPoints();
          setState(() {
            _timeLeft--;
            _winTeamController.add(_winningTeam);
          });
          if (_timeLeft == 14) {
            _sound.playCountdownEnd();
          }
        }
      },
    );
  }

  _gameOver() {
    _sound.stopMusic();
    if (_pinkTeamPoints == _blueTeamPoints) {
      _winTeam = TeamEnum.neutral;
    } else {
      _winTeam = _pinkTeamPoints < _blueTeamPoints ? TeamEnum.pink : TeamEnum.blue;
    }
    setState(() {
      _gameStatus = GameStatusEnum.willEndGame;
    });

    Future.delayed(const Duration(seconds: 1)).then((val) {
      _sound.playGameOver();
      setState(() {
        _playingTeam = _winTeam;
        _gameStatus = GameStatusEnum.endGame;
      });
    });
  }

  _resetValues() {
    _countdownLeft = 2;
    _timeLeft = 120;
    _blueTeamPoints = 0;
    _pinkTeamPoints = 0;
  }

  _setTeamPoints() {
    _blueTeamPoints = _blueTeamPoints + (_playingTeam == TeamEnum.blue ? 1 : 0);
    _pinkTeamPoints = _pinkTeamPoints + (_playingTeam == TeamEnum.pink ? 1 : 0);
    if (_blueTeamPoints == _pinkTeamPoints) {
      _winningTeam = TeamEnum.neutral;
    } else {
      _winningTeam = _pinkTeamPoints < _blueTeamPoints ? TeamEnum.pink : TeamEnum.blue;
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

    if (_currentWordList.isNotEmpty) {
      final index = Random().nextInt(_currentWordList.length);

      setState(() {
        _currentWord = _currentWordList[index];
        _currentWordList.removeAt(index);
      });
    } else {
      _currentWord = "tema com erro";
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _countdownTimer.cancel();
    _sound.stopMusic();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEndGame = _gameStatus == GameStatusEnum.willEndGame || _gameStatus == GameStatusEnum.endGame;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
              padding: Resources().isBigScreen(context)
                  ? EdgeInsets.only(left: width * 0.15, top: height * 0.1, right: width * 0.15, bottom: height * 0.2)
                  : const EdgeInsets.only(left: 60, top: 50, right: 60, bottom: 120),
              child: Center(
                child: Column(
                  children: [
                    _backButton(),
                    _gameHeaderWidget(),
                    const SizedBox(height: 10),
                    _infoText(_infoTextString),
                    const SizedBox(height: 5),
                    _teamNameWidget(context, _playingTeam),
                    const SizedBox(height: 15),
                    Visibility(visible: _gameStatus == GameStatusEnum.preGame, child: _teamNameWidget(context, TeamEnum.pink)),
                    const SizedBox(height: 10),
                    Visibility(visible: isEndGame, child: _gameOverWidget(context)),
                    Visibility(visible: _gameStatus == GameStatusEnum.preGame, child: const SizedBox(height: 30)),
                    Visibility(visible: _gameStatus == GameStatusEnum.countdown, child: _countdownWidget()),
                    Visibility(visible: _gameStatus == GameStatusEnum.preGame, child: _playButton()),
                    const Spacer(),
                    Visibility(visible: _gameStatus == GameStatusEnum.endGame, child: _endGamePanelWidget(context)),
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
      opacity: _gameStatus == GameStatusEnum.activeGame || _gameStatus == GameStatusEnum.endGame ? 1 : 0,
      duration: _defautDuration,
      child: Row(
        children: [
          Visibility(visible: _gameStatus == GameStatusEnum.activeGame, child: _timeText()),
          const Spacer(),
          CrownWidget(streamTeam: _winTeamController.stream, isEndGame: _gameStatus == GameStatusEnum.endGame),
          Visibility(visible: _gameStatus == GameStatusEnum.endGame, child: const Spacer()),
        ],
      ),
    );
  }

  Widget _countdownWidget() {
    return Row(
      children: [
        const Spacer(),
        Image.asset(
          'assets/images/game/elements/0${_countdownLeft + 1}.png',
          height: 40,
          cacheWidth: 200,
        ),
        const Spacer(),
      ],
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
        imageName = "yellowBar.png";
        title = "Empate";
    }

    return AnimatedOpacity(
      opacity: _gameStatus != GameStatusEnum.willEndGame ? 1 : 0,
      duration: _defautDuration,
      child: Container(
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
      ),
    );
  }

  Widget _infoText(String info) {
    return AnimatedContainer(
      duration: _defautDuration,
      height: _gameStatus == GameStatusEnum.activeGame || _gameStatus == GameStatusEnum.endGame ? 0 : 80,
      child: Opacity(
        opacity: _gameStatus == GameStatusEnum.preGame || _gameStatus == GameStatusEnum.countdown ? 1 : 0,
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
          Opacity(
            opacity: _gameStatus == GameStatusEnum.preGame ? 1 : 0,
            child: IconButton(
              icon: Image.asset('assets/images/game/buttons/back.png'),
              iconSize: 45,
              onPressed: () {
                _sound.playBack();
                Navigator.pop(context);
              },
            ),
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

  Widget _endGamePanelWidget(BuildContext context) {
    return AnimatedOpacity(
      opacity: _gameStatus == GameStatusEnum.endGame ? 1 : 0,
      duration: _defautDuration,
      child: Row(
        children: [
          const Spacer(),
          _replayButton(context),
          const Spacer(),
          _backEndGameButton(context),
          const Spacer(),
        ],
      ),
    );
  }

  IconButton _replayButton(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/game/buttons/playAgain.png'),
      iconSize: 75,
      onPressed: () {
        _resetValues();
        _startInitalCountdown();
      },
    );
  }

  IconButton _backEndGameButton(BuildContext context) {
    return IconButton(
      icon: Image.asset('assets/images/game/buttons/menu.png'),
      iconSize: 75,
      onPressed: () {
        Navigator.of(context).popUntil((route) => route.isFirst);
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

  Widget _gameOverWidget(BuildContext context) {
    return AnimatedOpacity(
      opacity: _gameStatus == GameStatusEnum.endGame ? 1 : 0,
      duration: const Duration(seconds: 1),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Stack(children: [
          Image.asset(
            'assets/images/game/elements/gameOver.png',
            height: 160,
            width: MediaQuery.of(context).size.width * 1,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    _gameOverTitleText(),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Spacer(),
                    _teamScoreWidget(TeamEnum.pink),
                    const Spacer(),
                    const Spacer(),
                    _teamScoreWidget(TeamEnum.blue),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Text _gameOverTitleText() {
    return Text(
      "Tempo",
      style: _setTextStyle(fontSize: 34),
      textAlign: TextAlign.center,
    );
  }

  Widget _teamScoreWidget(TeamEnum team) {
    final points = team == TeamEnum.pink ? _pinkTeamPoints : _blueTeamPoints;
    final timeScore = _intToTimeLeft(points);

    return Column(
      children: [
        Text(
          team.title,
          style: _setTextStyle(fontSize: 34),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text(
          timeScore,
          style: _setTextStyle(fontSize: 34),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

enum GameStatusEnum { preGame, countdown, activeGame, willEndGame, endGame }
enum TeamEnum { pink, blue, neutral }

extension TeamEnumExtension on TeamEnum {
  String get title {
    switch (this) {
      case TeamEnum.pink:
        return 'Rosa';

      case TeamEnum.blue:
        return 'Azul';

      case TeamEnum.neutral:
        return 'Empate';
    }
  }
}
