import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'new_game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Icon(
                  Icons.water_drop,
                  size: 90,
                )
                .animate()
                .fade(duration: 600.ms)
                .scale(),

                const SizedBox(height: 20),

                Text(
                  "INKWELL",
                  style: Theme.of(context).textTheme.displaySmall,
                ),

                const SizedBox(height: 60),

                FilledButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const NewGameScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.play_arrow),
                  label: const Text("New Game"),
                ),

                const SizedBox(height: 15),

                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.restore),
                  label: const Text("Continue"),
                ),

                const SizedBox(height: 15),

                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.bar_chart),
                  label: const Text("Statistics"),
                ),

                const SizedBox(height: 15),

                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                  label: const Text("Settings"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}