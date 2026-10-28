import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {

  String name;
  String image;

  ProfileScreen(
    {
      super.key,
      required this.name,
      required this.image,
    }
  );

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Column(
        children: [
          Image.asset(
            widget.image,
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 150,),
          Text(
            widget.name,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}