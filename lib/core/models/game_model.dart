import 'player_model.dart';
import 'game_mode.dart';



class GameModel {


  GameModel({

    required this.players,

    this.mode = GameMode.table,

    this.startingLore = 0,

    this.startingInk = 0,

    this.currentPlayer = 0,

  });



  List<PlayerModel> players;



  GameMode mode;



  int startingLore;



  int startingInk;



  int currentPlayer;



  PlayerModel get activePlayer =>
      players[currentPlayer];



  void nextTurn(){

    currentPlayer++;

    if(currentPlayer >= players.length){

      currentPlayer = 0;

    }

  }

}