import '../../shared/theme/ink_colors.dart';
import 'player_seat.dart';



class PlayerModel {


  PlayerModel({

    required this.name,

    required this.identityInk,

    this.lore = 0,

    this.availableInk = 0,

    this.exertedInk = 0,

    this.isLocalPlayer = false,

    this.seat,

  });



  String name;


  InkType identityInk;


  int lore;


  int availableInk;


  int exertedInk;


  bool isLocalPlayer;


  PlayerSeat? seat;



  // Future hidden game tracking

  int handSize = 0;


  int deckSize = 0;


  int discardSize = 0;






  void addLore(
    int amount, {
    int maxLore = 20,
  }) {


    lore += amount;



    if(lore < 0) {

      lore = 0;

    }



    if(lore > maxLore) {

      lore = maxLore;

    }


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