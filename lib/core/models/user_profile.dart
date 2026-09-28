class UserProfile {
  const UserProfile({
    required this.name,
    required this.email,
    required this.avatarInitials,
    required this.membershipTier,
    required this.joinDate,
  });

  final String name;
  final String email;
  final String avatarInitials;
  final String membershipTier;
  final DateTime joinDate;
}
