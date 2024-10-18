import 'package:myapp/data/sources/poke_api_source.dart';
import 'package:myapp/domain/entities/pokemon_entity.dart';
import 'package:myapp/domain/entities/pokemon_list_entity.dart';

abstract class PokeApiRepository {
  Future<PokemonesListEntity> listarPokemones(int limit, int offset);
  Future<PokemonEntity> getPokemon(dynamic textOrId);
}

class PokeApiRepositoryImp implements PokeApiRepository {
  final PokeApiSource _pokeApiSource;

  PokeApiRepositoryImp(this._pokeApiSource);

  @override
  Future<PokemonesListEntity> listarPokemones(int limit, int offset) async {
    try {
      final response = await _pokeApiSource.listarPokemones(limit, offset);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PokemonEntity> getPokemon(dynamic textOrId) async {
    try {
      final response = await _pokeApiSource.getPokemon(textOrId);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
