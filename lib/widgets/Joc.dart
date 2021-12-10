import 'dart:io';
import 'dart:convert';

import 'package:projecte/main.dart';
import 'package:http/http.dart' as http;

class Joc {
  String name,
      slug,
      background_image, //Falta afegir plataformas i nota metacritic
      released;
  int? metacritic;

  Joc(this.name, this.slug, this.background_image, this.released,
      this.metacritic);

//slug = json ["genres"]["slug"];

  //APARTAT JSON FIREBASE A FER:
  /* 
  Map<String, dynamic> toJson() => {
        'nomplataforma': nomPlataforma,
        'companyiaplataforma': companyiaplataforma,
        'anyplataforma': anyPlataforma,
        'nom': nom,
        'genere': genere,
        'descripcio': descripcio,
        'companyia': companyia,
        'any': any
      };

  */

  Joc.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        slug = json["genres"][0]["name"],
        background_image = json["background_image"],
        released = json["released"],
        metacritic = json["metacritic"];
}

/*toString() =>
      '$name, $slug, $genere, $companyia, $descripcio ($nomPlataforma, $companyiaplataforma, $anyPlataforma)';
*/

Future<List<Joc>> loadlastGames() async {
  final uri = Uri(
    scheme: "https",
    host: "api.rawg.io",
    path: "/api/games",
    queryParameters: {
      'key': API_KEY,
      'dates': "2021-01-01,2021-12-31",
    },
  );
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  List jocs = json["results"];
  return jocs.map((jsonJoc) => Joc.fromJson(jsonJoc)).toList();
}

Future<List<Joc>> loadyourGames(String genre) async {
  final uri = Uri(
    scheme: "https",
    host: "api.rawg.io",
    path: "/api/games",
    queryParameters: {
      'key': API_KEY,
      'genres': "$genre",
      'dates': "2019-01-01,2021-12-31",
    },
  );
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  List jocs = json["results"];
  return jocs.map((jsonJoc) => Joc.fromJson(jsonJoc)).toList();
}
