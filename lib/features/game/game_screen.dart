import 'package:flutter/material.dart';

import '../../core/models/game_model.dart';
import '../../core/models/game_mode.dart';

import 'widgets/book_view.dart';
import 'widgets/table_view.dart';
import 'widgets/personal_view.dart';



class GameScreen extends StatelessWidget {

  const GameScreen({

    super.key,

    required this.game,

  });


  final GameModel game;



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body:

          switch (game.mode)

          {


            GameMode.book =>

                BookView(
                  game: game,
                ),



            GameMode.table =>

                TableView(
                  game: game,
                ),



            GameMode.personal =>

                PersonalView(
                  game: game,
                ),


          },


    );


  }


}