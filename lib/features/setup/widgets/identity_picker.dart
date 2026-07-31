import 'package:flutter/material.dart';

import '../../../shared/theme/ink_colors.dart';
import '../../../shared/widgets/ink_gem.dart';



class IdentityPicker extends StatelessWidget {


  const IdentityPicker({

    super.key,

    required this.current,

    required this.onSelected,

  });



  final InkType current;

  final Function(InkType) onSelected;



  @override
  Widget build(BuildContext context) {


    return Padding(

      padding:
          const EdgeInsets.all(20),


      child: Column(


        mainAxisSize:
            MainAxisSize.min,


        children: [


          const Text(

            "Choose Identity",

            style:
                TextStyle(

                  fontSize: 22,

                  fontWeight:
                      FontWeight.bold,

                ),

          ),



          const SizedBox(
            height: 20,
          ),



          Wrap(

            spacing:
                25,

            runSpacing:
                25,


            children:

                InkType.values.map(

                  (ink){


                    return GestureDetector(

                      onTap: (){

                        onSelected(ink);

                        Navigator.pop(context);

                      },


                      child: Column(

                        children: [


                          InkGem(

                            type:
                                ink,

                            size:
                                65,

                            selected:
                                ink == current,

                          ),



                          const SizedBox(
                            height: 8,
                          ),



                          Text(

                            ink.name
                                .toUpperCase(),

                          ),


                        ],

                      ),

                    );


                  },

                ).toList(),

          ),

        ],

      ),

    );

  }

}