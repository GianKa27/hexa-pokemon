import 'package:get/get.dart';
import 'package:myapp/domain/entities/pokemon_entity.dart';
import 'package:myapp/domain/entities/pokemon_list_entity.dart';
import 'package:myapp/domain/use_cases/get_pokemon_use_case.dart';
import 'package:myapp/domain/use_cases/listar_pokemones_use_case.dart';

class HomeController extends GetxController {
  final GetPokemonUseCase _getPokemonUseCase;
  final ListarPokemonesUseCase _listarPokemonesUseCase;

  HomeController(this._getPokemonUseCase, this._listarPokemonesUseCase);

  List<PokemonListEntity> listaPokemones = [];

  final int _limit = 200;
  int get _offset => listaPokemones.length;

  bool pokemonesLoading = false;

  Future<void> getPokemones() async {
    try {
      pokemonesLoading = true;

      final response = await _listarPokemonesUseCase.call(_limit, _offset);

      listaPokemones.addAll(response.results);
    } catch (e) {
      rethrow;
    } finally {
      pokemonesLoading = false;
      update(['listPokemones']);
    }
  }

  Future<PokemonEntity> getPokemon(dynamic textOrId) async {
    try {
      final response = await _getPokemonUseCase.call(textOrId);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
