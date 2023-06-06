

import '../../data/local/model/todo.dart';

abstract class TodosRepository {
  Future<List<Todo>> loadTodos();

  Future<void> saveTodo(Todo todo);

  Future<void> deleteTodo(String id);

  Future<Todo?> getTodoById(String id);

 
}
