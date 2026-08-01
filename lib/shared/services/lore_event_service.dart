import 'package:flutter/foundation.dart';
import 'feedback_service.dart';

class LoreEventService {

  static void loreCompleted() {

    // Future:
    // - break sound
    // - special vibration
    // - animation trigger

    FeedbackService.loreComplete();

debugPrint(
  "Lore completed!",
);

  }

}