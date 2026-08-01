import 'package:flutter/services.dart';

import 'feedback_settings.dart';
import 'audio_service.dart';


class FeedbackService {


  static void loreIncrease({
    int lore = 0,
    int maxLore = 20,
  }) {


    if (FeedbackSettings.hapticsEnabled) {

      _hapticForLore(
        lore,
        maxLore,
      );

    }


    if (FeedbackSettings.soundEnabled) {

      _soundForLore(
        lore,
        maxLore,
      );

    }


  }






  static void loreDecrease({
    int lore = 0,
    int maxLore = 20,
  }) {


    if (FeedbackSettings.hapticsEnabled) {

      HapticFeedback.lightImpact();

    }


    if (FeedbackSettings.soundEnabled) {

      AudioService.loreClick(
        lore,
        maxLore,
      );

    }


  }








  static void loreComplete() {


    if (FeedbackSettings.hapticsEnabled) {

      HapticFeedback.heavyImpact();

    }


    if (FeedbackSettings.soundEnabled) {

      AudioService.loreBreak();

    }


  }









  static void _hapticForLore(
    int lore,
    int maxLore,
  ) {


    final progress =
        lore / maxLore;



    if (progress < .25) {

      HapticFeedback.selectionClick();

    }

    else if (progress < .75) {

      HapticFeedback.lightImpact();

    }

    else {

      HapticFeedback.mediumImpact();

    }


  }









  static void _soundForLore(
    int lore,
    int maxLore,
  ) {


    final progress =
        lore / maxLore;



    if (progress >= 1.0) {

      AudioService.loreBreak();

    }

    else {

      AudioService.loreClick(
        lore,
        maxLore,
      );

    }


  }


}