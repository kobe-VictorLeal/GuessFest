import 'package:flame_audio/flame_audio.dart';

class GameSound {
  GameSound() {
    initializeAudio();
  }

  Future<void> initializeAudio() async {
    FlameAudio.bgm.initialize();
  }

  playMusic() {
    FlameAudio.bgm.play('Umbrella.mp3');
  }

  pauseMusic() {
    FlameAudio.bgm.pause();
  }

  stopMusic() {
    FlameAudio.bgm.stop();
  }

  playHit() {
    FlameAudio.play('Hit.wav');
  }

  playMiss() {
    FlameAudio.play('Miss.wav');
  }

  playCountdownStart() {
    FlameAudio.play('321.mp3');
  }

  playCountdownEnd() {
    FlameAudio.play('Countdown.mp3');
  }

  playGameOver() {
    FlameAudio.play('GameOver.mp3');
  }

  playPause() {
    FlameAudio.play('Pause.wav');
  }

  playSelected() {
    FlameAudio.play('Selected.wav');
  }

  playBack() {
    FlameAudio.play('Back.wav');
  }

  playReplay() {
    FlameAudio.play('EnterGame.mp3');
  }
}
