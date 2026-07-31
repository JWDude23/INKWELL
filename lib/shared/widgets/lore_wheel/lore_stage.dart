enum LoreStage {

  dormant,

  awakening,

  building,

  unstable,

  complete,

}


LoreStage getLoreStage(
  int lore,
  int maxLore,
) {

  final progress =
      lore / maxLore;


  if(progress >= 1.0){

    return LoreStage.complete;

  }

  if(progress >= .75){

    return LoreStage.unstable;

  }

  if(progress >= .50){

    return LoreStage.building;

  }

  if(progress >= .25){

    return LoreStage.awakening;

  }


  return LoreStage.dormant;

}