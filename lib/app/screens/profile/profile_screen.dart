import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  String name;
  String image;

  ProfileScreen({super.key, required this.name, required this.image});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Screen")),
      body: Column(
        children: [
          //Profile de couverture
          Image.asset(
            widget.image,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          //Séparateur
          SizedBox(height: 50),
          //Nom
          Text(
            widget.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
