import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gym_fitness_ui/core/models/exercise.dart';
import 'package:gym_fitness_ui/core/services/mock_data_service.dart';
import 'package:gym_fitness_ui/core/widgets/app_scaffold.dart';
import 'package:gym_fitness_ui/core/widgets/section_header.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  String _selectedFilter = 'All';
  final _exercises = MockDataService.instance.exercises;

  List<Exercise> get _filteredExercises {
    if (_selectedFilter == 'All') return _exercises;
    return _exercises.where((e) => e.muscleGroup == _selectedFilter).toList();
  }

  List<String> get _muscleGroups => [
        'All',
        ..._exercises.map((e) => e.muscleGroup).toSet(),
      ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Exercises',
      showBackButton: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Exercise Library',
            subtitle: 'Browse exercises by muscle group',
          ),
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _muscleGroups.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final group = _muscleGroups[index];
                final isSelected = group == _selectedFilter;
                return FilterChip(
                  label: Text(group),
                  selected: isSelected,
                  onSelected: (_) => setState(() => _selectedFilter = group),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          ..._filteredExercises.asMap().entries.map(
                (entry) => _ExerciseTile(
                  exercise: entry.value,
                  index: entry.key,
                ),
              ),
        ],
      ),
    );
  }
}

class _ExerciseTile extends StatelessWidget {
  const _ExerciseTile({
    required this.exercise,
    required this.index,
  });

  final Exercise exercise;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primaryContainer,
          child: Icon(
            Icons.fitness_center,
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
        title: Text(
          exercise.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          '${exercise.muscleGroup} • ${exercise.equipment} • ${exercise.sets}x${exercise.reps}',
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '${exercise.durationMinutes} min',
              style: theme.textTheme.labelMedium,
            ),
            Text(
              '${exercise.caloriesPerSession} kcal',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(delay: Duration(milliseconds: 60 * index))
        .slideX(begin: 0.05, end: 0, delay: Duration(milliseconds: 60 * index));
  }
}
