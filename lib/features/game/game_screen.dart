import 'package:flutter/material.dart';

import '../../core/models/game_model.dart';
import '../../shared/widgets/lore_wheel/lore_wheel.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({
    super.key,
    required this.game,
  });

  final GameModel game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Game"),
      ),

      body: GridView.builder(

        padding:
            const EdgeInsets.all(16),

        itemCount:
            game.players.length,


        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount:
                  2,

              crossAxisSpacing:
                  12,

              mainAxisSpacing:
                  12,

              childAspectRatio:
                  .65,

            ),


        itemBuilder:
            (context, index) {

          final player =
              game.players[index];


          return Card(

            elevation:
                4,


            child:
                Padding(

                  padding:
                      const EdgeInsets.all(8),


                  child:
                      Column(

                        children: [

                          LoreWheel(

                            lore:
                                player.lore,

                            maxLore:
                                20,

                            color:
                                Colors.amber,

                            onChanged:
    (amount) {

},

                          ),


                          const SizedBox(
                            height: 8,
                          ),


                          Text(

                            player.name,

                            style:
                                const TextStyle(

                                  fontWeight:
                                      FontWeight.bold,

                                ),

                          ),


                          Text(
                            "Lore: ${player.lore}",
                          ),


                          Text(
                            "Ink: ${player.availableInk}",
                          ),


                          Text(
                            "Exerted: ${player.exertedInk}",
                          ),


                        ],

                      ),

                ),

          );

        },

      ),

    );

  }

}