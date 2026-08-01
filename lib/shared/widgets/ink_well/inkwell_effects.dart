class InkWellEffects {
  static double glow(double fillPercent) {
    if (fillPercent >= .90) {
      return .35;
    }

    if (fillPercent >= .50) {
      return .22;
    }

    return .12;
  }

  static double borderWidth(double fillPercent) {
    if (fillPercent >= .90) {
      return 4;
    }

    if (fillPercent >= .50) {
      return 3;
    }

    return 2;
  }
}