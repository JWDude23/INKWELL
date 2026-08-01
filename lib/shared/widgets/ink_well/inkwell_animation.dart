class InkWellAnimation {
  static Duration pulseSpeed(double fillPercent) {
    if (fillPercent >= .90) {
      return const Duration(milliseconds: 1400);
    }

    if (fillPercent >= .50) {
      return const Duration(milliseconds: 1900);
    }

    return const Duration(milliseconds: 2600);
  }

  static double pulseAmount(double fillPercent) {
    if (fillPercent >= .90) {
      return 1.035;
    }

    if (fillPercent >= .50) {
      return 1.025;
    }

    return 1.015;
  }
}