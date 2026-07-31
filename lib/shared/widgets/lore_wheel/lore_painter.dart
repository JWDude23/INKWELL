import 'dart:math';

import 'package:flutter/material.dart';


class LorePainter extends CustomPainter {


  LorePainter({

    required this.progress,

    required this.color,

  });


  final double progress;

  final Color color;



  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {


    final center =
        Offset(
          size.width / 2,
          size.height / 2,
        );


    final radius =
        size.width / 2;



    final backgroundPaint =
        Paint()

          ..color =
              Colors.grey.withValues(
                alpha: .2,
              )

          ..style =
              PaintingStyle.stroke

          ..strokeWidth =
              12;



    final progressPaint =
        Paint()

          ..color =
              color

          ..style =
              PaintingStyle.stroke

          ..strokeWidth =
              12

          ..strokeCap =
              StrokeCap.round;



    canvas.drawCircle(

      center,

      radius - 6,

      backgroundPaint,

    );



    canvas.drawArc(

      Rect.fromCircle(

        center:
            center,

        radius:
            radius - 6,

      ),

      -pi / 2,

      2 * pi * progress,

      false,

      progressPaint,

    );


  }



  @override
  bool shouldRepaint(
    LorePainter oldDelegate,
  ) {

    return oldDelegate.progress != progress ||
        oldDelegate.color != color;

  }

}