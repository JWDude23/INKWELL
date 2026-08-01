class InkWellLiquid {
  const InkWellLiquid({
    required this.availableInk,
    required this.exertedInk,
  });

  final int availableInk;
  final int exertedInk;

  int get totalInk => availableInk + exertedInk;

  double fillPercent(int maxInk) {
    if (maxInk == 0) return 0;

    return (totalInk / maxInk).clamp(0.0, 1.0);
  }

  double availablePercent(int maxInk) {
    if (maxInk == 0) return 0;

    return (availableInk / maxInk).clamp(0.0, 1.0);
  }

  double exertedPercent(int maxInk) {
    if (maxInk == 0) return 0;

    return (exertedInk / maxInk).clamp(0.0, 1.0);
  }
}