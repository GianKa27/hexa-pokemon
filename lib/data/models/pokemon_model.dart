import 'package:myapp/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel({
    required List<AbilityModel> super.abilities,
    required super.baseExperience,
    required CriesModel super.cries,
    required List<SpeciesModel> super.forms,
    required List<GameIndexModel> super.gameIndices,
    required super.height,
    required super.id,
    required super.isDefault,
    required super.locationAreaEncounters,
    required List<MoveModel> super.moves,
    required super.name,
    required super.order,
    required SpeciesModel super.species,
    required SpritesModel super.sprites,
    required List<StatModel> super.stats,
    required List<TypeModel> super.types,
    required super.weight,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        abilities: List<AbilityModel>.from(
            json["abilities"].map((x) => AbilityModel.fromJson(x))),
        baseExperience: json["base_experience"],
        cries: CriesModel.fromJson(json["cries"]),
        forms: List<SpeciesModel>.from(
            json["forms"].map((x) => SpeciesModel.fromJson(x))),
        gameIndices: List<GameIndexModel>.from(
            json["game_indices"].map((x) => GameIndexModel.fromJson(x))),
        height: json["height"],
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: List<MoveModel>.from(
            json["moves"].map((x) => MoveModel.fromJson(x))),
        name: json["name"],
        order: json["order"],
        species: SpeciesModel.fromJson(json["species"]),
        stats: List<StatModel>.from(
            json["stats"].map((x) => StatModel.fromJson(x))),
        types: List<TypeModel>.from(
            json["types"].map((x) => TypeModel.fromJson(x))),
        weight: json["weight"],
        sprites: SpritesModel.fromJson(json["sprites"]),
      );
}

class SpritesModel extends SpritesEntity {
  SpritesModel({
    required super.backDefault,
    required super.backFemale,
    required super.backShiny,
    required super.backShinyFemale,
    required super.frontDefault,
    required super.frontFemale,
    required super.frontShiny,
    required super.frontShinyFemale,
    required OtherModel? super.other,
    required SpritesModel? super.animated,
  });

  factory SpritesModel.fromJson(Map<String, dynamic> json) => SpritesModel(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        other:
            json["other"] == null ? null : OtherModel.fromJson(json["other"]),
        animated: json["animated"] == null
            ? null
            : SpritesModel.fromJson(json["animated"]),
      );
}

class AbilityModel extends AbilityEntity {
  AbilityModel({
    required SpeciesModel super.ability,
    required super.isHidden,
    required super.slot,
  });

  factory AbilityModel.fromJson(Map<String, dynamic> json) => AbilityModel(
        ability: SpeciesModel.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );
}

class SpeciesModel extends SpeciesEntity {
  SpeciesModel({
    required super.name,
    required super.url,
  });

  factory SpeciesModel.fromJson(Map<String, dynamic> json) => SpeciesModel(
        name: json["name"],
        url: json["url"],
      );
}

class CriesModel extends CriesEntity {
  CriesModel({
    required super.latest,
    required super.legacy,
  });

  factory CriesModel.fromJson(Map<String, dynamic> json) => CriesModel(
        latest: json["latest"],
        legacy: json["legacy"],
      );
}

class GameIndexModel extends GameIndexEntity {
  GameIndexModel({
    required super.gameIndex,
    required SpeciesModel super.version,
  });

  factory GameIndexModel.fromJson(Map<String, dynamic> json) => GameIndexModel(
        gameIndex: json["game_index"],
        version: SpeciesModel.fromJson(json["version"]),
      );
}

class MoveModel extends MoveEntity {
  MoveModel({
    required SpeciesModel move,
    required List<VersionGroupDetailModel> versionGroupDetails,
  }) : super(move: move, versionGroupDetails: versionGroupDetails);

  factory MoveModel.fromJson(Map<String, dynamic> json) => MoveModel(
        move: SpeciesModel.fromJson(json["move"]),
        versionGroupDetails: List<VersionGroupDetailModel>.from(
            json["version_group_details"]
                .map((x) => VersionGroupDetailModel.fromJson(x))),
      );
}

class VersionGroupDetailModel extends VersionGroupDetailEntity {
  VersionGroupDetailModel({
    required super.levelLearnedAt,
    required SpeciesModel super.moveLearnMethod,
    required SpeciesModel super.versionGroup,
  });

  factory VersionGroupDetailModel.fromJson(Map<String, dynamic> json) =>
      VersionGroupDetailModel(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: SpeciesModel.fromJson(json["move_learn_method"]),
        versionGroup: SpeciesModel.fromJson(json["version_group"]),
      );
}

class OtherModel extends OtherEntity {
  OtherModel({
    required DreamWorldModel dreamWorld,
    required HomeModel home,
  }) : super(dreamWorld: dreamWorld, home: home);
  factory OtherModel.fromJson(Map<String, dynamic> json) => OtherModel(
        dreamWorld: DreamWorldModel.fromJson(json["dream_world"]),
        home: HomeModel.fromJson(json["home"]),
      );
}

class HomeModel extends HomeEntity {
  HomeModel({
    required super.frontDefault,
    required super.frontFemale,
    required super.frontShiny,
    required super.frontShinyFemale,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );
}

class DreamWorldModel extends DreamWorldEntity {
  DreamWorldModel({required super.frontDefault, required super.frontFemale});

  factory DreamWorldModel.fromJson(Map<String, dynamic> json) =>
      DreamWorldModel(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );
}

class StatModel extends StatEntity {
  StatModel({
    required super.baseStat,
    required super.effort,
    required SpeciesModel super.stat,
  });

  factory StatModel.fromJson(Map<String, dynamic> json) => StatModel(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: SpeciesModel.fromJson(json["stat"]),
      );
}

class TypeModel extends TypeEntity {
  TypeModel({
    required super.slot,
    required SpeciesModel super.type,
  });

  factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
        slot: json["slot"],
        type: SpeciesModel.fromJson(json["type"]),
      );
}
