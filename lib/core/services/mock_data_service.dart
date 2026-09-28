import 'package:gym_fitness_ui/core/constants/app_constants.dart';
import 'package:gym_fitness_ui/core/models/diet.dart';
import 'package:gym_fitness_ui/core/models/exercise.dart';
import 'package:gym_fitness_ui/core/models/fitness_stat.dart';
import 'package:gym_fitness_ui/core/models/membership_plan.dart';
import 'package:gym_fitness_ui/core/models/schedule_item.dart';
import 'package:gym_fitness_ui/core/models/trainer.dart';
import 'package:gym_fitness_ui/core/models/user_profile.dart';
import 'package:gym_fitness_ui/core/models/workout_plan.dart';

class MockDataService {
  MockDataService._();

  static final MockDataService instance = MockDataService._();

  UserProfile get userProfile => UserProfile(
        name: AppConstants.defaultUserName,
        email: AppConstants.defaultUserEmail,
        avatarInitials: 'AJ',
        membershipTier: 'Premium',
        joinDate: DateTime(2024, 3, 15),
      );

  List<FitnessStat> get dashboardStats => const [
        FitnessStat(
          label: 'Workouts',
          value: '24',
          unit: 'this month',
          changePercent: 12.5,
          isPositive: true,
        ),
        FitnessStat(
          label: 'Calories Burned',
          value: '18,420',
          unit: 'kcal',
          changePercent: 8.2,
          isPositive: true,
        ),
        FitnessStat(
          label: 'Active Minutes',
          value: '1,240',
          unit: 'min',
          changePercent: 5.1,
          isPositive: true,
        ),
        FitnessStat(
          label: 'Weight',
          value: '72.5',
          unit: 'kg',
          changePercent: 2.3,
          isPositive: true,
        ),
      ];

  List<WeeklyProgress> get weeklyProgress => const [
        WeeklyProgress(day: 'Mon', workoutMinutes: 45, caloriesBurned: 320),
        WeeklyProgress(day: 'Tue', workoutMinutes: 30, caloriesBurned: 210),
        WeeklyProgress(day: 'Wed', workoutMinutes: 60, caloriesBurned: 480),
        WeeklyProgress(day: 'Thu', workoutMinutes: 0, caloriesBurned: 0),
        WeeklyProgress(day: 'Fri', workoutMinutes: 50, caloriesBurned: 390),
        WeeklyProgress(day: 'Sat', workoutMinutes: 75, caloriesBurned: 560),
        WeeklyProgress(day: 'Sun', workoutMinutes: 40, caloriesBurned: 280),
      ];

  List<BodyMetric> get bodyMetrics => [
        BodyMetric(
          date: DateTime(2026, 1, 1),
          weightKg: 75.2,
          bodyFatPercent: 18.5,
        ),
        BodyMetric(
          date: DateTime(2026, 2, 1),
          weightKg: 74.1,
          bodyFatPercent: 17.8,
        ),
        BodyMetric(
          date: DateTime(2026, 3, 1),
          weightKg: 73.4,
          bodyFatPercent: 17.2,
        ),
        BodyMetric(
          date: DateTime(2026, 4, 1),
          weightKg: 72.8,
          bodyFatPercent: 16.9,
        ),
        BodyMetric(
          date: DateTime(2026, 5, 1),
          weightKg: 72.5,
          bodyFatPercent: 16.5,
        ),
      ];

  List<WorkoutPlan> get workoutPlans => const [
        WorkoutPlan(
          id: 'wp1',
          title: 'Full Body Strength',
          description: 'Build muscle and strength with compound movements.',
          durationWeeks: 8,
          difficulty: 'Intermediate',
          sessionsPerWeek: 4,
          focusArea: 'Full Body',
          caloriesBurn: 450,
        ),
        WorkoutPlan(
          id: 'wp2',
          title: 'HIIT Fat Burner',
          description: 'High-intensity intervals for maximum calorie burn.',
          durationWeeks: 6,
          difficulty: 'Advanced',
          sessionsPerWeek: 5,
          focusArea: 'Cardio',
          caloriesBurn: 620,
        ),
        WorkoutPlan(
          id: 'wp3',
          title: 'Beginner Foundation',
          description: 'Learn proper form and build a fitness habit.',
          durationWeeks: 4,
          difficulty: 'Beginner',
          sessionsPerWeek: 3,
          focusArea: 'Foundation',
          caloriesBurn: 280,
        ),
        WorkoutPlan(
          id: 'wp4',
          title: 'Upper Body Sculpt',
          description: 'Target chest, back, shoulders, and arms.',
          durationWeeks: 6,
          difficulty: 'Intermediate',
          sessionsPerWeek: 4,
          focusArea: 'Upper Body',
          caloriesBurn: 380,
        ),
      ];

