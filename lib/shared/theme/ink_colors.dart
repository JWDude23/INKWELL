import 'package:flutter/material.dart';

enum InkType {
  amber,
  amethyst,
  emerald,
  ruby,
  sapphire,
  steel,
}


class InkColors {

  static const Map<InkType, Color> colors = {

    InkType.amber:
        Color(0xFFFFC107),

    InkType.amethyst:
        Color(0xFF8E24AA),

    InkType.emerald:
        Color(0xFF2E7D32),

    InkType.ruby:
        Color(0xFFD32F2F),

    InkType.sapphire:
        Color(0xFF1565C0),

    InkType.steel:
        Color(0xFF607D8B),

  };


  static Color get(InkType type) {
    return colors[type]!;
  }

}