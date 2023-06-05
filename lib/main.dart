import 'package:care_tutors/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<bool>('introShow');
  runApp(
    const ProviderScope(
      child: CareTutors(),
    ),
  );
}
