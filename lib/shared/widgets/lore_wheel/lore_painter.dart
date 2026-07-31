import 'dart:math';

import 'package:flutter/material.dart';

import 'lore_theme.dart';



class LorePainter extends CustomPainter {


  LorePainter({

    required this.progress,

    required this.theme,

  });



  final double progress;

  final LoreTheme theme;



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
        size.width / 2 - 10;



    final paint =
        Paint()

          ..style =
              PaintingStyle.stroke

          ..strokeWidth =
              12;



    final segmentAngle =
        (2 * pi) / theme.segments;



    for(
      int i = 0;
      i < theme.segments;
      i++
    ){

      final startAngle =
          -pi / 2 +
          (i * segmentAngle);



      final filled =
          i <
          (progress * theme.segments);



      paint.color =
          filled
              ? theme.activeColor
              : theme.inactiveColor;



      canvas.drawArc(

        Rect.fromCircle(

          center:
              center,

          radius:
              radius,

        ),


        startAngle,


        segmentAngle - .08,


        false,


        paint,

      );

    }

  }




  @override
  bool shouldRepaint(
    LorePainter oldDelegate,
  ){

    return oldDelegate.progress != progress ||
        oldDelegate.theme != theme;

  }

}