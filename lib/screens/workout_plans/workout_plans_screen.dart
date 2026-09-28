import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gym_fitness_ui/core/models/workout_plan.dart';
import 'package:gym_fitness_ui/core/services/mock_data_service.dart';
import 'package:gym_fitness_ui/core/widgets/app_scaffold.dart';
import 'package:gym_fitness_ui/core/widgets/section_header.dart';

class WorkoutPlansScreen extends StatelessWidget {
  const WorkoutPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final plans = MockDataService.instance.workoutPlans;

    return AppScaffold(
      showFooter: false,
      title: 'Workout Plans',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Choose Your Plan',
            subtitle: 'Structured programs tailored to your goals',
          ),
          ...plans.asMap().entries.map(
                (entry) => _WorkoutPlanCard(
                  plan: entry.value,
                  index: entry.key,
                ),
              ),
        ],
      ),
    );
  }
}

class _WorkoutPlanCard extends StatelessWidget {
  const _WorkoutPlanCard({
    required this.plan,
    required this.index,
  });

  final WorkoutPlan plan;
  final int index;

  Color _difficultyColor(BuildContext context) {
    return switch (plan.difficulty) {
      'Beginner' => Colors.green,
      'Intermediate' => Colors.orange,
      'Advanced' => Colors.red,
      _ => Theme.of(context).colorScheme.primary,
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    plan.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: _difficultyColor(context).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    plan.difficulty,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: _difficultyColor(context),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              plan.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: [
                _InfoChip(icon: Icons.calendar_today, label: '${plan.durationWeeks} weeks'),
                _InfoChip(icon: Icons.repeat, label: '${plan.sessionsPerWeek}x/week'),
                _InfoChip(icon: Icons.category_outlined, label: plan.focusArea),
                _InfoChip(
                  icon: Icons.local_fire_department,
                  label: '${plan.caloriesBurn} kcal',
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('Start Plan'),
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(delay: Duration(milliseconds: 80 * index))
        .slideY(begin: 0.05, end: 0, delay: Duration(milliseconds: 80 * index));
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 4),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
