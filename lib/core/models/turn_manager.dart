class TurnManager {

  TurnManager({
    required this.playerCount,
  });

  final int playerCount;

  int currentPlayer = 0;

  int currentRound = 1;

  int currentTurn = 1;

  int get currentPlayerIndex =>
      currentPlayer;

  int get nextPlayerIndex =>
      (currentPlayer + 1) % playerCount;

  bool get isLastPlayer =>
      currentPlayer == playerCount - 1;

  bool get isFirstPlayer =>
      currentPlayer == 0;

  void nextTurn() {

    if (isLastPlayer) {

      currentPlayer = 0;

      currentRound++;

    } else {

      currentPlayer++;

    }

    currentTurn++;

  }

  void previousTurn() {

    if (currentPlayer == 0) {

      currentPlayer = playerCount - 1;

      if (currentRound > 1) {

        currentRound--;

      }

    } else {

      currentPlayer--;

    }

    if (currentTurn > 1) {

      currentTurn--;

    }

  }

  void reset() {

    currentPlayer = 0;

    currentRound = 1;

    currentTurn = 1;

  }

}