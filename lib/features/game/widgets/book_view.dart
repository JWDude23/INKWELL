import 'package:flutter/material.dart';

import '../../../core/models/game_model.dart';


class BookView extends StatelessWidget {

  const BookView({

    super.key,

    required this.game,

  });


  final GameModel game;


  @override
  Widget build(BuildContext context) {

    return Center(

      child: Text(
        "Book Mode",
        style:
            Theme.of(context)
            .textTheme
            .headlineMedium,
      ),

    );

  }

}