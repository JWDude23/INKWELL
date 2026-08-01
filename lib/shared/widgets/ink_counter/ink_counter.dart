import 'package:flutter/material.dart';

import '../../theme/ink_colors.dart';
import '../ink_gem.dart';



class InkCounter extends StatelessWidget {


  const InkCounter({

    super.key,

    required this.available,

    required this.exerted,

    required this.color,

    required this.onSpend,

  });



  final int available;

  final int exerted;

  final InkType color;

  final VoidCallback onSpend;





  @override
  Widget build(BuildContext context) {


    return GestureDetector(


      onTap:

          available > 0
              ? onSpend
              : null,



      child:

          Column(


            mainAxisSize:

                MainAxisSize.min,



            children: [



              Row(


                mainAxisSize:

                    MainAxisSize.min,



                children:


                    List.generate(


                      available,


                      (index) {


                        return Padding(


                          padding:

                              const EdgeInsets.symmetric(

                                horizontal:
                                    2,

                              ),



                          child:

                              InkGem(


                                color:

                                    inkColorMap[color]!,


                              ),


                        );


                      },


                    ),


              ),





              const SizedBox(

                height:

                    8,

              ),





              Row(


                mainAxisSize:

                    MainAxisSize.min,



                children:


                    List.generate(


                      exerted,


                      (index) {


                        return Padding(


                          padding:

                              const EdgeInsets.symmetric(

                                horizontal:
                                    2,

                              ),



                          child:

                              InkGem(


                                color:

                                    inkColorMap[color]!,



                                exerted:

                                    true,


                              ),


                        );


                      },


                    ),


              ),


            ],


          ),


    );


  }


}