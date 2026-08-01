import 'package:flutter/material.dart';



class InkDisplay extends StatelessWidget {


  const InkDisplay({

    super.key,

    required this.available,

    required this.total,

  });



  final int available;

  final int total;





  @override
  Widget build(BuildContext context) {


    return Column(


      mainAxisSize:

          MainAxisSize.min,



      children: [



        const Text(

          "INK",

          style:

              TextStyle(

                fontWeight:

                    FontWeight.bold,

              ),

        ),





        Text(

          "$available / $total",

          style:

              const TextStyle(

                fontSize:

                    20,


                fontWeight:

                    FontWeight.bold,

              ),

        ),



      ],


    );


  }


}