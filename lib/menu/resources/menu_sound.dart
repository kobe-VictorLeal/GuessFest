import 'package:flame_audio/flame_audio.dart';
import 'package:guessfest/settings/shared_preferences.dart';

class MenuSound {
  MenuSound() {
    initializeAudio();
  }

  Future<void> initializeAudio() async {
    FlameAudio.bgm.initialize();
  }

  playSelected() {
    if (isSoundActive) {
      FlameAudio.play('Selected.wav');
    }
  }

  playBack() {
    if (isSoundActive) {
      FlameAudio.play('Back.wav');
    }
  }

  playStart() {
    if (isSoundActive) {
      FlameAudio.play('EnterGame.mp3');
    }
  }
}
