import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_fitness_ui/core/constants/app_routes.dart';
import 'package:gym_fitness_ui/core/services/auth_service.dart';
import 'package:gym_fitness_ui/core/widgets/main_shell.dart';
import 'package:gym_fitness_ui/screens/calories/calories_screen.dart';
import 'package:gym_fitness_ui/screens/dashboard/dashboard_screen.dart';
import 'package:gym_fitness_ui/screens/diet/diet_screen.dart';
import 'package:gym_fitness_ui/screens/exercises/exercises_screen.dart';
import 'package:gym_fitness_ui/screens/login/login_screen.dart';
import 'package:gym_fitness_ui/screens/membership/membership_screen.dart';
import 'package:gym_fitness_ui/screens/onboarding/onboarding_screen.dart';
import 'package:gym_fitness_ui/screens/progress/progress_screen.dart';
import 'package:gym_fitness_ui/screens/schedule/schedule_screen.dart';
import 'package:gym_fitness_ui/screens/settings/settings_screen.dart';
import 'package:gym_fitness_ui/screens/trainer/trainer_screen.dart';
import 'package:gym_fitness_ui/screens/workout_plans/workout_plans_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorDashboardKey = GlobalKey<NavigatorState>(debugLabel: 'dashboard');
final _shellNavigatorWorkoutsKey = GlobalKey<NavigatorState>(debugLabel: 'workouts');
final _shellNavigatorProgressKey = GlobalKey<NavigatorState>(debugLabel: 'progress');
final _shellNavigatorDietKey = GlobalKey<NavigatorState>(debugLabel: 'diet');
final _shellNavigatorSettingsKey = GlobalKey<NavigatorState>(debugLabel: 'settings');

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.onboarding,
    redirect: (context, state) {
      final auth = AuthService.instance;
      final location = state.matchedLocation;
      final isOnboarding = location == AppRoutes.onboarding;
      final isLogin = location == AppRoutes.login;

      if (!auth.onboardingComplete && !isOnboarding) {
        return AppRoutes.onboarding;
      }

      if (auth.onboardingComplete && !auth.isAuthenticated) {
        if (!isLogin && !isOnboarding) {
          return AppRoutes.login;
        }
      }

      if (auth.isAuthenticated && (isOnboarding || isLogin)) {
        return AppRoutes.dashboard;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorDashboardKey,
            routes: [
              GoRoute(
                path: AppRoutes.dashboard,
                builder: (context, state) => const DashboardScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorWorkoutsKey,
            routes: [
              GoRoute(
                path: AppRoutes.workoutPlans,
                builder: (context, state) => const WorkoutPlansScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProgressKey,
            routes: [
              GoRoute(
                path: AppRoutes.progress,
                builder: (context, state) => const ProgressScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorDietKey,
            routes: [
              GoRoute(
                path: AppRoutes.diet,
                builder: (context, state) => const DietScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettingsKey,
            routes: [
              GoRoute(
                path: AppRoutes.settings,
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.exercises,
        builder: (context, state) => const ExercisesScreen(),
      ),
      GoRoute(
        path: AppRoutes.calories,
        builder: (context, state) => const CaloriesScreen(),
      ),
      GoRoute(
        path: AppRoutes.trainer,
        builder: (context, state) => const TrainerScreen(),
      ),
      GoRoute(
        path: AppRoutes.schedule,
        builder: (context, state) => const ScheduleScreen(),
      ),
      GoRoute(
        path: AppRoutes.membership,
        builder: (context, state) => const MembershipScreen(),
      ),
    ],
  );
}
