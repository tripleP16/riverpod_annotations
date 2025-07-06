import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotations/presentation/providers/hello_world_provider.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Consumer(
        builder: (_, WidgetRef ref, __) {
          final name = ref.watch(helloWorldProvider);
          return Center(
            child: Text(name),
          );
        },
      ),
    );
  }
}
