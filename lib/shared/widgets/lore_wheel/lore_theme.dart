import 'package:flutter/material.dart';


class LoreTheme {


  const LoreTheme({

    required this.segments,

    required this.backgroundColor,

    required this.activeColor,

    required this.inactiveColor,

  });



  final int segments;

  final Color backgroundColor;

  final Color activeColor;

  final Color inactiveColor;


  static const classic = LoreTheme(

    segments: 20,

    backgroundColor: Colors.black12,

    activeColor: Colors.amber,

    inactiveColor: Colors.black26,

  );

}