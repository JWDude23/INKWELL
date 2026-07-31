class Player {
  Player({
    required this.name,
    required this.color,
  });

  final String name;
  final PlayerColor color;

  int lore = 0;

  int readyInk = 0;

  int exertedInk = 0;

  bool get isWinner => lore >= 20;
}

enum PlayerColor {
  amber,
  amethyst,
  emerald,
  ruby,
  sapphire,
  steel,
}