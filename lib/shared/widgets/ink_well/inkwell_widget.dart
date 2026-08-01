import 'package:flutter/material.dart';

import 'inkwell_painter.dart';

class InkWellWidget extends StatelessWidget {
  const InkWellWidget({
    super.key,
    required this.availableInk,
    required this.exertedInk,
    required this.maxInk,
    required this.color,
  });

  final int availableInk;
  final int exertedInk;
  final int maxInk;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 180,
      child: CustomPaint(
        painter: InkWellPainter(
          color: color,
        ),
      ),
    );
  }
}