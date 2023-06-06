import 'package:care_tutors/app/general/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../viewModel/module.dart';
import 'widgets/todo_tile.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosListState);
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.push('${AppRoutes.home}/new');
            },
            icon: const Icon(Icons.add),
            tooltip: 'Add Todo',
          )
        ],
      ),

      body: ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      final todo = todos[index];
                      return TodoTile(todo: todo, index: index,);
                    },
                  ),
    );
  }
}