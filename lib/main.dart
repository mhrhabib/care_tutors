import 'package:care_tutors/app/app.dart';
import 'package:care_tutors/app/features/data/local/source/hive_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/features/data/local/model/todo.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<bool>('introShow');
  await Hive.openBox<Todo>(HiveBoxes.todos);
  runApp(
    const ProviderScope(
      child: CareTutors(),
    ),
  );
}
