import 'package:care_tutors/app/general/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateTo();
  }

  void navigateTo() async {
    Box box = Hive.box<bool>('introShow');

    await Future.delayed(const Duration(seconds: 2)).then((_) {
      box.get("intro") == true
          ? context.go(AppRoutes.home)
          : context.go(AppRoutes.intro);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Center(
        child: Image.asset('images/logo.png'),
      ),
    );
  }
}
