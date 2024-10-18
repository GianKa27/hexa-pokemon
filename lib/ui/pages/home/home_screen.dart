import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:myapp/ui/pages/home/home_controller.dart';
import 'package:myapp/ui/pages/home/widgets/card_pokemon_lista.dart';

import '../../theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeController = Get.find<HomeController>();

  final _scrollController = ScrollController();

  bool _showBackToTop = false;

  String _textInput = "";

  final TextEditingController _textInputController = TextEditingController();

  final FocusNode _textInputFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() async {
      _scrollController.position.pixels > 200
          ? _showBackToTop == false
              ? setState(() {
                  _showBackToTop = true;
                })
              : null
          : setState(() {
              _showBackToTop = false;
            });

      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        try {
          if (_homeController.pokemonesLoading == false) {
            await _homeController.getPokemones();
          }
        } catch (e) {
          Get.snackbar("¡Ups!", "$e");
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: _showBackToTop
          ? FloatingActionButton.small(
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: const Duration(seconds: 2),
                    curve: Curves.fastEaseInToSlowEaseOut);
              },
              child: const Icon(Icons.arrow_upward_rounded),
            )
          : null,
      body: RefreshIndicator(
        onRefresh: () async {
          try {
            _homeController.listaPokemones.clear();
            await _homeController.getPokemones();
          } catch (e) {
            Get.snackbar("¡Ups!", "$e");
          }
        },
        displacement: 50,
        edgeOffset: 30,
        backgroundColor: Colors.white,
        color: AppTheme.azulPokemon,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              title: Image.asset(
                'assets/general/pokemon.png',
                height: 40,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.toNamed('/home_screen/ejercicios_screen');
                    },
                    child: const Text("Ejercicios"))
              ],
            ),
            SliverAppBar(
              title: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Stack(
                    children: [
                      TextFormField(
                        controller: _textInputController,
                        focusNode: _textInputFocusNode,
                        onChanged: (text) => setState(() {
                          _textInput = text;
                        }),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.catching_pokemon_rounded),
                            hintText: "Buscar Pokémon"),
                      ),
                      Positioned(
                          right: 1,
                          child: IconButton(
                              onPressed: () => setState(() {
                                    _textInput = "";
                                    _textInputController.clear();
                                    _textInputFocusNode.unfocus();
                                  }),
                              icon: const Icon(
                                Icons.close,
                                color: Colors.black,
                              )))
                    ],
                  )),
              backgroundColor: Colors.transparent,
              floating: true,
              pinned: true,
              surfaceTintColor: Colors.transparent,
            ),
            GetBuilder<HomeController>(
                id: 'listPokemones',
                init: _homeController,
                initState: (_) async {
                  try {
                    await _homeController.getPokemones();
                  } catch (e) {
                    Get.snackbar("¡Ups!", "$e");
                  } finally {
                    _homeController.update(['listPokemones']);
                  }
                },
                builder: (_) {
                  if (_homeController.listaPokemones.isEmpty) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: LimitedBox(
                        maxWidth: 100,
                        maxHeight: 100,
                        child: Lottie.asset(
                            'assets/lotties/pokeball_loading.json',
                            width: 100,
                            height: 100,
                            repeat: true,
                            fit: BoxFit.contain),
                      ),
                    );
                  }
                  return SliverPadding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      sliver: SliverList(
                          delegate: SliverChildListDelegate(_homeController
                              .listaPokemones
                              .where((e) => e.name
                                  .toLowerCase()
                                  .contains(_textInput.toLowerCase()))
                              .map((e) => CardPokemonLista(
                                    pokemonList: e,
                                  ))
                              .toList())));
                })
          ],
        ),
      ),
    );
  }
}
