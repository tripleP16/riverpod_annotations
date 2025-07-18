import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotations/config/router/app_router.dart';
import 'package:riverpod_annotations/config/theme/app_theme.dart';
import 'package:riverpod_annotations/presentation/providers/state_providers.dart';

void main() => runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routes = ref.watch(appRouterProvider);
    final darkTheme = ref.watch(darkModeProvider);
    return MaterialApp.router(
      title: 'Riverpod Providers',
      debugShowCheckedModeBanner: false,
      routerConfig: routes,
      theme: AppTheme(isDarkmode: darkTheme).getTheme(),
    );
  }
}
