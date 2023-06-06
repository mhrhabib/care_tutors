import '../../data/local/model/todo.dart';

abstract class GetTodosUseCase {
  Future<List<Todo>> execute();
}
