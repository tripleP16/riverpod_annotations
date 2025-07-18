import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotations/presentation/providers/future_providers.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonName = ref.watch(pokemonNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
        child: pokemonName.when(
          data: (data) => Text(data),
          error: (error, stackStrace) => Text('$error'),
          loading: () => const CircularProgressIndicator.adaptive(),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 20,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).nextPokemon();
            },
          ),
          FloatingActionButton(
            child: const Icon(Icons.delete),
            onPressed: () {
              ref.read(pokemonIdProvider.notifier).previousPokemon();
            },
          ),
        ],
      ),
    );
  }
}
