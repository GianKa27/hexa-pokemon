import 'package:myapp/domain/entities/pokemon_entity.dart';
import 'package:myapp/domain/repositories/poke_api_repository.dart';

class GetPokemonUseCase {
  final PokeApiRepository _pokeApiRepository;

  GetPokemonUseCase(this._pokeApiRepository);

  Future<PokemonEntity> call(dynamic textOrId) async {
    try {
      final response = await _pokeApiRepository.getPokemon(textOrId);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
