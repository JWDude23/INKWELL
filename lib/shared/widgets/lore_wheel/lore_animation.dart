import 'lore_stage.dart';


class LoreAnimation {


  static Duration pulseSpeed(LoreStage stage) {

    switch (stage) {

      case LoreStage.dormant:
        return const Duration(
          milliseconds: 3000,
        );


      case LoreStage.awakening:
        return const Duration(
          milliseconds: 2200,
        );


      case LoreStage.building:
        return const Duration(
          milliseconds: 1500,
        );


      case LoreStage.unstable:
        return const Duration(
          milliseconds: 900,
        );


      case LoreStage.complete:
        return const Duration(
          milliseconds: 500,
        );

    }

  }




  static double pulseAmount(LoreStage stage) {

    switch(stage) {

      case LoreStage.dormant:
        return 1.01;


      case LoreStage.awakening:
        return 1.03;


      case LoreStage.building:
        return 1.05;


      case LoreStage.unstable:
        return 1.08;


      case LoreStage.complete:
        return 1.12;

    }

  }


}