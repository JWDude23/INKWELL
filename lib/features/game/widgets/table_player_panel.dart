import 'package:flutter/material.dart';

import '../../../core/models/player_model.dart';

import '../../../shared/widgets/lore_wheel/lore_wheel.dart';
import '../../../shared/widgets/ink_display/ink_display.dart';



class TablePlayerPanel extends StatelessWidget {


  const TablePlayerPanel({

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





  @override
  Widget build(BuildContext context) {


    return AnimatedContainer(


      duration:

          const Duration(

            milliseconds:
                300,

          ),



      width:

          140,



      padding:

          const EdgeInsets.all(8),



      decoration:

          BoxDecoration(


            color:

                isActive

                    ? Colors.amber.shade100

                    : Colors.white,



            borderRadius:

                BorderRadius.circular(16),



            boxShadow: [


              BoxShadow(

                blurRadius:

                    isActive
                        ? 18
                        : 5,


                spreadRadius:

                    isActive
                        ? 3
                        : 1,


                color:

                    Colors.black26,

              ),


            ],


          ),





      child:

          Column(


            mainAxisSize:

                MainAxisSize.min,



            children: [



              Text(

                player.name,


                textAlign:

                    TextAlign.center,



                style:

                    const TextStyle(

                      fontWeight:

                          FontWeight.bold,


                      fontSize:

                          14,

                    ),

              ),





              const SizedBox(

                height:

                    4,

              ),





              LoreWheel(


                lore:

                    player.lore,



                maxLore:

                    20,



                color:

                    Colors.amber,



                onChanged:

                    onLoreChanged,


              ),






              const SizedBox(

                height:

                    6,

              ),





              InkDisplay(


                available:

                    player.availableInk,



                total:

                    player.availableInk +
                    player.exertedInk,


              ),




            ],


          ),


    );


  }


}