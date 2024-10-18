import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/domain/entities/pokemon_list_entity.dart';
import 'package:myapp/ui/theme/app_theme.dart';

import '../home_controller.dart';

class DraggableBottomSheetVerPokemon extends StatelessWidget {
  final PokemonListEntity pokemonList;
  DraggableBottomSheetVerPokemon({
    super.key,
    required this.pokemonList,
  });

  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (context, controller) {
        return Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          child: FutureBuilder(
              future: _homeController.getPokemon(pokemonList.idPokemon),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                  controller: controller,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          snapshot.data!.name.capitalizeFirst ?? '',
                          style: Theme.of(context).textTheme.displayMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppTheme.azulPokemon, width: 3)),
                          child: Image.network(
                            snapshot.data!.sprites.frontDefault,
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      height: 50,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Orden',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(width: 15),
                        Text(snapshot.data!.order.toString(),
                            style: const TextStyle(fontSize: 30))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Altura',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(width: 15),
                        Text(snapshot.data!.height.toString(),
                            style: const TextStyle(fontSize: 30))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Peso',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(width: 15),
                        Text(snapshot.data!.weight.toString(),
                            style: const TextStyle(fontSize: 30))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Experiencia base',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(width: 15),
                        Text(snapshot.data!.baseExperience.toString(),
                            style: const TextStyle(fontSize: 30))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              }),
        );
      },
      maxChildSize: 0.70,
    );
  }
}
