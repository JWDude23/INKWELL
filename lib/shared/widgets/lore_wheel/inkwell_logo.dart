import 'package:flutter/material.dart';


class InkwellLogo extends StatelessWidget {

  const InkwellLogo({

    super.key,

    required this.color,

    this.size = 40,

  });


  final Color color;

  final double size;



  @override
  Widget build(BuildContext context) {


    return SizedBox(

      width:
          size,

      height:
          size,


      child:

          CustomPaint(

            painter:
                _InkwellLogoPainter(

                  color:
                      color,

                ),

          ),

    );

  }

}



class _InkwellLogoPainter extends CustomPainter {


  _InkwellLogoPainter({

    required this.color,

  });


  final Color color;



  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {


    final paint =
        Paint()

          ..color =
              color

          ..style =
              PaintingStyle.stroke

          ..strokeWidth =
              size.width * .08

          ..strokeCap =
              StrokeCap.round;



    final center =
        Offset(
          size.width / 2,
          size.height / 2,
        );



    // Ink drop outline

    final dropPath =
        Path();


    dropPath.moveTo(
      center.dx,
      size.height * .12,
    );


    dropPath.quadraticBezierTo(

      size.width * .15,
      size.height * .55,

      center.dx,
      size.height * .88,

    );


    dropPath.quadraticBezierTo(

      size.width * .85,
      size.height * .55,

      center.dx,
      size.height * .12,

    );


    canvas.drawPath(

      dropPath,

      paint,

    );



    // Inner spark

    canvas.drawCircle(

      center,

      size.width * .12,

      paint,

    );


  }



  @override
  bool shouldRepaint(
    _InkwellLogoPainter oldDelegate,
  ){

    return oldDelegate.color != color;

  }

}