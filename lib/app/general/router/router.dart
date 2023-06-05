import 'package:care_tutors/app/features/presentation/view/splash/splash_screen.dart';
import 'package:care_tutors/app/general/router/app_routes.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => SplashScreen(),
    ),
  ],
);
