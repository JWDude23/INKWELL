import 'lore_stage.dart';


class LoreStageEffects {


  static double glowAmount(
    LoreStage stage,
  ) {

    switch(stage) {

      case LoreStage.dormant:

        return .05;


      case LoreStage.awakening:

        return .15;


      case LoreStage.building:

        return .30;


      case LoreStage.unstable:

        return .50;


      case LoreStage.complete:

        return .80;

    }

  }




  static double borderWidth(
    LoreStage stage,
  ) {

    switch(stage) {

      case LoreStage.dormant:

        return 4;


      case LoreStage.awakening:

        return 5;


      case LoreStage.building:

        return 6;


      case LoreStage.unstable:

        return 7;


      case LoreStage.complete:

        return 8;

    }

  }

}