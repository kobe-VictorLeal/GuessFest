import 'package:flutter/material.dart';
import 'package:guessfest/game/game_word_widget.dart';
import 'package:guessfest/resources/resources.dart';

class CrownWidget extends StatefulWidget {
  final Stream<TeamEnum> streamTeam;
  final bool isEndGame;

  const CrownWidget({
    Key? key,
    required this.streamTeam,
    required this.isEndGame,
  }) : super(key: key);

  @override
  State<CrownWidget> createState() => _CrownWidgetState();
}

class _CrownWidgetState extends State<CrownWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  String _team = "yellowCrown";

  String _getTeamImageName(TeamEnum team) {
    switch (team) {
      case TeamEnum.pink:
        return "pinkCrown";

      case TeamEnum.blue:
        return "blueCrown";

      case TeamEnum.neutral:
        return "yellowCrown";
    }
  }

  void _setStreamTeam() {
    widget.streamTeam.listen(
      (streamTeam) {
        setState(() {
          _team = _getTeamImageName(streamTeam);
        });
      },
    );
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    super.initState();
    _setStreamTeam();
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double endGameWidth = Resources().isBigScreen(context) ? 140 : 95;
    return RotationTransition(
      turns: Tween(begin: -0.025, end: 0.025).animate(_controller),
      //duration: const Duration(milliseconds: 500),
      child: Image.asset(
        'assets/images/game/elements/$_team.png',
        width: widget.isEndGame ? endGameWidth : 85,
        cacheWidth: 200,
        fit: BoxFit.fill,
      ),
    );
  }
}
