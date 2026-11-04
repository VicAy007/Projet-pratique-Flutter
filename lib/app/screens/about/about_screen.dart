import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  int counter = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "About Screen",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text("Description page", style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          Text("Coumpteur ${counter}", style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              counter++;
              setState(() {
                // Mettre à jour l'état pour refléter le changement du compteur
              });
            },
            child: Text("Incrementer"),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text("Hello from About Screen!"),
                  duration: Duration(days: 20),
                  action: SnackBarAction(label: "Cancel", onPressed: () {}),
                ),
              );
            },
            child: Text("Message"),
          ),
        ],
      ),
    );
  }
}
