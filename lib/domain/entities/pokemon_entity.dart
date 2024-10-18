class PokemonEntity {
  final List<AbilityEntity> abilities;
  final int baseExperience;
  final CriesEntity cries;
  final List<SpeciesEntity> forms;
  final List<GameIndexEntity> gameIndices;
  final int height;
  final int id;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<MoveEntity> moves;
  final String name;
  final int order;
  final SpeciesEntity species;
  final SpritesEntity sprites;
  final List<StatEntity> stats;
  final List<TypeEntity> types;
  final int weight;

  PokemonEntity({
    required this.abilities,
    required this.baseExperience,
    required this.cries,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.species,
    required this.stats,
    required this.types,
    required this.weight,
    required this.sprites,
  });
}

class AbilityEntity {
  final SpeciesEntity ability;
  final bool isHidden;
  final int slot;

  AbilityEntity({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });
}

class SpeciesEntity {
  final String name;
  final String url;

  SpeciesEntity({
    required this.name,
    required this.url,
  });
}

class SpritesEntity {
  final String backDefault;
  final String? backFemale;
  final String backShiny;
  final String? backShinyFemale;
  final String frontDefault;
  final String? frontFemale;
  final String frontShiny;
  final String? frontShinyFemale;
  final OtherEntity? other;
  final SpritesEntity? animated;
  SpritesEntity({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    required this.other,
    required this.animated,
  });
}

class CriesEntity {
  final String? latest;
  final String? legacy;

  CriesEntity({required this.latest, required this.legacy});
}

class GameIndexEntity {
  final int gameIndex;
  final SpeciesEntity version;

  GameIndexEntity({
    required this.gameIndex,
    required this.version,
  });
}

class MoveEntity {
  final SpeciesEntity move;
  final List<VersionGroupDetailEntity> versionGroupDetails;

  MoveEntity({
    required this.move,
    required this.versionGroupDetails,
  });
}

class VersionGroupDetailEntity {
  final int levelLearnedAt;
  final SpeciesEntity moveLearnMethod;
  final SpeciesEntity versionGroup;

  VersionGroupDetailEntity({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });
}

class OtherEntity {
  final DreamWorldEntity dreamWorld;
  final HomeEntity home;

  OtherEntity({
    required this.dreamWorld,
    required this.home,
  });
}

class HomeEntity {
  final String? frontDefault;
  final String? frontFemale;
  final String? frontShiny;
  final String? frontShinyFemale;

  HomeEntity({
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });
}

class DreamWorldEntity {
  final String? frontDefault;
  final String? frontFemale;
  DreamWorldEntity({
    required this.frontDefault,
    required this.frontFemale,
  });
}

class StatEntity {
  final int baseStat;
  final int effort;
  final SpeciesEntity stat;

  StatEntity({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });
}

class TypeEntity {
  final int slot;
  final SpeciesEntity type;

  TypeEntity({
    required this.slot,
    required this.type,
  });
}
