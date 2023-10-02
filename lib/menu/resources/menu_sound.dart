import 'package:flame_audio/flame_audio.dart';

class MenuSound {
  MenuSound() {
    initializeAudio();
  }

  Future<void> initializeAudio() async {
    FlameAudio.bgm.initialize();
  }

  playSelected() {
    FlameAudio.play('Selected.wav');
  }

  playBack() {
    FlameAudio.play('Back.wav');
  }

  playStart() {
    FlameAudio.play('EnterGame.mp3');
  }
}
