import 'package:care_tutors/app/features/presentation/viewModel/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../general/router/app_routes.dart';
import '../../../../data/local/model/todo.dart';



class TodoTile extends ConsumerWidget {
  const TodoTile({super.key, required this.todo, this.index});

  final Todo todo;
  final int? index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(todo.title!),
      subtitle: todo.description != null && todo.description!.isNotEmpty
          ? Text(todo.description!)
          : null,
      onTap: () {
        context.push('${AppRoutes.home}/${todo.id}', extra: index);
      },
      trailing: Checkbox(
        value: todo.completed,
        onChanged: (value) {
          if (value != null) {
            // final newTodo = Todo(completed: value);
            // ref.read(todosListState.notifier).save(newTodo);
          }
        },
      ),
    );
  }
}
