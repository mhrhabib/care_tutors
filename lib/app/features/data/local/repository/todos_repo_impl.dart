

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
  Future<void> deleteTodo(String id) async{
    var x = todosBox.values.firstWhere((element) => element.id == id);
    x.delete();
  }

  @override
  Future<Todo?> getTodoById(String id) async {
    final todos = await loadTodos();

    return todos.firstWhereOrNull((todo) => todo.id ==id);
    
  }

 

  @override
  Future<void> saveTodo(Todo todo)  async{
    
    final todos = await loadTodos();

    //finding the index 
    final index = todos.indexWhere((element) => element.id ==todo.id);

    //edit the todo if exists
    final existing = todos.firstWhereOrNull((t) => t.id == todo.id);

    if(existing != null){
      final newTodo = Todo(
        id: todo.id,
        title:  todo.title,
        description: todo.description,
        completed: todo.completed
      );

     

      await todosBox.putAt(index, newTodo);
      return;
    }else{
      //add the todo if it doesn't exist

    
      return files.write(todo);
    }

  }


  
}