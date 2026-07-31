import 'package:flutter/material.dart';

import '../../../shared/theme/ink_colors.dart';


class InkSelector extends StatelessWidget {

  const InkSelector({
    super.key,
    required this.selected,
    required this.onSelected,
  });


  final InkType selected;

  final Function(InkType) onSelected;


  @override
  Widget build(BuildContext context) {

    return Wrap(

      spacing: 12,

      children: InkType.values.map((ink){

        final selectedInk =
            ink == selected;


        return GestureDetector(

          onTap: (){
            onSelected(ink);
          },

          child: AnimatedContainer(

            duration:
                const Duration(milliseconds: 250),

            width: 40,

            height: 40,

            decoration: BoxDecoration(

              shape: BoxShape.circle,

              color:
                  InkColors.get(ink),

              border: Border.all(

                color:
                    selectedInk
                        ? Colors.white
                        : Colors.transparent,

                width: 3,

              ),

              boxShadow:
                  selectedInk
                      ? [
                          BoxShadow(
                            color:
                                InkColors.get(ink),
                            blurRadius: 12,
                          )
                        ]
                      : null,

            ),

          ),

        );

      }).toList(),

    );

  }

}