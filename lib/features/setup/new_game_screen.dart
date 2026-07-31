import 'package:flutter/material.dart';

import 'widgets/player_card.dart';
import '../../shared/theme/ink_colors.dart';


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



  void updatePlayerCount(int amount) {

    final newCount =
        playerCount + amount;


    if(newCount < 2 ||
       newCount > 4) {

      return;

    }


    setState(() {

      playerCount =
          newCount;

    });

  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(

        title:
            const Text(
              "New Game",
            ),

      ),


      body: AnimatedSize(

        duration:
            const Duration(
              milliseconds: 300,
            ),


        child: SingleChildScrollView(

          padding:
              const EdgeInsets.all(20),


          child: Column(

            children: [


              Text(

                "Players",

                style:
                    Theme.of(context)
                    .textTheme
                    .headlineSmall,

              ),



              const SizedBox(
                height: 16,
              ),



              Row(

                mainAxisAlignment:
                    MainAxisAlignment.center,


                children: [


                  IconButton(

                    onPressed:
                        (){
                          updatePlayerCount(-1);
                        },

                    icon:
                        const Icon(
                          Icons.remove_circle,
                          size: 36,
                        ),

                  ),



                  Text(

                    "$playerCount Players",

                    style:
                        const TextStyle(
                          fontSize: 22,
                          fontWeight:
                              FontWeight.bold,
                        ),

                  ),



                  IconButton(

                    onPressed:
                        (){
                          updatePlayerCount(1);
                        },

                    icon:
                        const Icon(
                          Icons.add_circle,
                          size: 36,
                        ),

                  ),


                ],

              ),



              const SizedBox(
                height: 20,
              ),




              ...List.generate(

                playerCount,

                (index){


                  return Padding(

                    padding:
                        const EdgeInsets.only(
                          bottom: 16,
                        ),


                    child: PlayerCard(

                      key:
                          ValueKey(index),


                      playerNumber:
                          index + 1,


                      name:
                          playerNames[index],


                      ink:
                          playerColors[index],



                      onNameChanged:
                          (value){

                            playerNames[index]
                                =
                                value;

                          },


                      onInkChanged:
                          (value){

                            setState((){

                              playerColors[index]
                                  =
                                  value;

                            });

                          },


                    ),

                  );

                },

              ),



              const SizedBox(
                height: 20,
              ),



              SizedBox(

                width:
                    double.infinity,


                child:
                    FilledButton(

                      onPressed:
                          (){


                      },


                      child:
                          const Text(
                            "Start Game",
                          ),

                    ),

              ),


            ],

          ),

        ),

      ),

    );

  }

}