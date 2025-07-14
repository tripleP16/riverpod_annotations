import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_annotations/config/config.dart';

part 'future_providers.g.dart';

@Riverpod(keepAlive: true)
Future<String> pokemonName(Ref ref) async {
  final id = ref.watch(pokemonIdProvider);
  final pokemonInformation = await PokemonInformation.getPokemonName(id);
  ref.onDispose(() {
    print('estamos a punto de eliminar este provider');
  });
  return pokemonInformation;
}

@Riverpod(keepAlive: true)
class PokemonId extends _$PokemonId {
  @override
  int build() {
    return 1;
  }

  void nextPokemon() => state++;

  void previousPokemon() => state > 1 ? state-- : state;
}
