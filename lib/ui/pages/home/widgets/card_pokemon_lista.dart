import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/domain/entities/pokemon_list_entity.dart';

import 'package:myapp/ui/pages/home/widgets/draggable_bottom_sheet_ver_pokemon.dart';

class CardPokemonLista extends StatelessWidget {
  final PokemonListEntity pokemonList;

  const CardPokemonLista({
    super.key,
    required this.pokemonList,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: () {
        Get.bottomSheet(
          DraggableBottomSheetVerPokemon(pokemonList: pokemonList),
          isScrollControlled: true,
        );
      },
      leading: const Icon(Icons.catching_pokemon_outlined, color: Colors.black),
      title: Text(pokemonList.name),
    ));
  }
}
