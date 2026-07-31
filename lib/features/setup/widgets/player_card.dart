import 'package:flutter/material.dart';

import '../../../shared/theme/ink_colors.dart';
import 'ink_selector.dart';


class PlayerCard extends StatelessWidget {

  const PlayerCard({

    super.key,

    required this.playerNumber,

    required this.name,

    required this.ink,

    required this.onNameChanged,

    required this.onInkChanged,

  });


  final int playerNumber;

  final String name;

  final InkType ink;

  final Function(String) onNameChanged;

  final Function(InkType) onInkChanged;



  @override
  Widget build(BuildContext context) {


    return Card(

      elevation: 6,

      child: Padding(

        padding:
            const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,


          children: [


            Text(

              "Player $playerNumber",

              style:
                  Theme.of(context)
                  .textTheme
                  .titleLarge,

            ),


            const SizedBox(height: 12),


            TextField(

              controller:
                  TextEditingController(
                    text: name,
                  ),

              decoration:
                  const InputDecoration(

                    labelText:
                        "Name",

                    border:
                        OutlineInputBorder(),

                  ),


              onChanged:
                  onNameChanged,

            ),


            const SizedBox(height: 16),


            const Text(
              "Identity",
            ),


            const SizedBox(height: 8),


            InkSelector(

              selected: ink,

              onSelected:
                  onInkChanged,

            ),

          ],

        ),

      ),

    );

  }

}