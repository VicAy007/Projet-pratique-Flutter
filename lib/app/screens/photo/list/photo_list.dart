import 'package:flutter/material.dart';

import '../../../service/api_service.dart';

class PhotoList extends StatefulWidget {
  const new({super.key});

  @override
  State<PhotoList> createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  // Notre service qui s'occupe de parler à l'API.
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mes tâches')),
      body: FutureBuilder<List<dynamic>>(
        // Le FutureBuilder attend la réponse de cette requête...
        future: apiService.getAll(
          'https://jsonplaceholder.typicode.com/photos',
        ),
        // ...et "builder" est rappelé à chaque changement d'état.
        builder: (context, snapshot) {
          // Cas 1 : la requête est encore en cours -> cercle de chargement.
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.deepOrange),
            );
          }

          // Cas 2 : une erreur s'est produite.
          if (snapshot.hasError) {
            return Center(
              child: Text('Le serveur est actuellement indisponible'),
            );
          }
          // Cas 3 : la requête a réussi, mais la liste est vide.
          // "snapshot.data" contient la liste reçue (peut être null).
          final todos = snapshot.data;
          if (todos == null || todos.isEmpty) {
            return const Center(child: Text('Aucune tâche trouvée'));
          }

          // Cas 4 : on a des données -> on les affiche dans une liste.
          return ListView.builder(
            // Nombre d'éléments à afficher.
            itemCount: todos.length,
            // Appelé pour chaque ligne ; "index" = position (0, 1, 2...).
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                // 'title' et 'completed' sont les champs envoyés par l'API.
                title: Text(todo['title']),
                // Coche verte si la tâche est terminée, sinon cercle vide.
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(todo["url"]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
