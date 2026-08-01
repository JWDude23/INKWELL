import 'package:flutter/material.dart';

class InkLiquidPainter extends CustomPainter {
  const InkLiquidPainter({
    required this.color,
    required this.readyPercent,
    required this.exertedPercent,
  });

  final Color color;
  final double readyPercent;
  final double exertedPercent;

  @override
  void paint(Canvas canvas, Size size) {
    final totalPercent =
        (readyPercent + exertedPercent)
            .clamp(0.0, 1.0);

    if (totalPercent <= 0) {
      return;
    }

    final bottle = Path();

    bottle.moveTo(size.width * .38, size.height * .28);

    bottle.quadraticBezierTo(
      size.width * .12,
      size.height * .34,
      size.width * .12,
      size.height * .72,
    );

    bottle.quadraticBezierTo(
      size.width * .12,
      size.height * .96,
      size.width * .50,
      size.height * .96,
    );

    bottle.quadraticBezierTo(
      size.width * .88,
      size.height * .96,
      size.width * .88,
      size.height * .72,
    );

    bottle.quadraticBezierTo(
      size.width * .88,
      size.height * .34,
      size.width * .62,
      size.height * .28,
    );

    bottle.close();

    canvas.save();

    canvas.clipPath(bottle);

    final bottom = size.height * .96;

    final totalTop =
        bottom - (size.height * .68 * totalPercent);

    final exertedTop =
        bottom -
            (size.height * .68 * exertedPercent);

    final readyPaint = Paint()
      ..color = color;

    final exertedPaint = Paint()
      ..color = color.withValues(alpha: .35);

    // Exerted ink

    if (exertedPercent > 0) {
      canvas.drawRect(
        Rect.fromLTRB(
          0,
          exertedTop,
          size.width,
          bottom,
        ),
        exertedPaint,
      );
    }

    // Ready ink

    if (readyPercent > 0) {
      canvas.drawRect(
        Rect.fromLTRB(
          0,
          totalTop,
          size.width,
          exertedTop,
        ),
        readyPaint,
      );
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(
      covariant InkLiquidPainter oldDelegate) {
    return oldDelegate.readyPercent != readyPercent ||
        oldDelegate.exertedPercent != exertedPercent ||
        oldDelegate.color != color;
  }
}