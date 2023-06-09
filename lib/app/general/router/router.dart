import 'package:care_tutors/app/features/presentation/view/home/home_view.dart';
import 'package:care_tutors/app/features/presentation/view/intro/intro_screen.dart';
import 'package:care_tutors/app/features/presentation/view/splash/splash_screen.dart';
import 'package:care_tutors/app/general/router/app_routes.dart';
import 'package:go_router/go_router.dart';

import '../../features/presentation/view/home/todos_edit.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.intro,
      builder: (context, state) => const IntroScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'new',
          builder: (context, state) => const TodosEdit(),
        ),
        GoRoute(
          path: ':id',
          builder: (context, state) => TodosEdit(todoId: state.pathParameters['id']),
        ),
      ],
    ),
  ],
);
