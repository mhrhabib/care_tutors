
import '../model/todo.dart';

abstract class HiveFiles{

  Future<List<Todo>> read();

  Future<void> write(List<Todo> todos);

  Future<void> delete(int index);
}