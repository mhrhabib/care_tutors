

import '../../data/local/model/todo.dart';

abstract class GetTodoByIdUseCase {
  Future<Todo?> execute(String id);
}