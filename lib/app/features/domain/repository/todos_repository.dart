

import '../../data/local/model/todo.dart';
import '../../data/local/model/todos.dart';

abstract class TodosRepository {
  Future<List<Todos>> loadTodos();

  Future<void> saveTodo(Todos todo);

  Future<void> deleteTodo(int i);

  Future<Todo?> getTodoById(String id);

 
}
