class LoreBreakEffect {


  static double shakeAmount(
      int lore,
      int maxLore,
  ) {

    if(lore >= maxLore) {

      return 6;

    }


    return 0;

  }





  static double flashAmount(
      int lore,
      int maxLore,
  ) {

    if(lore >= maxLore) {

      return .8;

    }


    return 0;

  }

}