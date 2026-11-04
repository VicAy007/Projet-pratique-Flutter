import 'package:flutter/material.dart';

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
    // Vérifie si la personne a bien saisi les informations

    //Récupert les valeurs saisies
    final email = emailController.text;
    final password = passwordController.text;

    //Si email ou mot de passe est vide, on affiche un message d'erreur
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Veuillez remplir tous les champs"),
          backgroundColor: Colors.red,
        ),
      );
    } else {}
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
                    hintText: "Veuillez saisir votre email",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Veuillez saisir votre mot de passe",
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () {},
                  child: Text("Se connecter"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
