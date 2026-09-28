class WorkoutPlan {
  const WorkoutPlan({
    required this.id,
    required this.title,
    required this.description,
    required this.durationWeeks,
    required this.difficulty,
    required this.sessionsPerWeek,
    required this.focusArea,
    required this.caloriesBurn,
  });

  final String id;
  final String title;
  final String description;
  final int durationWeeks;
  final String difficulty;
  final int sessionsPerWeek;
  final String focusArea;
  final int caloriesBurn;
}
