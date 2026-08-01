import 'package:flutter/material.dart';

class InkWellPainter extends CustomPainter {
  const InkWellPainter({
    required this.color,
  });

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final glassPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..color = color;

    final highlightPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.white.withValues(alpha: .35);

    final corkPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = const Color(0xFF8D6E63);

    final bottle = Path();

    // Neck
    bottle.moveTo(size.width * .38, size.height * .12);
    bottle.lineTo(size.width * .38, size.height * .28);

    // Left shoulder
    bottle.quadraticBezierTo(
      size.width * .12,
      size.height * .34,
      size.width * .12,
      size.height * .72,
    );

    // Bottom
    bottle.quadraticBezierTo(
      size.width * .12,
      size.height * .96,
      size.width * .50,
      size.height * .96,
    );

    // Right side
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

    bottle.lineTo(size.width * .62, size.height * .12);

    canvas.drawPath(bottle, glassPaint);

    // Cork
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(
          center: Offset(
            size.width / 2,
            size.height * .08,
          ),
          width: size.width * .22,
          height: size.height * .08,
        ),
        const Radius.circular(6),
      ),
      corkPaint,
    );

    // Bottle lip
    canvas.drawLine(
      Offset(size.width * .38, size.height * .12),
      Offset(size.width * .62, size.height * .12),
      glassPaint,
    );

    // Left glass highlight
    canvas.drawArc(
      Rect.fromLTWH(
        size.width * .22,
        size.height * .22,
        size.width * .18,
        size.height * .55,
      ),
      -1.2,
      1.6,
      false,
      highlightPaint,
    );

    // Small neck highlight
    canvas.drawLine(
      Offset(size.width * .44, size.height * .16),
      Offset(size.width * .44, size.height * .28),
      highlightPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}