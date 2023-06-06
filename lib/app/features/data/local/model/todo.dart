
import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)

class Todo extends HiveObject {

    @HiveField(0)
    String? id;

    @HiveField(1)
    String? title;

    @HiveField(2)
    String? description;

    @HiveField(3)
    bool? completed = false;

    Todo({ this.id,  this.title,  this.description, this.completed,});
}