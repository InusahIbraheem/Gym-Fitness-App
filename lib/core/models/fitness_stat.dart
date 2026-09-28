class FitnessStat {
  const FitnessStat({
    required this.label,
    required this.value,
    required this.unit,
    required this.changePercent,
    required this.isPositive,
  });

  final String label;
  final String value;
  final String unit;
  final double changePercent;
  final bool isPositive;
}

class WeeklyProgress {
  const WeeklyProgress({
    required this.day,
    required this.workoutMinutes,
    required this.caloriesBurned,
  });

  final String day;
  final double workoutMinutes;
  final double caloriesBurned;
}

class BodyMetric {
  const BodyMetric({
    required this.date,
    required this.weightKg,
    required this.bodyFatPercent,
  });

  final DateTime date;
  final double weightKg;
  final double bodyFatPercent;
}
