import 'package:care_tutors/app/features/data/local/repository/todos_repo_impl.dart';
import 'package:care_tutors/app/features/data/local/source/module.dart';
import 'package:care_tutors/app/features/domain/repository/todos_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todosProvider = Provider<TodosRepository>(
  (ref) => TodosRepoImpl(ref.read(filesProvider)),
);
