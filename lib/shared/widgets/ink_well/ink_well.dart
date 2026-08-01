import 'package:flutter/material.dart';

import 'inkwell_painter.dart';
import 'ink_liquid_painter.dart';


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


    final readyPercent =
        (availableInk / maxInk)
            .clamp(0.0, 1.0);


    final exertedPercent =
        (exertedInk / maxInk)
            .clamp(0.0, 1.0);



    return SizedBox(

      width:
          160,

      height:
          200,


      child:

          Stack(

            alignment:
                Alignment.center,


            children: [


              // Liquid inside the bottle
              CustomPaint(

                size:
                    const Size(
                      140,
                      170,
                    ),


                painter:

                    InkLiquidPainter(

                      color:
                          color,


                      readyPercent:
                          readyPercent,


                      exertedPercent:
                          exertedPercent,

                    ),

              ),




              // Glass bottle outline
              CustomPaint(

                size:
                    const Size(
                      140,
                      170,
                    ),


                painter:

                    InkWellPainter(

                      color:
                          color,

                    ),

              ),



            ],

          ),

    );

  }

}