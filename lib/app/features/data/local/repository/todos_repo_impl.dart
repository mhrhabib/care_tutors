

import 'package:care_tutors/app/features/data/local/model/todo.dart';
import 'package:care_tutors/app/features/data/local/source/hive_boxes.dart';
import 'package:care_tutors/app/features/data/local/source/hive_files.dart';
import 'package:care_tutors/app/features/domain/repository/todos_repository.dart';
import 'package:collection/collection.dart';
import 'package:hive/hive.dart';

class TodosRepoImpl extends TodosRepository{
  TodosRepoImpl(this.files);

  final HiveFiles files;

  Box<Todo> todosBox = Hive.box(HiveBoxes.todos);


   @override
  Future<List<Todo>> loadTodos() async{
      List<Todo> todos = [];

      if(todosBox.values.isNotEmpty){
        for(var todo in todosBox.values){
          todos.add(todo);
        }
      }
      return todos;
      
  }


  @override
  Future<void> deleteTodo(int i) async{
    return files.delete(i);
  }

  @override
  Future<Todo?> getTodoById(String id) async {
    final todos = await loadTodos();

    return todos.firstWhereOrNull((todo) => todo.id ==id);
    
  }

 

  @override
  Future<void> saveTodo(Todo todo)  async{
    
    final todos = await loadTodos();

    //edit the todo if exists
    final existing = todos.firstWhereOrNull((t) => t.id == todo.id);

    if(existing != null){
      final newTodo = Todo(
        title:  todo.title,
        description: todo.description,
        conpleted: todo.conpleted
      );

      final newTodos = todos.map((e) {
        return e.id == todo.id ? newTodo : e;
      }).toList();

      await files.write(newTodos);
      return;
    }else{
      //add the todo if it doesn't exist

     final newTodos = [...todos, todo];
      return files.write(newTodos);
    }

  }


  
}