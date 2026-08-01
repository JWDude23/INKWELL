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



  List<PlayerModel> get orderedPlayers {


    final players =
        List<PlayerModel>.from(
          widget.game.players,
        );



    final active =
        widget.game.activePlayer;



    players.remove(active);


    players.add(active);



    return players;

  }







  Alignment getPosition(PlayerSeat? seat) {


    switch(seat) {


      case PlayerSeat.top:

        return Alignment.topCenter;



      case PlayerSeat.left:

        return Alignment.centerLeft;



      case PlayerSeat.right:

        return Alignment.centerRight;



      case PlayerSeat.bottom:

      case null:

        return Alignment.bottomCenter;


    }


  }








  @override
  Widget build(BuildContext context) {


    return Scaffold(


      body:

          Container(


            decoration:

                BoxDecoration(

                  color:
                      Colors.brown.shade900,

                ),




            child:

                Stack(


                  children: [





                    Center(


                      child:

                          Container(

                            width:
                                220,


                            height:
                                220,



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


                    ),








                    ...orderedPlayers.map(

                      (player) {



                        return Align(


                          alignment:

                              getPosition(

                                player.seat,

                              ),




                          child:

                              Padding(


                                padding:

                                    const EdgeInsets.all(24),




                                child:

                                    PlayerSeatWidget(



                                      player:

                                          player,



                                      isActive:

                                          player ==
                                              widget.game.activePlayer,





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


                        );


                      },


                    ),





                  ],


                ),


          ),


    );


  }


}