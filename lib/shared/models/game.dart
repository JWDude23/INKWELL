import 'player.dart';

class Game {
  Game({
    required this.players,
    required this.loreTarget,
    required this.commanderMode,
  });

  final List<Player> players;

  final int loreTarget;

  final bool commanderMode;

  int currentPlayer = 0;

  int turn = 1;
}