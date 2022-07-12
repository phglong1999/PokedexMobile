// ignore_for_file: non_constant_identifier_names, camel_case_types

class Pokemon {
  final int id;
  final String name;
  final int weight;
  final List<Types> types;
  final Sprites sprites;
  const Pokemon(
      {required this.id,
      required this.name,
      required this.weight,
      required this.types,
      required this.sprites});
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
        id: json['id'],
        name: json['name'],
        weight: json['weight'],
        types: List<dynamic>.from(json['types'])
            .map((e) => Types.fromJson(e['type']))
            .toList(),
        sprites: Sprites.fromJson(json['sprites']));
  }
}

class Types {
  final String name;
  final String url;
  const Types({required this.name, required this.url});
  factory Types.fromJson(Map<String, dynamic> json) {
    return Types(name: json['name'], url: json['url']);
  }
}

class Sprites {
  final Other other;
  const Sprites({required this.other});
  factory Sprites.fromJson(Map<String, dynamic> json) {
    return Sprites(other: Other.fromJson(json['other']));
  }
}

class Other {
  final Official_Artwork official_artwork;
  const Other({required this.official_artwork});
  factory Other.fromJson(Map<String, dynamic> json) {
    return Other(
        official_artwork: Official_Artwork.fromJson(json['official-artwork']));
  }
}

class Official_Artwork {
  final String front_default;
  const Official_Artwork({required this.front_default});
  factory Official_Artwork.fromJson(Map<String, dynamic> json) {
    return Official_Artwork(front_default: json['front_default']);
  }
}
