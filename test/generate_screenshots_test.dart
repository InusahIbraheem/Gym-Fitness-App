import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:gym_fitness_ui/core/theme/app_theme.dart';
import 'package:gym_fitness_ui/screens/onboarding/onboarding_screen.dart';
import 'package:gym_fitness_ui/screens/login/login_screen.dart';
import 'package:gym_fitness_ui/screens/dashboard/dashboard_screen.dart';
import 'package:gym_fitness_ui/screens/workout_plans/workout_plans_screen.dart';
import 'package:gym_fitness_ui/screens/exercises/exercises_screen.dart';
import 'package:gym_fitness_ui/screens/progress/progress_screen.dart';
import 'package:gym_fitness_ui/screens/calories/calories_screen.dart';
import 'package:gym_fitness_ui/screens/diet/diet_screen.dart';
import 'package:gym_fitness_ui/screens/schedule/schedule_screen.dart';
import 'package:gym_fitness_ui/screens/trainer/trainer_screen.dart';
import 'package:gym_fitness_ui/screens/membership/membership_screen.dart';
import 'package:gym_fitness_ui/screens/settings/settings_screen.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  testWidgets('Generate high-res screenshots for Gym Fitness UI App', (tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.0;

    final screens = <String, Widget>{
      '01_onboarding': const OnboardingScreen(),
      '02_login': const LoginScreen(),
      '03_dashboard': const DashboardScreen(),
      '04_workout_plans': const WorkoutPlansScreen(),
      '05_exercises': const ExercisesScreen(),
      '06_progress': const ProgressScreen(),
      '07_calories': const CaloriesScreen(),
      '08_diet': const DietScreen(),
      '09_schedule': const ScheduleScreen(),
      '10_trainer': const TrainerScreen(),
      '11_membership': const MembershipScreen(),
      '12_settings': const SettingsScreen(),
    };

    final dir = Directory('screenshots');
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }

    for (final entry in screens.entries) {
      final repaintBoundaryKey = GlobalKey();
      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          home: RepaintBoundary(
            key: repaintBoundaryKey,
            child: entry.value,
          ),
        ),
      );

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      final boundary = repaintBoundaryKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary != null) {
        await tester.runAsync(() async {
          final image = await boundary.toImage(pixelRatio: 2.0);
          final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
          if (byteData != null) {
            final pngBytes = byteData.buffer.asUint8List();
            final file = File('screenshots/${entry.key}.png');
            await file.writeAsBytes(pngBytes);
            // ignore: avoid_print
            print('Saved screenshot: screenshots/${entry.key}.png (${pngBytes.length} bytes)');
          }
        });
      }
    }
  });
}
