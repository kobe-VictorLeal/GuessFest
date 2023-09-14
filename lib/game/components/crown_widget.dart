import 'package:flutter/material.dart';
import 'package:guessfest/game/game_word_widget.dart';

class CrownWidget extends StatefulWidget {
  final Stream<TeamEnum> streamTeam;

  const CrownWidget({
    Key? key,
    required this.streamTeam,
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
    return RotationTransition(
      turns: Tween(begin: -0.025, end: 0.025).animate(_controller),
      //duration: const Duration(milliseconds: 500),
      child: Image.asset(
        'assets/images/game/elements/$_team.png',
        width: 85,
        fit: BoxFit.fill,
      ),
    );
  }
}
