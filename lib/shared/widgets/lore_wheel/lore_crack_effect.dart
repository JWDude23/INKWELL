import 'lore_stage.dart';


class LoreCrackEffect {


  static double intensity(
      LoreStage stage,
  ) {


    switch(stage) {

      case LoreStage.dormant:
        return 0;


      case LoreStage.awakening:
        return .05;


      case LoreStage.building:
        return .15;


      case LoreStage.unstable:
        return .45;


      case LoreStage.complete:
        return .8;

    }

  }

}