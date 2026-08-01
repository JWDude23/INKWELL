import 'package:flutter/material.dart';


class LoreCracks extends CustomPainter {


  final Color color;

  final double intensity;


  LoreCracks({

    required this.color,

    required this.intensity,

  });



  @override
  void paint(
      Canvas canvas,
      Size size,
  ) {


    if(intensity <= 0) {
      return;
    }


    final paint =
        Paint()

          ..color = color.withValues(
            alpha: intensity,
          )

          ..strokeWidth = 2

          ..style =
              PaintingStyle.stroke;



    final center =
        Offset(
          size.width / 2,
          size.height / 2,
        );



    final radius =
        size.width / 2;



    final path =
        Path();



    path.moveTo(
      center.dx,
      center.dy,
    );


    path.lineTo(
      center.dx + radius * .4,
      center.dy - radius * .7,
    );


    path.moveTo(
      center.dx,
      center.dy,
    );


    path.lineTo(
      center.dx - radius * .6,
      center.dy + radius * .5,
    );



    canvas.drawPath(
      path,
      paint,
    );


  }




  @override
  bool shouldRepaint(
      LoreCracks oldDelegate,
  ) {

    return oldDelegate.intensity != intensity;

  }

}