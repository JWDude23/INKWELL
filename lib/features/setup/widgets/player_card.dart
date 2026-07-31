import 'package:flutter/material.dart';

import '../../../shared/theme/ink_colors.dart';
import '../../../shared/widgets/ink_gem.dart';
import 'identity_picker.dart';



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




  void showPicker(BuildContext context){

    showModalBottomSheet(

      context: context,

      builder: (_) {

        return IdentityPicker(

          current:
              ink,

          onSelected:
              onInkChanged,

        );

      },

    );

  }





  @override
Widget build(BuildContext context) {

  return GestureDetector(

    onTap: () {
      showPicker(context);
    },


    child: Card(

      elevation: 6,


      shape: RoundedRectangleBorder(

        borderRadius:
            BorderRadius.circular(20),


        side: BorderSide(

          color:
              InkColors.get(ink),

          width:
              3,

        ),

      ),


      child: Padding(

        padding:
            const EdgeInsets.all(6),


        child: Column(

          mainAxisAlignment:
              MainAxisAlignment.center,


          mainAxisSize:
              MainAxisSize.min,


          children: [


            InkGem(

              type:
                  ink,

              size:
                  42,

            ),


            const SizedBox(
              height: 2,
            ),



            Text(

              "Player $playerNumber",

              style:
                  const TextStyle(

                    fontWeight:
                        FontWeight.bold,

                    fontSize:
                        14,

                  ),

            ),



            SizedBox(

              height:
                  32,


              child:
                  TextField(

                    textAlign:
                        TextAlign.center,


                    style:
                        const TextStyle(

                          fontSize:
                              13,

                        ),


                    decoration:
                        InputDecoration(

                          hintText:
                              name,

                          isDense:
                              true,


                          contentPadding:
                              EdgeInsets.zero,


                          border:
                              InputBorder.none,

                        ),


                    onChanged:
                        onNameChanged,

                  ),

            ),



            const Icon(

              Icons.palette_outlined,

              size:
                  14,

            ),


          ],

        ),

      ),

    ),

  );

}
}