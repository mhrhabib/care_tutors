import 'package:flutter/material.dart';

import 'general/router/router.dart';


class CareTutors extends StatelessWidget {
  const CareTutors({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}