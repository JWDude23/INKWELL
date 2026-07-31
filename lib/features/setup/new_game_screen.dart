import 'package:flutter/material.dart';

class NewGameScreen extends StatefulWidget {
  const NewGameScreen({super.key});

  @override
  State<NewGameScreen> createState() => _NewGameScreenState();
}

class _NewGameScreenState extends State<NewGameScreen> {
  int playerCount = 2;

  int loreTarget = 20;

  bool commanderMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Game"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          const Text(
            "Players",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          Slider(
            value: playerCount.toDouble(),
            min: 2,
            max: 4,
            divisions: 2,
            label: "$playerCount",
            onChanged: (value) {
              setState(() {
                playerCount = value.toInt();
              });
            },
          ),

          Text(
            "$playerCount Players",
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 30),

          TextField(
            decoration: const InputDecoration(
              labelText: "Lore Target",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            controller: TextEditingController(
              text: loreTarget.toString(),
            ),
            onChanged: (value) {
              loreTarget = int.tryParse(value) ?? 20;
            },
          ),

          const SizedBox(height: 30),

          SwitchListTile(
            value: commanderMode,
            title: const Text("Commander Mode"),
            onChanged: (value) {
              setState(() {
                commanderMode = value;
              });
            },
          ),

          const SizedBox(height: 40),

          FilledButton(
            onPressed: () {

            },
            child: const Text("Start Game"),
          )
        ],
      ),
    );
  }
}