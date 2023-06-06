

import 'package:care_tutors/app/features/domain/useCases/get_todo_by_id.dart';

import '../../data/local/model/todo.dart';
import '../repository/todos_repository.dart';

class GetTodoByIdUseCaseImpl extends GetTodoByIdUseCase {
  GetTodoByIdUseCaseImpl(this.todosRepository);
  final TodosRepository todosRepository;

  @override
  Future<Todo?> execute(String id) => todosRepository.getTodoById(id);
}