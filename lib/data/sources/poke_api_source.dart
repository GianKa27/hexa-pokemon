import 'package:myapp/core/http/http_client.dart';
import 'package:myapp/data/models/pokemon_list_model.dart';

import '../models/pokemon_model.dart';

abstract class PokeApiSource {
  Future<PokemonesListModel> listarPokemones(int limit, int offset);
  Future<PokemonModel> getPokemon(dynamic textOrId);
}

class PokeApiSourceImp extends HttpClient implements PokeApiSource {
  @override
  Future<PokemonesListModel> listarPokemones(int limit, int offset) async {
    try {
      final response = await dio
          .get('/', queryParameters: {'limit': limit, "offset": offset});

      return PokemonesListModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<PokemonModel> getPokemon(dynamic textOrId) async {
    try {
      final response = await dio.get("/$textOrId");

      return PokemonModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
