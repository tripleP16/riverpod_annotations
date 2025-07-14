import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_annotations/config/config.dart';

part 'future_providers.g.dart';

@Riverpod(keepAlive: true)
Future<String> pokemonName(Ref ref) async {
  final pokemonInformation = await PokemonInformation.getPokemonName(1);
  ref.onDispose(() {
    print('estamos a punto de eliminar este provider');
  });
  return pokemonInformation;
}
