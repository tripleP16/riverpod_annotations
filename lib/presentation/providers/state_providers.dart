import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state_providers.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    return 5;
  }

  void add() {
    state += 1;
  }
}

@riverpod
class DarkMode extends _$DarkMode {
  @override
  bool build() {
    return false;
  }

  void toggleDarkMode() {
    state = !state;
  }
}

@riverpod
class Username extends _$Username {
  @override
  String build() {
    return 'Pablo P';
  }

  void changeName(String name) {
    state = name;
  }
}
