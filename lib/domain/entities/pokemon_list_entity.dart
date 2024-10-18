class PokemonesListEntity {
  final List<PokemonListEntity> results;

  PokemonesListEntity({
    required this.results,
  });
}

class PokemonListEntity {
  final String name;
  final String url;

  PokemonListEntity({
    required this.name,
    required this.url,
  });

  String get idPokemon {
    List<String> parts = url.split('/');
    return parts[parts.length - 2];
  }
}
