enum GameStatusEnum { preGame, countdown, activeGame, willEndGame, endGame, wordList }
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
