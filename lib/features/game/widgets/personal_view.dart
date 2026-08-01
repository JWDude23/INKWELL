import 'package:flutter/material.dart';

import '../../../core/models/game_model.dart';


class PersonalView extends StatelessWidget {

  const PersonalView({

    super.key,

    required this.game,

  });


  final GameModel game;


  @override
  Widget build(BuildContext context) {

    return Center(

      child: Text(
        "Personal Mode",
        style:
            Theme.of(context)
            .textTheme
            .headlineMedium,
      ),

    );

  }

}