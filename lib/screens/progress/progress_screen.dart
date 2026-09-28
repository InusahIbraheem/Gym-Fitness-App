import 'package:flutter/material.dart';
import 'package:gym_fitness_ui/core/constants/app_constants.dart';
import 'package:gym_fitness_ui/core/services/mock_data_service.dart';
import 'package:gym_fitness_ui/core/utils/responsive_utils.dart';
import 'package:gym_fitness_ui/core/widgets/app_scaffold.dart';
import 'package:gym_fitness_ui/core/widgets/progress_chart.dart';
import 'package:gym_fitness_ui/core/widgets/section_header.dart';
import 'package:gym_fitness_ui/core/widgets/stat_card.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = MockDataService.instance;
    final metrics = data.bodyMetrics;
    final latest = metrics.last;
    final first = metrics.first;
    final weightChange = latest.weightKg - first.weightKg;
    final bodyFatChange = latest.bodyFatPercent - first.bodyFatPercent;

    return AppScaffold(
      showFooter: false,
      title: 'Progress',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Your Journey',
            subtitle: 'Track body metrics and workout consistency',
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: ResponsiveUtils.isMobile(context) ? 2 : 4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.3,
            children: [
              _MetricTile(
                label: 'Current Weight',
                value: '${latest.weightKg} kg',
                change: '${weightChange.toStringAsFixed(1)} kg',
                isPositive: weightChange <= 0,
              ),
              _MetricTile(
                label: 'Body Fat',
                value: '${latest.bodyFatPercent}%',
                change: '${bodyFatChange.toStringAsFixed(1)}%',
                isPositive: bodyFatChange <= 0,
              ),
              _MetricTile(
                label: 'Weekly Goal',
                value: '${AppConstants.weeklyWorkoutGoal}',
                change: 'sessions',
                isPositive: true,
              ),
              _MetricTile(
                label: 'Steps Today',
                value: '8,432',
                change: 'of ${AppConstants.dailyStepGoal}',
                isPositive: true,
              ),
            ],
          ),
          const SizedBox(height: 16),
          BodyMetricLineChart(metrics: metrics),
          const SizedBox(height: 16),
          WeeklyProgressChart(data: data.weeklyProgress),
          const SizedBox(height: 16),
          WeeklyProgressChart(
            data: data.weeklyProgress,
            showCalories: true,
          ),
          const SizedBox(height: 16),
          const SectionHeader(title: 'Monthly Highlights'),
          ...data.dashboardStats.take(2).toList().asMap().entries.map(
                (entry) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: StatCard(
                    stat: entry.value,
                    icon: entry.key == 0
                        ? Icons.fitness_center
                        : Icons.local_fire_department,
                    delay: Duration(milliseconds: 100 * entry.key),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({
    required this.label,
    required this.value,
    required this.change,
    required this.isPositive,
  });

  final String label;
  final String value;
  final String change;
  final bool isPositive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              change,
              style: theme.textTheme.labelSmall?.copyWith(
                color: isPositive ? Colors.green : Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
