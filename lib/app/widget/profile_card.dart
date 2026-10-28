import 'package:flutter/material.dart';


class ProfileCard extends StatefulWidget {
  String name;
  String image;

  ProfileCard({super.key, required this.name, required this.image});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
          child: Column(
            children: [
              Image.asset(widget.image, height: 200, width: 300,),
              Text(widget.name),
            ],
          ),
        );
  }
}


//stf raccourci pour une classe StatefulWidget




