import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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




  void changePlayers(int amount){


    final value =
        playerCount + amount;


    if(value < 2 || value > 4){
      return;
    }


    setState((){

      playerCount = value;

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



      body:
          SafeArea(


            child:
                LayoutBuilder(


              builder:
                  (context, constraints){


                final isSmall =
                    constraints.maxHeight < 700;



                return Column(


                  children: [



                    Padding(

                      padding:
                          const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),


                      child: Row(

                        mainAxisAlignment:
                            MainAxisAlignment.center,


                        children: [



                          IconButton(

                            icon:
                                const Icon(
                                  Icons.remove_circle,
                                ),

                            onPressed:
                                (){
                                  changePlayers(-1);
                                },

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
                                (){
                                  changePlayers(1);
                                },

                          ),



                        ],

                      ),

                    ),




                    Expanded(

  child: GridView.builder(

    physics:
        const NeverScrollableScrollPhysics(),

    padding:
        const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 2,
        ),


    gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(

          crossAxisCount: 2,

          crossAxisSpacing: 12,

          mainAxisSpacing: 12,

          childAspectRatio: 1.25,

        ),


    itemCount:
        playerCount,


    itemBuilder:
        (context, index) {


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
            (value){

          playerNames[index] =
              value;

        },


        onInkChanged:
            (value){

          setState((){

            playerColors[index] =
                value;

          });

        },

      )

      .animate()

      .fadeIn(

        duration:
            300.ms,

      )

      .slideY(

        begin:
            .15,

      );


    },

  ),

),





                    Padding(

                      padding:
                          const EdgeInsets.fromLTRB(
                            12,
                            4,
                            12,
                            4,
                          ),

                      child:

                          SizedBox(

                            width:
                                double.infinity,


                            child:

                                FilledButton(

                                  style:
                                      FilledButton.styleFrom(

  minimumSize:
      const Size(
        double.infinity,
        42,
      ),

),


                                  onPressed:
                                      (){


                                      },


                                  child:
                                      const Text(
                                        "START GAME",
                                      ),

                                ),

                          ),

                    ),



                  ],


                );

              },

            ),

          ),

    );


  }


}