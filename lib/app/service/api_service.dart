// On importe le package "http" pour faire des requêtes vers Internet.
// "as http" lui donne un nom court : on écrira http.get(...)
import 'package:http/http.dart' as http;

// "dart:convert" contient jsonDecode, qui transforme du texte JSON
// en objets Dart (listes, maps...).
import 'dart:convert';

// Cette classe regroupe tout ce qui concerne la communication avec l'API.
class ApiService {
  // Récupère une liste de données depuis une adresse (url).
  //
  // - "async" : la méthode fait une opération longue (attendre Internet).
  // - "Future<List<dynamic>>" : elle promet de retourner une liste PLUS TARD,
  //   quand la réponse du serveur sera arrivée.
  Future<List<dynamic>> getAll(String url) async {
    // "try" : on essaie d'exécuter le code.
    // Si quelque chose plante (pas d'Internet, serveur éteint...),
    // on passe directement dans "catch" au lieu de faire planter l'appli.
    try {
      // Uri.parse transforme le texte de l'adresse en objet Uri.
      // "await" = on attend la réponse du serveur avant de continuer.
      // ".timeout" = on abandonne après 10 secondes sans réponse.
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10));

      // Le code 200 veut dire "tout s'est bien passé".
      // Les autres codes (404, 500...) indiquent un problème.
      if (response.statusCode == 200) {
        // response.body est du texte JSON, par exemple : '[{"id":1},{"id":2}]'
        // jsonDecode le convertit en une vraie liste Dart.
        return jsonDecode(response.body) as List<dynamic>;
      } else {
        // Le serveur a répondu, mais avec une erreur.
        print('Erreur serveur : code ${response.statusCode}');
        return []; // On retourne une liste vide pour éviter de planter.
      }
    } catch (e) {
      // Erreur réseau, délai dépassé, JSON invalide...
      print('Erreur : $e');
      return []; // Même type de retour qu'en cas de succès : une liste.
    }
  }
}
