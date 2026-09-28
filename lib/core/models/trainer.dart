class Trainer {
  const Trainer({
    required this.id,
    required this.name,
    required this.specialty,
    required this.experienceYears,
    required this.rating,
    required this.sessionsCompleted,
    required this.availability,
    required this.bio,
  });

  final String id;
  final String name;
  final String specialty;
  final int experienceYears;
  final double rating;
  final int sessionsCompleted;
  final String availability;
  final String bio;
}
