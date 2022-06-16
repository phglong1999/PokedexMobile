class ListPokemon {
  final int count;
  final List<PokemonItem> results;
  const ListPokemon({required this.count, required this.results});
  factory ListPokemon.fromJson(Map<String, dynamic> json) {
    return ListPokemon(
      count: json['count'],
      results: json['results'],
    );
  }
}

class PokemonItem {
  final int id;
  final String url;
  const PokemonItem({required this.id, required this.url});
}
