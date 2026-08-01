import 'package:flutter/material.dart';

import '../../../core/models/player_model.dart';

import '../../../shared/widgets/lore_wheel/lore_wheel.dart';
import '../../../shared/widgets/ink_counter/ink_counter.dart';



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

            milliseconds: 300,

          ),


      padding:

          const EdgeInsets.all(10),



      decoration:

          BoxDecoration(

            color:

                isActive

                    ? Colors.amber.shade100

                    : Colors.white,


            borderRadius:

                BorderRadius.circular(18),



            boxShadow: [


              BoxShadow(

                blurRadius:

                    isActive ? 20 : 6,


                spreadRadius:

                    isActive ? 4 : 1,


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

                style:

                    const TextStyle(

                      fontWeight:
                          FontWeight.bold,

                      fontSize:
                          18,

                    ),

              ),




              const SizedBox(

                height:
                    8,

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
                    10,

              ),




              InkCounter(

                available:

                    player.availableInk,


                exerted:

                    player.exertedInk,


                color:

                    player.identityInk,


                onSpend:

                    onSpendInk,

              ),




              const SizedBox(

                height:
                    6,

              ),




              if(isActive)

                const Text(

                  "YOUR TURN",

                  style:

                      TextStyle(

                        fontWeight:
                            FontWeight.bold,

                      ),

                ),



            ],


          ),


    );


  }


}