class CalorieEntry {
  const CalorieEntry({
    required this.meal,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fats,
    required this.time,
  });

  final String meal;
  final int calories;
  final int protein;
  final int carbs;
  final int fats;
  final String time;
}

class DietPlan {
  const DietPlan({
    required this.id,
    required this.name,
    required this.description,
    required this.dailyCalories,
    required this.meals,
    required this.tags,
  });

  final String id;
  final String name;
  final String description;
  final int dailyCalories;
  final List<String> meals;
  final List<String> tags;
}
