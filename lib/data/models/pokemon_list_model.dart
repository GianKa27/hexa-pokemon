import 'package:myapp/domain/entities/pokemon_list_entity.dart';

class PokemonesListModel extends PokemonesListEntity {
  PokemonesListModel({
    required List<PokemonListModel> results,
  }) : super(results: results);

  factory PokemonesListModel.fromJson(Map<String, dynamic> json) =>
      PokemonesListModel(
        results: List<PokemonListModel>.from(
            json["results"].map((x) => PokemonListModel.fromJson(x))),
      );
}

class PokemonListModel extends PokemonListEntity {
  PokemonListModel({required super.name, required super.url});

  factory PokemonListModel.fromJson(Map<String, dynamic> json) =>
      PokemonListModel(
        name: json["name"],
        url: json["url"],
      );
}
