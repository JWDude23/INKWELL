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

    this.maxInk = 10,

  });



  final int available;

  final int exerted;

  final int maxInk;

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



              const Text(

                "READY",

                style:

                    TextStyle(

                      fontSize:
                          10,

                      fontWeight:
                          FontWeight.bold,

                    ),

              ),





              Row(

                mainAxisSize:
                    MainAxisSize.min,


                children:

                    List.generate(

                      maxInk,


                      (index) {


                        return Padding(

                          padding:

                              const EdgeInsets.symmetric(

                                horizontal:
                                    1,

                              ),



                          child:

                              InkGem(

                                color:

                                    inkColorMap[color]!,

                                empty:

                                    index >= available,


                              ),

                        );


                      },


                    ),


              ),






              const SizedBox(

                height:
                    8,

              ),





              const Text(

                "EXERTED",

                style:

                    TextStyle(

                      fontSize:
                          10,

                      fontWeight:
                          FontWeight.bold,

                    ),

              ),






              Row(

                mainAxisSize:
                    MainAxisSize.min,


                children:

                    List.generate(

                      maxInk,


                      (index) {



                        return Padding(

                          padding:

                              const EdgeInsets.symmetric(

                                horizontal:
                                    1,

                              ),



                          child:

                              InkGem(

                                color:

                                    inkColorMap[color]!,


                                exerted:

                                    index < exerted,


                                empty:

                                    index >= exerted,


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