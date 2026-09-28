class ScheduleItem {
  const ScheduleItem({
    required this.id,
    required this.title,
    required this.type,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.trainerName,
  });

  final String id;
  final String title;
  final String type;
  final DateTime startTime;
  final DateTime endTime;
  final String location;
  final String trainerName;
}
