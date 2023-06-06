import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local/model/todo.dart';
import '../../domain/useCases/module.dart';

class TodosStateNotifier extends StateNotifier<List<Todo>> {
  TodosStateNotifier(this.ref) : super([]) {
    loadTodos();
  }

  final Ref ref;
  late final getTodos = ref.read(getTodosProvider);

  Future<void> loadTodos() async {
    state = await getTodos.execute();
  }

  Future<void> save(Todo todo) async {
    await ref.read(saveTodoProvider).execute(todo);
    await loadTodos();
  }

  Future<Todo?> get(String id) async {
    return await ref.read(getTodoProvider).execute(id);
  }

  Future<void> delete(String id) async {
    await ref.read(deleteTodoProvider).execute(id);
    await loadTodos();
  }
}

final todosListState = StateNotifierProvider<TodosStateNotifier, List<Todo>>(
  (ref) => TodosStateNotifier(ref),
);