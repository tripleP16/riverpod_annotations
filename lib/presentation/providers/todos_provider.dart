import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_annotations/config/helpers/random_generator.dart';
import 'package:riverpod_annotations/domain/domain.dart';
import 'package:uuid/uuid.dart';

part 'todos_provider.g.dart';

enum FilterType {
  all('Todos'),
  invited('Invitados'),
  pending('No Invitados');

  final String name;

  const FilterType(this.name);
}

const uuid = Uuid();

@Riverpod(keepAlive: true)
class TodoCurrentFilter extends _$TodoCurrentFilter {
  @override
  FilterType build() {
    return FilterType.all;
  }

  void changeCurrentFilter(FilterType type) {
    state = type;
  }
}

@Riverpod(keepAlive: true)
class Todos extends _$Todos {
  @override
  List<Todo> build() {
    return [
      Todo(
          id: uuid.v4(),
          description: RandomGenerator.getRandomName(),
          completedAt: null),
      Todo(
          id: uuid.v4(),
          description: RandomGenerator.getRandomName(),
          completedAt: null),
      Todo(
          id: uuid.v4(),
          description: RandomGenerator.getRandomName(),
          completedAt: null),
      Todo(
          id: uuid.v4(),
          description: RandomGenerator.getRandomName(),
          completedAt: null),
      Todo(
          id: uuid.v4(),
          description: RandomGenerator.getRandomName(),
          completedAt: DateTime.now()),
      Todo(
          id: uuid.v4(),
          description: RandomGenerator.getRandomName(),
          completedAt: DateTime.now()),
      Todo(
          id: uuid.v4(),
          description: RandomGenerator.getRandomName(),
          completedAt: DateTime.now()),
    ];
  }

  void addTodo() {
    final todo = Todo(
        id: uuid.v4(),
        description: RandomGenerator.getRandomName(),
        completedAt: null);

    state = [...state, todo];
  }

  void toggle({DateTime? completedAt, required String id}) {
    final index = state.indexWhere((e) => e.id == id);
    if (index == -1) return;
    final updated = state[index].copyWith(completedAt: completedAt);
    state = [
      ...state.sublist(0, index),
      updated,
      ...state.sublist(index + 1),
    ];
  }
}
