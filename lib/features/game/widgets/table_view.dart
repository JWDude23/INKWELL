import 'package:flutter/material.dart';

import '../../../core/models/game_model.dart';
import '../../../core/models/player_model.dart';
import '../../../core/models/player_seat.dart';

import 'player_seat_widget.dart';



class TableView extends StatefulWidget {


  const TableView({

    super.key,

    required this.game,

  });



  final GameModel game;



  @override
  State<TableView> createState() =>
      _TableViewState();

}





class _TableViewState extends State<TableView> {


  List<PlayerModel> get players =>
      widget.game.players;







  Offset getSeatPosition(
      PlayerSeat? seat,
      Size size,
  ) {


    final horizontal =
        size.width * .20;


    final vertical =
        size.height * .20;




    switch(seat) {


      case PlayerSeat.top:

        return Offset(
          0,
          -vertical,
        );



      case PlayerSeat.left:

        return Offset(
          -horizontal,
          0,
        );



      case PlayerSeat.right:

        return Offset(
          horizontal,
          0,
        );



      case PlayerSeat.bottom:

      case null:

        return Offset(
          0,
          vertical,
        );


    }

  }









  Widget buildPlayerCard(
      PlayerModel player,
      Size size,
      bool active,
  ) {


    final position =
        getSeatPosition(
          player.seat,
          size,
        );



    final sidePlayer =
        player.seat == PlayerSeat.left ||
        player.seat == PlayerSeat.right;



    return Transform.translate(


      offset:

          position,



      child:


          Transform.scale(


            scale:


                active

                    ? 1.15

                    : sidePlayer

                        ? .78

                        : .90,



            child:


                KeyedSubtree(


                  key:

                      ValueKey(
                        player.name,
                      ),



                  child:


                      PlayerSeatWidget(


                        player:

                            player,



                        isActive:

                            active,



                        onLoreChanged:

                            (amount) {


                              setState(() {


                                player.addLore(

                                  amount,

                                  maxLore:
                                      20,

                                );


                              });


                            },



                        onSpendInk:


                            () {


                              setState(() {


                                player.exertInk(1);


                              });


                            },


                      ),


                ),


          ),


    );


  }







  void nextTurn() {


    setState(() {


      widget.game.nextTurn();


    });


  }









  @override
  Widget build(BuildContext context) {


    return Scaffold(



      floatingActionButton:


          FloatingActionButton.extended(


            onPressed:

                nextTurn,



            icon:

                const Icon(
                  Icons.auto_stories,
                ),



            label:

                const Text(
                  "Next Page",
                ),


          ),






      body:


          LayoutBuilder(


            builder:

                (context, constraints) {



              final size =
                  Size(
                    constraints.maxWidth,
                    constraints.maxHeight,
                  );



              final activePlayer =
                  widget.game.activePlayer;



              final inactivePlayers =
                  players
                      .where(
                        (player) =>
                            player != activePlayer,
                      )
                      .toList();





              return Container(


                width:

                    double.infinity,



                height:

                    double.infinity,



                decoration:


                    BoxDecoration(

                      color:

                          Colors.brown.shade900,

                    ),




                child:


                    Stack(


                      alignment:

                          Alignment.center,



                      children: [





                        Container(


                          width:

                              240,


                          height:

                              240,



                          decoration:


                              BoxDecoration(


                                shape:

                                    BoxShape.circle,



                                color:

                                    Colors.brown.shade700,



                                boxShadow: [


                                  BoxShadow(

                                    blurRadius:

                                        30,

                                    spreadRadius:

                                        5,

                                    color:

                                        Colors.black26,

                                  ),


                                ],

                              ),


                        ),





                        // Other players first

                        ...inactivePlayers.map(

                          (player) {

                            return buildPlayerCard(

                              player,

                              size,

                              false,

                            );

                          },

                        ),





                        // Active player always on top

                        buildPlayerCard(

                          activePlayer,

                          size,

                          true,

                        ),


                      ],

                    ),

              );

            },


          ),


    );

  }


}