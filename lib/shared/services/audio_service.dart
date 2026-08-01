import 'package:audioplayers/audioplayers.dart';

import 'feedback_settings.dart';

class AudioService {
  static final AudioPlayer _player = AudioPlayer();

  static Future<void> loreClick(
    int lore,
    int maxLore,
  ) async {
    if (!FeedbackSettings.soundEnabled) {
      return;
    }

    final progress = lore / maxLore;

    String sound;

    if (progress < .25) {
      sound = "sounds/lore_click_soft.mp3";
    } else if (progress < .75) {
      sound = "sounds/lore_click_medium.mp3";
    } else {
      sound = "sounds/lore_click_heavy.mp3";
    }

    await _play(sound);
  }

  static Future<void> loreBreak() async {
    if (!FeedbackSettings.soundEnabled) {
      return;
    }

    await _play(
      "sounds/lore_break.mp3",
    );
  }

  static Future<void> _play(String sound) async {
    try {
      await _player.play(
        AssetSource(sound),
      );
    } catch (_) {
      // Ignore missing or failed audio assets in release builds.
    }
  }
}