  List<Exercise> get exercises => const [
        Exercise(
          id: 'ex1',
          name: 'Barbell Squat',
          muscleGroup: 'Legs',
          equipment: 'Barbell',
          sets: 4,
          reps: 10,
          durationMinutes: 15,
          caloriesPerSession: 120,
        ),
        Exercise(
          id: 'ex2',
          name: 'Bench Press',
          muscleGroup: 'Chest',
          equipment: 'Barbell',
          sets: 4,
          reps: 8,
          durationMinutes: 12,
          caloriesPerSession: 95,
        ),
        Exercise(
          id: 'ex3',
          name: 'Deadlift',
          muscleGroup: 'Back',
          equipment: 'Barbell',
          sets: 3,
          reps: 6,
          durationMinutes: 15,
          caloriesPerSession: 130,
        ),
        Exercise(
          id: 'ex4',
          name: 'Pull-ups',
          muscleGroup: 'Back',
          equipment: 'Bodyweight',
          sets: 4,
          reps: 12,
          durationMinutes: 10,
          caloriesPerSession: 80,
        ),
        Exercise(
          id: 'ex5',
          name: 'Plank',
          muscleGroup: 'Core',
          equipment: 'Bodyweight',
          sets: 3,
          reps: 60,
          durationMinutes: 8,
          caloriesPerSession: 45,
        ),
        Exercise(
          id: 'ex6',
          name: 'Treadmill Run',
          muscleGroup: 'Cardio',
          equipment: 'Treadmill',
          sets: 1,
          reps: 1,
          durationMinutes: 30,
          caloriesPerSession: 280,
        ),
      ];

  List<CalorieEntry> get calorieEntries => const [
        CalorieEntry(
          meal: 'Breakfast',
          calories: 420,
          protein: 28,
          carbs: 45,
          fats: 14,
          time: '7:30 AM',
        ),
        CalorieEntry(
          meal: 'Lunch',
          calories: 650,
          protein: 42,
          carbs: 58,
          fats: 22,
          time: '12:45 PM',
        ),
        CalorieEntry(
          meal: 'Snack',
          calories: 180,
          protein: 8,
          carbs: 22,
          fats: 6,
          time: '3:30 PM',
        ),
        CalorieEntry(
          meal: 'Dinner',
          calories: 580,
          protein: 38,
          carbs: 48,
          fats: 20,
          time: '7:00 PM',
        ),
      ];

  List<DietPlan> get dietPlans => const [
        DietPlan(
          id: 'dp1',
          name: 'Muscle Gain',
          description: 'High protein plan to support muscle growth.',
          dailyCalories: 2800,
          meals: ['Protein Oats', 'Chicken Rice Bowl', 'Greek Yogurt', 'Salmon & Veggies'],
          tags: ['High Protein', 'Balanced'],
        ),
        DietPlan(
          id: 'dp2',
          name: 'Weight Loss',
          description: 'Calorie-controlled meals for sustainable fat loss.',
          dailyCalories: 1800,
          meals: ['Egg White Omelette', 'Grilled Salad', 'Protein Shake', 'Lean Stir Fry'],
          tags: ['Low Calorie', 'High Fiber'],
        ),
        DietPlan(
          id: 'dp3',
          name: 'Performance Fuel',
          description: 'Optimized macros for athletic performance.',
          dailyCalories: 2400,
          meals: ['Overnight Oats', 'Turkey Wrap', 'Trail Mix', 'Pasta & Chicken'],
          tags: ['Endurance', 'Recovery'],
        ),
      ];

  Trainer get primaryTrainer => const Trainer(
        id: 'tr1',
        name: 'Marcus Reed',
        specialty: 'Strength & Conditioning',
        experienceYears: 8,
        rating: 4.9,
        sessionsCompleted: 1240,
        availability: 'Mon – Sat, 6 AM – 8 PM',
        bio:
            'Certified personal trainer specializing in strength training, mobility, and sport-specific conditioning. Passionate about helping clients build sustainable habits.',
      );

  List<ScheduleItem> get scheduleItems => [
        ScheduleItem(
          id: 's1',
          title: 'Upper Body Strength',
          type: 'Workout',
          startTime: DateTime(2026, 6, 30, 7, 0),
          endTime: DateTime(2026, 6, 30, 8, 0),
          location: 'Main Gym Floor',
          trainerName: 'Marcus Reed',
        ),
        ScheduleItem(
          id: 's2',
          title: 'HIIT Cardio Session',
          type: 'Class',
          startTime: DateTime(2026, 6, 30, 12, 0),
          endTime: DateTime(2026, 6, 30, 12, 45),
          location: 'Studio B',
          trainerName: 'Sarah Chen',
        ),
        ScheduleItem(
          id: 's3',
          title: 'Personal Training',
          type: 'PT Session',
          startTime: DateTime(2026, 7, 1, 17, 30),
          endTime: DateTime(2026, 7, 1, 18, 30),
          location: 'Training Room 2',
          trainerName: 'Marcus Reed',
        ),
        ScheduleItem(
          id: 's4',
          title: 'Yoga Recovery',
          type: 'Class',
          startTime: DateTime(2026, 7, 2, 9, 0),
          endTime: DateTime(2026, 7, 2, 10, 0),
          location: 'Studio A',
          trainerName: 'Emily Park',
        ),
      ];

  List<MembershipPlan> get membershipPlans => const [
        MembershipPlan(
          id: 'mp1',
          name: 'Basic',
          price: 29.99,
          billingCycle: 'month',
          features: [
            'Gym floor access',
            'Locker room',
            'Basic equipment',
          ],
          isPopular: false,
        ),
        MembershipPlan(
          id: 'mp2',
          name: 'Premium',
          price: 49.99,
          billingCycle: 'month',
          features: [
            'All Basic features',
            'Group classes',
            'Sauna & spa',
            'Nutrition guide',
          ],
          isPopular: true,
        ),
        MembershipPlan(
          id: 'mp3',
          name: 'Elite',
          price: 79.99,
          billingCycle: 'month',
          features: [
            'All Premium features',
            'Personal training (4/mo)',
            'Priority booking',
            'Recovery lounge',
          ],
          isPopular: false,
        ),
      ];
}
