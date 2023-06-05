import 'package:flutter/material.dart';
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
      Box box = Hive.box('introShow');


    await Future.delayed(const Duration(seconds: 2)).then((_) {
     
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
