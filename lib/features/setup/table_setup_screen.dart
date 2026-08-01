import 'package:flutter/material.dart';

import '../../core/models/player_model.dart';
import '../../core/models/player_seat.dart';
import '../../core/models/game_model.dart';

import '../game/game_screen.dart';



class TableSetupScreen extends StatefulWidget {


  const TableSetupScreen({

    super.key,

    required this.players,

  });



  final List<PlayerModel> players;



  @override
  State<TableSetupScreen> createState() =>
      _TableSetupScreenState();

}





class _TableSetupScreenState extends State<TableSetupScreen> {


  late List<PlayerModel> players;



  int currentPlayer = 1;



  @override
  void initState() {

    super.initState();

    players =
        widget.players;


    players[0].seat =
        PlayerSeat.bottom;

  }





  bool seatTaken(PlayerSeat seat) {


    return players.any(

      (player) =>
          player.seat == seat,

    );

  }





  void chooseSeat(PlayerSeat seat) {


    if(seatTaken(seat)) {

      return;

    }



    setState(() {


      players[currentPlayer].seat =
          seat;



      if(currentPlayer < players.length - 1) {

        currentPlayer++;

      }


    });


  }





  bool get complete {


    return players.every(

      (player) =>
          player.seat != null,

    );


  }





  void startGame() {


    final game =
        GameModel(

          players:
              players,

        );



    Navigator.of(context).pushReplacement(

      MaterialPageRoute(

        builder: (_) => GameScreen(

          game:
              game,

        ),

      ),

    );


  }






  Widget seatButton(

      PlayerSeat seat,

      String label,

      ) {



    final occupied =
        seatTaken(seat);



    final player = players.firstWhere(

      (p) =>
          p.seat == seat,

      orElse: () =>
          PlayerModel(

            name:
                "",

            identityInk:
                players[0].identityInk,

          ),

    );



    return GestureDetector(


      onTap:

          occupied

              ? null

              : () => chooseSeat(seat),



      child:

          Container(

            width:
                110,

            height:
                70,


            decoration:

                BoxDecoration(

                  color:

                      occupied

                          ? Colors.grey.shade700

                          : Colors.amber.shade700,


                  borderRadius:

                      BorderRadius.circular(12),


                ),



            child:

                Center(

                  child:

                      Column(

                        mainAxisAlignment:
                            MainAxisAlignment.center,


                        children: [



                          Text(

                            label,

                            style:

                                const TextStyle(

                                  color:
                                      Colors.white,

                                  fontWeight:
                                      FontWeight.bold,

                                ),

                          ),



                          if(occupied)

                            Text(

                              player.name,

                              style:

                                  const TextStyle(

                                    color:
                                        Colors.white,

                                    fontSize:
                                        12,

                                  ),

                            ),


                        ],


                      ),


                ),

          ),

    );

  }








  @override
  Widget build(BuildContext context) {


    final choosingPlayer =
        players[currentPlayer];



    return Scaffold(


      appBar:

          AppBar(

            title:

                const Text(
                  "Choose Seats",
                ),

          ),




      body:

          Column(

            children: [



              const SizedBox(
                height: 20,
              ),




              Text(

                currentPlayer < players.length

                    ? "${choosingPlayer.name}, choose your seat"

                    : "Seats complete",

                style:

                    const TextStyle(

                      fontSize:
                          18,

                      fontWeight:
                          FontWeight.bold,

                    ),

              ),




              Expanded(


                child:

                    Center(


                      child:

                          Stack(

                            alignment:
                                Alignment.center,


                            children: [



                              Container(

                                width:
                                    250,

                                height:
                                    250,


                                decoration:

                                    BoxDecoration(

                                      color:
                                          Colors.brown.shade800,


                                      shape:
                                          BoxShape.circle,

                                    ),

                              ),





                              Positioned(

                                top:
                                    40,


                                child:

                                    seatButton(

                                      PlayerSeat.top,

                                      "TOP",

                                    ),

                              ),





                              Positioned(

                                left:
                                    20,


                                child:

                                    seatButton(

                                      PlayerSeat.left,

                                      "LEFT",

                                    ),

                              ),






                              Positioned(

                                right:
                                    20,


                                child:

                                    seatButton(

                                      PlayerSeat.right,

                                      "RIGHT",

                                    ),

                              ),





                              Positioned(

                                bottom:
                                    40,


                                child:

                                    seatButton(

                                      PlayerSeat.bottom,

                                      "YOU",

                                    ),

                              ),



                            ],

                          ),


                    ),


              ),





              Padding(

                padding:
                    const EdgeInsets.all(16),


                child:

                    FilledButton(

                      onPressed:

                          complete

                              ? startGame

                              : null,


                      child:

                          const Text(
                            "START GAME",
                          ),

                    ),

              ),



            ],


          ),


    );


  }


}