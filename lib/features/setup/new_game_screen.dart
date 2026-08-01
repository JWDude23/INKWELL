import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'widgets/player_card.dart';

import '../../shared/theme/ink_colors.dart';

import '../game/game_screen.dart';
import '../setup/table_setup_screen.dart';

import '../../core/models/player_model.dart';
import '../../core/models/game_model.dart';
import '../../core/models/game_mode.dart';
import '../../core/models/player_seat.dart';



class NewGameScreen extends StatefulWidget {

  const NewGameScreen({

    super.key,

  });


  @override
  State<NewGameScreen> createState() =>
      _NewGameScreenState();

}



class _NewGameScreenState extends State<NewGameScreen> {



  int playerCount = 2;



  GameMode selectedMode =
      GameMode.table;



  final List<PlayerSeat> playerSeats = [

    PlayerSeat.bottom,
    PlayerSeat.top,
    PlayerSeat.left,
    PlayerSeat.right,

  ];



  final List<String> playerNames = [

    "Player 1",
    "Player 2",
    "Player 3",
    "Player 4",

  ];



  final List<InkType> playerColors = [

    InkType.amber,
    InkType.sapphire,
    InkType.emerald,
    InkType.ruby,

  ];





  void changePlayers(int amount) {


    final value =
        playerCount + amount;



    if(value < 2 || value > 4) {

      return;

    }



    setState(() {

      playerCount =
          value;

    });


  }






  List<PlayerModel> createPlayers() {


    return List.generate(

      playerCount,

      (index) {


        return PlayerModel(

          name:
              playerNames[index],


          identityInk:
              playerColors[index],


          seat:

              selectedMode == GameMode.table

                  ? null

                  : playerSeats[index],


        );


      },

    );


  }







  void startGame() {


    final players =
        createPlayers();



    final game = GameModel(

      players:
          players,

      mode:
          selectedMode,

    );





    if(selectedMode == GameMode.table) {


      Navigator.of(context).push(

  MaterialPageRoute(

    builder: (_) => TableSetupScreen(

      players:
          players,

    ),

  ),

);


    }

    else {


      Navigator.of(context).push(

        MaterialPageRoute(

          builder: (_) => GameScreen(

            game:
                game,

          ),

        ),

      );


    }


  }







  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar:

          AppBar(

            title:

                const Text(
                  "New Game",
                ),

          ),



      body:

          SafeArea(

            child:

                Column(

                  children: [





                    Row(

                      mainAxisAlignment:
                          MainAxisAlignment.center,


                      children: [


                        IconButton(

                          icon:
                              const Icon(
                                Icons.remove_circle,
                              ),


                          onPressed:
                              () => changePlayers(-1),

                        ),



                        Text(

                          "$playerCount Players",

                          style:
                              Theme.of(context)
                              .textTheme
                              .headlineSmall,

                        ),



                        IconButton(

                          icon:
                              const Icon(
                                Icons.add_circle,
                              ),


                          onPressed:
                              () => changePlayers(1),

                        ),


                      ],

                    ),






                    Padding(

                      padding:
                          const EdgeInsets.all(12),


                      child:

                          DropdownButtonFormField<GameMode>(


                            initialValue:
                                selectedMode,


                            decoration:

                                const InputDecoration(

                                  labelText:
                                      "Game Mode",

                                  border:
                                      OutlineInputBorder(),

                                ),



                            items:

                                GameMode.values.map(

                                  (mode) {


                                    return DropdownMenuItem(

                                      value:
                                          mode,


                                      child:

                                          Text(

                                            mode.name
                                            .toUpperCase(),

                                          ),

                                    );


                                  },

                                ).toList(),



                            onChanged:

                                (mode) {


                                  if(mode == null) {

                                    return;

                                  }



                                  setState(() {

                                    selectedMode =
                                        mode;

                                  });


                                },


                          ),

                    ),







                    Expanded(


                      child:

                          GridView.builder(


                            padding:

                                const EdgeInsets.all(12),



                            itemCount:

                                playerCount,



                            gridDelegate:

                                const SliverGridDelegateWithFixedCrossAxisCount(

                                  crossAxisCount:
                                      2,


                                  crossAxisSpacing:
                                      12,


                                  mainAxisSpacing:
                                      12,


                                  childAspectRatio:
                                      1.25,

                                ),




                            itemBuilder:

                                (context,index) {


                                  return PlayerCard(

                                    key:
                                        ValueKey(index),


                                    playerNumber:
                                        index + 1,


                                    name:
                                        playerNames[index],


                                    ink:
                                        playerColors[index],



                                    onNameChanged:

                                        (value) {


                                          playerNames[index] =
                                              value;


                                        },



                                    onInkChanged:

                                        (value) {


                                          setState(() {


                                            playerColors[index] =
                                                value;


                                          });


                                        },


                                  )

                                  .animate()

                                  .fadeIn(

                                    duration:
                                        300.ms,

                                  );


                                },


                          ),


                    ),






                    Padding(

                      padding:
                          const EdgeInsets.all(12),


                      child:

                          SizedBox(

                            width:
                                double.infinity,


                            child:

                                FilledButton(

                                  onPressed:
                                      startGame,


                                  child:

                                      const Text(
                                        "START GAME",
                                      ),

                                ),

                          ),

                    ),



                  ],


                ),

          ),


    );


  }


}