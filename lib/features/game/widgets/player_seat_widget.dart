import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/models/player_model.dart';
import '../../../core/models/player_seat.dart';

import 'table_player_panel.dart';



class PlayerSeatWidget extends StatelessWidget {


  const PlayerSeatWidget({

    super.key,

    required this.player,

    required this.isActive,

    required this.onLoreChanged,

    required this.onSpendInk,

  });



  final PlayerModel player;

  final bool isActive;


  final Function(int) onLoreChanged;

  final VoidCallback onSpendInk;







  double get rotation {


    switch(player.seat) {


      case PlayerSeat.top:

        return pi;



      case PlayerSeat.left:

        return pi / 2;



      case PlayerSeat.right:

        return -pi / 2;



      case PlayerSeat.bottom:

      case null:

        return 0;


    }


  }








  @override
  Widget build(BuildContext context) {


    return Transform.rotate(


      angle:

          rotation,



      child:

          AnimatedContainer(


            duration:

                const Duration(

                  milliseconds:
                      300,

                ),



            curve:

                Curves.easeOut,



            transform:


                Matrix4.translationValues(

                  0,

                  isActive
                      ? -20
                      : 0,

                  0,

                ),






            child:


                AnimatedScale(


                  duration:


                      const Duration(

                        milliseconds:
                            300,

                      ),



                  curve:


                      Curves.easeOut,



                  scale:


                      isActive
                          ? 1.15
                          : .85,






                  child:


                      AnimatedOpacity(


                        duration:


                            const Duration(

                              milliseconds:
                                  300,

                            ),



                        opacity:


                            isActive
                                ? 1.0
                                : .75,






                        child:


                            TablePlayerPanel(


                              player:

                                  player,



                              isActive:

                                  isActive,



                              onLoreChanged:

                                  onLoreChanged,



                              onSpendInk:

                                  onSpendInk,


                            ),



                      ),



                ),



          ),



    );


  }


}