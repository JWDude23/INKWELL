import 'player_model.dart';
import 'game_mode.dart';
import 'turn_manager.dart';



class GameModel {

  GameModel({

    required this.players,

    this.mode = GameMode.table,

    this.startingLore = 0,

    this.startingInk = 0,

  }) : turnManager = TurnManager(
          playerCount: players.length,
        );



  List<PlayerModel> players;



  GameMode mode;



  int startingLore;



  int startingInk;



  final TurnManager turnManager;



  PlayerModel get activePlayer =>

      players[
        turnManager.currentPlayerIndex
      ];



  int get currentPlayer =>

      turnManager.currentPlayerIndex;



  int get currentRound =>

      turnManager.currentRound;



  int get currentTurn =>

      turnManager.currentTurn;



  void nextTurn() {

    turnManager.nextTurn();

  }



  void previousTurn() {

    turnManager.previousTurn();

  }



  void resetTurns() {

    turnManager.reset();

  }

}