class Exercise {
  const Exercise({
    required this.id,
    required this.name,
    required this.muscleGroup,
    required this.equipment,
    required this.sets,
    required this.reps,
    required this.durationMinutes,
    required this.caloriesPerSession,
  });

  final String id;
  final String name;
  final String muscleGroup;
  final String equipment;
  final int sets;
  final int reps;
  final int durationMinutes;
  final int caloriesPerSession;
}
