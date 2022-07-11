import 'dart:ffi';

class Pokemon {
  final int id;
  final String name;
  final Float weight;
  final List<Types> types;
  const Pokemon(
      {required this.id,
      required this.name,
      required this.weight,
      required this.types});
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
        id: json['id'],
        name: json['name'],
        weight: json['weight'],
        types: List<dynamic>.from(json['types'])
            .map((e) => Types.fromJson(e))
            .toList());
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
// class Sprites{
// final
// }
// class other {
//   final Oficialartwork oficialartwork;
//   const other({required this.oficialartwork});
// }

// class Oficialartwork {
//   // ignore: non_constant_identifier_names
//   final String front_default;
//   // ignore: non_constant_identifier_names
//   const Oficialartwork({required this.front_default});
//   factory Oficialartwork.fromJson(Map<String, dynamic> json) {
//     return Oficialartwork(front_default: json['name']);
//   }
// }
