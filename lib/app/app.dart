import 'package:flutter/material.dart';

import 'router.dart';
import 'theme.dart';

class InkwellApp extends StatelessWidget {
  const InkwellApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(

      debugShowCheckedModeBanner: false,

      title: "Inkwell",

      theme: AppTheme.light(),

      darkTheme: AppTheme.dark(),

      routerConfig: router,

    );

  }
}