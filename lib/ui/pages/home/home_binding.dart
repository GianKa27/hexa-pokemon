import 'package:get/get.dart';
import 'package:myapp/data/sources/poke_api_source.dart';
import 'package:myapp/domain/repositories/poke_api_repository.dart';
import 'package:myapp/domain/use_cases/get_pokemon_use_case.dart';
import 'package:myapp/domain/use_cases/listar_pokemones_use_case.dart';
import 'package:myapp/ui/pages/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<PokeApiSource>(PokeApiSourceImp());
    Get.put<PokeApiRepository>(PokeApiRepositoryImp(Get.find()));

    Get.put(GetPokemonUseCase(Get.find()));
    Get.put(ListarPokemonesUseCase(Get.find()));

    Get.lazyPut(() => HomeController(Get.find(), Get.find()));
  }
}
