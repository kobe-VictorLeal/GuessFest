import 'package:flame_audio/flame_audio.dart';
import 'package:guessfest/settings/shared_preferences.dart';

class GameSound {
  GameSound() {
    initializeAudio();
  }

  Future<void> initializeAudio() async {
    FlameAudio.bgm.initialize();
  }

  playMusic() {
    if (isMusicActive) {
      FlameAudio.bgm.play('Umbrella.mp3');
    }
  }

  pauseMusic() {
    FlameAudio.bgm.pause();
  }

  stopMusic() {
    FlameAudio.bgm.stop();
  }

  playHit() {
    if (isSoundActive) {
      FlameAudio.play('Hit.wav');
    }
  }

  playMiss() {
    if (isSoundActive) {
      FlameAudio.play('Miss.wav');
    }
  }

  playCountdownStart() {
    if (isSoundActive) {
      FlameAudio.play('321.mp3');
    }
  }

  playCountdownEnd() {
    if (isSoundActive) {
      FlameAudio.play('Countdown.mp3');
    }
  }

  playGameOver() {
    if (isSoundActive) {
      FlameAudio.play('GameOver.mp3');
    }
  }

  playPause() {
    if (isSoundActive) {
      FlameAudio.play('Pause.wav');
    }
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

  playReplay() {
    if (isSoundActive) {
      FlameAudio.play('EnterGame.mp3');
    }
  }
}
