import 'package:flutter/material.dart';
import '../home/home.dart';

class LoginScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Clé pour mon formulaire
  final _formKey = GlobalKey<FormState>();

  //Champs du formulaire
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void sendData() {
    //Vérifie si la personne a bien saisi les informations

    //Récupérer les valeurs saisies
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Veuillez remplir tous les champs'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      if (email == "congo242@gmail.com" && password == "00242") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email ou mot de passe incorrect'),
          backgroundColor: Colors.red,
        ),
      );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterLogo(size: 100),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                Container(
                  height: 50,
                  color: const Color.fromARGB(255, 163, 163, 255),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                ),

                ElevatedButton(
                  onPressed: sendData,
                  child: Text("Se connecter"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
