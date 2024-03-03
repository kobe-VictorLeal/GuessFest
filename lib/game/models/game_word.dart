import 'package:guessfest/game/models/game_team_enum.dart';

class GameWord {
  final String word;
  final TeamEnum team;
  final bool isHit;

  GameWord({
    required this.word,
    required this.team,
    required this.isHit,
  });
}
