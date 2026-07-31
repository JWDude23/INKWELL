import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const InkwellApp());
}

class InkwellApp extends StatelessWidget {
  const InkwellApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inkwell',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}