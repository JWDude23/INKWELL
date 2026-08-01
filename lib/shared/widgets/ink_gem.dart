import 'package:flutter/material.dart';

import '../theme/ink_colors.dart';


class InkGem extends StatefulWidget {


  InkGem({

    super.key,

    Color? color,

    InkType? type,

    this.selected = false,

    this.exerted = false,

    this.size = 28,

  }) :

    color = color ??
        InkColors.colors[type]!;



  final Color color;

  final bool selected;

  final bool exerted;

  final double size;



  @override
  State<InkGem> createState() =>
      _InkGemState();


}






class _InkGemState extends State<InkGem>
    with SingleTickerProviderStateMixin {


  late AnimationController _controller;



  @override
  void initState() {

    super.initState();


    _controller =

        AnimationController(

          vsync:
              this,

          duration:

              const Duration(
                milliseconds: 900,
              ),

        );


    _controller.repeat(
      reverse: true,
    );


  }





  @override
  Widget build(BuildContext context) {


    return AnimatedBuilder(


      animation:
          _controller,



      builder:
          (context, child) {


        final glow =

            widget.selected

                ? .55

                : widget.exerted

                    ? .10

                    : .25 +
                        (_controller.value * .15);



        return Transform.rotate(


          angle:

              widget.exerted

                  ? .35

                  : 0,



          child:

              Container(


                width:

                    widget.size,


                height:

                    widget.size,



                decoration:

                    BoxDecoration(


                      shape:

                          BoxShape.circle,



                      color:

                          widget.color,



                      border:

                          widget.selected

                              ? Border.all(

                                  color:
                                      Colors.white,

                                  width:
                                      2,

                                )

                              : null,



                      boxShadow: [


                        BoxShadow(

                          color:

                              widget.color.withValues(

                                alpha:
                                    glow,

                              ),


                          blurRadius:
                              12,


                        ),


                      ],


                    ),


              ),


        );


      },


    );


  }





  @override
  void dispose() {

    _controller.dispose();

    super.dispose();

  }


}