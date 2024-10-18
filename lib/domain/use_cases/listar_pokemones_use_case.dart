import 'package:myapp/domain/entities/pokemon_list_entity.dart';
import 'package:myapp/domain/repositories/poke_api_repository.dart';

class ListarPokemonesUseCase {
  final PokeApiRepository _pokeApiRepository;

  ListarPokemonesUseCase(this._pokeApiRepository);

  Future<PokemonesListEntity> call(int limit, int offset) async {
    try {
      final response = await _pokeApiRepository.listarPokemones(limit, offset);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
