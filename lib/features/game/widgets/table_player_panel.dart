import 'package:flutter/material.dart';

import '../../../core/models/player_model.dart';
import '../../../shared/theme/ink_colors.dart';

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





  Color get inkColor {

    return inkColorMap[player.identityInk]!;

  }





  @override
  Widget build(BuildContext context) {


    return AnimatedContainer(


      duration:

          const Duration(

            milliseconds: 250,

          ),


      curve:

          Curves.easeOut,



      width:

          130,



      padding:

          const EdgeInsets.all(6),





      decoration:


          BoxDecoration(



            gradient:


                LinearGradient(



                  colors: [


                    Colors.white,


                    inkColor.withValues(

                      alpha: .10,

                    ),


                  ],



                  begin:

                      Alignment.topLeft,



                  end:

                      Alignment.bottomRight,


                ),





            borderRadius:


                BorderRadius.circular(18),





            border:


                Border.all(



                  color:


                      isActive

                          ? Colors.amber

                          : inkColor,



                  width:


                      isActive

                          ? 3

                          : 2,



                ),





            boxShadow: [



              BoxShadow(



                color:


                    isActive

                        ? Colors.amber.withValues(

                            alpha: .35,

                          )

                        : Colors.black26,



                blurRadius:


                    isActive

                        ? 16

                        : 6,



                spreadRadius:


                    isActive

                        ? 2

                        : 1,


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



                maxLines:


                    1,



                overflow:


                    TextOverflow.ellipsis,



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

                    inkColor,



                onChanged:

                    onLoreChanged,



              ),






              const SizedBox(

                height:

                    4,

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