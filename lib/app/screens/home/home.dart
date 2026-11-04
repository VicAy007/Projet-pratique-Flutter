import 'package:flutter/material.dart';

import '../../widgets/profile_card.dart';
import '../about/about_screen.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> profiles = [
    {"name": "Jean MALONGA", "image": "assets/images/profiles/profile_1.jpg"},
    {"name": "Jean PATRICK", "image": "assets/images/profiles/profile_2.jpg"},
    {"name": "Sarah NGOMA", "image": "assets/images/profiles/profile_f_1.jpg"},
    {"name": "Sarah NGOMA", "image": "assets/images/profiles/profile_f_1.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutScreen()),
              );
            },
            icon: Icon(Icons.info),
          ),
        ],
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
        itemCount: profiles.length, // Nombre d'éléments dans la liste
        itemBuilder: (context, index) {
          final profile = profiles[index]; // Récupérer le profil actuel
          // {"name: "Jean MALONGA", "image": "assets/images/profiles/profile_1.jpg"}
          return GestureDetector(
            onTap: () {
              // Naviguer vers l'écran de profil avec les détails du profil
              Navigator.push(
                context,

                MaterialPageRoute(
                  builder: (context) => ProfileScreen(
                    name: profile["name"],
                    image: profile["image"],
                  ),
                ),
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(profile["image"]),
              ),
              title: Text(profile["name"]),
              subtitle: Text(profile["name"][0].toUpperCase()),
            ),
          );
        },
      ),
    );
  }
}
