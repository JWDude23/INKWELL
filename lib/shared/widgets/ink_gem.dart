import 'package:flutter/material.dart';

import '../theme/ink_colors.dart';


class InkGem extends StatelessWidget {

  const InkGem({
    super.key,
    required this.type,
    this.size = 60,
    this.selected = false,
  });


  final InkType type;

  final double size;

  final bool selected;


  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(

      duration:
          const Duration(milliseconds: 250),

      width: size,

      height: size,

      decoration: BoxDecoration(

        shape: BoxShape.circle,

        color:
            InkColors.get(type),

        border: Border.all(

          color:
              selected
                  ? Colors.white
                  : Colors.transparent,

          width: 3,

        ),


        boxShadow:

            selected

                ? [

                    BoxShadow(

                      color:
                          InkColors.get(type)
                          .withOpacity(.7),

                      blurRadius: 18,

                      spreadRadius: 2,

                    ),

                  ]

                : null,

      ),


      child: Center(

        child: Text(

          _symbol(type),

          style:
              TextStyle(

                fontSize:
                    size * .45,

              ),

        ),

      ),

    );

  }



  String _symbol(InkType type) {

    switch(type){

      case InkType.amber:
        return "🟡";

      case InkType.amethyst:
        return "🟣";

      case InkType.emerald:
        return "🟢";

      case InkType.ruby:
        return "🔴";

      case InkType.sapphire:
        return "🔵";

      case InkType.steel:
        return "⚪";

    }

  }

}