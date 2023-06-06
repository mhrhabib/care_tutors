import '../../data/local/model/todo.dart';
import '../repository/todos_repository.dart';
import 'get_todos.dart';

class GetTodosUseCaseImpl extends GetTodosUseCase {
  GetTodosUseCaseImpl(this.todosRepository);
  final TodosRepository todosRepository;

  @override
  Future<List<Todo>> execute() => todosRepository.loadTodos();
}
