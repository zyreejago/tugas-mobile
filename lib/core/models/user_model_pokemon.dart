import 'dart:convert';

List<Pokemon> welcomeFromJson(String str) {
  final jsonData = json.decode(str); // Decode JSON string

  // Cek jika data yang diterima adalah List
  if (jsonData is List) {
    return List<Pokemon>.from(jsonData.map((x) => Pokemon.fromJson(x)));
  } else {
    // ignore: avoid_print, unnecessary_brace_in_string_interps
    print('Expected List, but got: ${jsonData}');
    return [];
  }
}

String welcomeToJson(List<Pokemon> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pokemon {
  int id;
  String pokemon;
  String type;
  List<String> abilities;
  int hitpoints;
  List<String> evolutions;
  String location;
  String imageUrl;

  Pokemon({
    required this.id,
    required this.pokemon,
    required this.type,
    required this.abilities,
    required this.hitpoints,
    required this.evolutions,
    required this.location,
    required this.imageUrl,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    id: json["id"] ?? 0, // Menambahkan default value jika key tidak ada
    pokemon: json["pokemon"] ?? 'Unknown', // Default value untuk field string
    type: json["type"] ?? 'Unknown',
    abilities: List<String>.from(json["abilities"]?.map((x) => x) ?? []),
    hitpoints: json["hitpoints"] ?? 0,
    evolutions: List<String>.from(json["evolutions"]?.map((x) => x) ?? []),
    location: json["location"] ?? 'Unknown',
    imageUrl: json["image_url"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pokemon": pokemon,
    "type": type,
    "abilities": List<dynamic>.from(abilities.map((x) => x)),
    "hitpoints": hitpoints,
    "evolutions": List<dynamic>.from(evolutions.map((x) => x)),
    "location": location,
    "image_url": imageUrl,
  };
}
