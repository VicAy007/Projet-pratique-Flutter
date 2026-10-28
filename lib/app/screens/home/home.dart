import 'package:flutter/material.dart';
import 'package:tp_flutter/app/screens/about/about_screen.dart';
import 'package:tp_flutter/app/screens/profile/profile_screen.dart';


class HomeScreen extends StatefulWidget{
const HomeScreen({super.key});
@override
State<HomeScreen> createState()=> _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{
  List <dynamic> profiles=[
    {
      "name": "Jean Malonga",
      "image": "assets/profiles/profile_1.jpg"
    },
    {
      "name": "Jacques Bouadi",
      "image": "assets/profiles/profile_2.jpg"
    },
    {
      "name": "Farrol MBouala",
      "image": "assets/profiles/profile_3.jpg"
    },
    {
      "name": "Emmanuelle Sah",
      "image": "assets/profiles/profile_f_1.jpg"
    },
    {
      "name": "Jacline Matondo",
      "image": "assets/profiles/profile_f_2.jpg"
    },
    {
      "name": "Nadine Nade",
      "image": "assets/profiles/profile_f_3.jpg"
    },
  ];

  @override
 Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      
      title: Text('Home Screen', style: TextStyle(color: Colors.white),), centerTitle: true,
      backgroundColor: Colors.purple,
      actions: [
        IconButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context)=> AboutScreen(), 
              )
            );
          }, 
          icon: Icon(
            Icons.info,
            color: Colors.white,
          )
        )
      ],
    ),
    body: ListView.builder(
      itemCount: profiles.length,
      itemBuilder: (context, index){
        final profile=profiles[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context)=> ProfileScreen(
                  name: profile['name'],
                  image: profile['image'],
                )
              )
            );
          },
          child: ListTile(
            title: Text(profile["name"]),
            subtitle: Text('${profile["name"][0].toUpperCase()}'+'${profile["name"][1].toUpperCase()}'),
            leading: CircleAvatar(
              backgroundColor: Colors.purple,
              backgroundImage: AssetImage(profile["image"]),
              
            ),
          ),
        );
      }
    ),
  );
 }
}