import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gym_fitness_ui/core/constants/app_constants.dart';
import 'package:gym_fitness_ui/core/models/diet.dart';
import 'package:gym_fitness_ui/core/services/mock_data_service.dart';
import 'package:gym_fitness_ui/core/widgets/app_scaffold.dart';
import 'package:gym_fitness_ui/core/widgets/progress_chart.dart';
import 'package:gym_fitness_ui/core/widgets/section_header.dart';

class CaloriesScreen extends StatelessWidget {
  const CaloriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final entries = MockDataService.instance.calorieEntries;
    final consumed = entries.fold<int>(0, (sum, e) => sum + e.calories);
    final totalProtein = entries.fold<int>(0, (sum, e) => sum + e.protein);
    final totalCarbs = entries.fold<int>(0, (sum, e) => sum + e.carbs);
    final totalFats = entries.fold<int>(0, (sum, e) => sum + e.fats);

    return AppScaffold(
      title: 'Calories',
      showBackButton: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Daily Intake',
            subtitle: 'Track your calorie and macro consumption',
          ),
          CalorieDonutChart(
            consumed: consumed,
            goal: AppConstants.dailyCalorieGoal,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _MacroCard(label: 'Protein', value: '${totalProtein}g', color: Colors.blue),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _MacroCard(label: 'Carbs', value: '${totalCarbs}g', color: Colors.orange),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _MacroCard(label: 'Fats', value: '${totalFats}g', color: Colors.purple),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const SectionHeader(title: 'Today\'s Meals'),
          ...entries.asMap().entries.map(
                (entry) => _MealTile(entry: entry.value, index: entry.key),
              ),
        ],
      ),
    );
  }
}

class _MacroCard extends StatelessWidget {
  const _MacroCard({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _MealTile extends StatelessWidget {
  const _MealTile({required this.entry, required this.index});

  final CalorieEntry entry;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${entry.calories}'),
        ),
        title: Text(entry.meal),
        subtitle: Text(
          'P: ${entry.protein}g • C: ${entry.carbs}g • F: ${entry.fats}g',
        ),
        trailing: Text(entry.time),
      ),
    )
        .animate()
        .fadeIn(delay: Duration(milliseconds: 80 * index));
  }
}
