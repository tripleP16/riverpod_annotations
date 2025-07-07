import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todos_provider.g.dart';

enum FilterType {
  all('Todos'),
  invited('Invitados'),
  pending('No Invitados');

  final String name;

  const FilterType(this.name);
}

@riverpod
class TodoCurrentFilter extends _$TodoCurrentFilter {
  @override
  FilterType build() {
    return FilterType.all;
  }

  void changeCurrentFilter(FilterType type) {
    state = type;
  }
}
