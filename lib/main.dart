import 'package:flutter/material.dart';
import 'package:tp_flutter/app/screens/todo/list/todo_list.dart';

import 'app/screens/auth/login/login_screen.dart';
import 'app/screens/home/home.dart';
import 'app/screens/photo/list/photo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const new({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Liste des pages sur lesquelles je vais naviguer
  final pages = [HomeScreen(), TodoList(), PhotoList()];

  //Index de la page actuelle
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex], // pages[0]
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Todo"),
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: "Photo"),
        ],
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
