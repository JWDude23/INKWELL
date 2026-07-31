import '../../shared/theme/ink_colors.dart';


class PlayerModel {


  PlayerModel({

    required this.name,

    required this.identityInk,

    this.lore = 0,

    this.availableInk = 0,

    this.exertedInk = 0,

    this.isLocalPlayer = false,

  });



  String name;


  InkType identityInk;


  int lore;


  int availableInk;


  int exertedInk;


  bool isLocalPlayer;



  void addLore(int amount){

    lore += amount;

  }



  void addInk(int amount){

    availableInk += amount;

  }



  void exertInk(int amount){

    if(amount <= availableInk){

      availableInk -= amount;

      exertedInk += amount;

    }

  }



  void refreshInk(){

    availableInk += exertedInk;

    exertedInk = 0;

  }

}