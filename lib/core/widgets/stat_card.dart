import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gym_fitness_ui/core/models/fitness_stat.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.stat,
    required this.icon,
    this.delay = Duration.zero,
  });

  final FitnessStat stat;
  final IconData icon;
  final Duration delay;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final changeColor = stat.isPositive ? Colors.green : Colors.red;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: theme.colorScheme.primary, size: 22),
                const Spacer(),
                Icon(
                  stat.isPositive ? Icons.trending_up : Icons.trending_down,
                  size: 16,
                  color: changeColor,
                ),
                const SizedBox(width: 4),
                Text(
                  '${stat.changePercent.toStringAsFixed(1)}%',
                  style: theme.textTheme.labelSmall?.copyWith(color: changeColor),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              stat.value,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              stat.label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              stat.unit,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 400.ms, delay: delay)
        .slideY(begin: 0.1, end: 0, duration: 400.ms, delay: delay);
  }
}
