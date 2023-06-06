import 'package:care_tutors/app/features/data/local/source/hive_boxes.dart';
import 'package:care_tutors/app/features/data/local/source/hive_files.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/todo.dart';


class HiveFilesImpl extends HiveFiles{

  Box<Todo> todoListBox = Hive.box(HiveBoxes.todos);

  @override
  Future<void> delete(int id) async{
    var todo = todoListBox.getAt(id);
    todo!.delete();
    
  }

  @override
  Future<List<Todo>> read() async {
    return todoListBox.values as List<Todo>;
  }

  @override
  Future<void> write(Todo todos) async {
    todoListBox.add(todos);
  }


  
}