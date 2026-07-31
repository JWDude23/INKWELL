import 'package:flutter/material.dart';

import 'lore_stage.dart';
import 'lore_painter.dart';
import 'lore_theme.dart';


class LoreWheel extends StatelessWidget {

  const LoreWheel({

    super.key,

    required this.lore,

    required this.maxLore,

    required this.color,

    required this.onChanged,

this.theme =
    LoreTheme.classic,

  });


  final int lore;

  final int maxLore;

  final Color color;

  final Function(int) onChanged;

  final LoreTheme theme;



  @override
  Widget build(BuildContext context) {


    final stage =
        getLoreStage(
          lore,
          maxLore,
        );


    return GestureDetector(

      onTap: () {

        onChanged(1);

      },


      onLongPress: () {

        onChanged(-1);

      },


      child: AnimatedContainer(

        duration:
            const Duration(
              milliseconds: 400,
            ),


        width:
            140,


        height:
            140,


        decoration:
            BoxDecoration(

              shape:
                  BoxShape.circle,


              border:
                  Border.all(

                    color:
                        color,

                    width:
                        6,

                  ),


              boxShadow: [

                BoxShadow(

                  color:
                      color.withValues(
                        alpha:
                            stage.index * .08,
                      ),


                  blurRadius:
                      20,

                ),

              ],

            ),



        child:

            CustomPaint(

              painter:

                  LorePainter(

  progress:
      (lore / maxLore)
          .clamp(0.0, 1.0),

  theme:
      theme,

),



              child:

                  Center(

                    child:

                        AnimatedSwitcher(

                          duration:

                              const Duration(

                                milliseconds:
                                    250,

                              ),



                          child:

                              Text(

                                "$lore",


                                key:

                                    ValueKey(lore),



                                style:

                                    TextStyle(

                                      fontSize:
                                          48,


                                      fontWeight:
                                          FontWeight.bold,


                                      color:
                                          color,

                                    ),

                              ),

                        ),

                  ),

            ),

      ),

    );

  }

}