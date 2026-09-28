class MembershipPlan {
  const MembershipPlan({
    required this.id,
    required this.name,
    required this.price,
    required this.billingCycle,
    required this.features,
    required this.isPopular,
  });

  final String id;
  final String name;
  final double price;
  final String billingCycle;
  final List<String> features;
  final bool isPopular;
}
