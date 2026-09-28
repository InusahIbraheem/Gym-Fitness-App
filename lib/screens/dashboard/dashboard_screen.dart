import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_fitness_ui/core/constants/app_routes.dart';
import 'package:gym_fitness_ui/core/services/mock_data_service.dart';
import 'package:gym_fitness_ui/core/utils/responsive_utils.dart';
import 'package:gym_fitness_ui/core/widgets/app_scaffold.dart';
import 'package:gym_fitness_ui/core/widgets/progress_chart.dart';
import 'package:gym_fitness_ui/core/widgets/section_header.dart';
import 'package:gym_fitness_ui/core/widgets/stat_card.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = MockDataService.instance;
    final user = data.userProfile;
    final stats = data.dashboardStats;
    final icons = [
      Icons.fitness_center,
      Icons.local_fire_department,
      Icons.timer_outlined,
      Icons.monitor_weight_outlined,
    ];

    return AppScaffold(
      showFooter: false,
      title: 'Dashboard',
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {},
        ),
      ],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                child: Text(
                  user.avatarInitials,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, ${user.name.split(' ').first}!',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '${user.membershipTier} Member',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const SectionHeader(
            title: 'Fitness Statistics',
            subtitle: 'Your performance overview this month',
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: ResponsiveUtils.gridCrossAxisCount(context),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.1,
            ),
            itemCount: stats.length,
            itemBuilder: (context, index) => StatCard(
              stat: stats[index],
              icon: icons[index],
              delay: Duration(milliseconds: 100 * index),
            ),
          ),
          const SizedBox(height: 16),
          WeeklyProgressChart(data: data.weeklyProgress),
          const SizedBox(height: 16),
          const SectionHeader(title: 'Quick Actions'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _QuickActionChip(
                label: 'Exercises',
                icon: Icons.sports_gymnastics,
                onTap: () => context.push(AppRoutes.exercises),
              ),
              _QuickActionChip(
                label: 'Calories',
                icon: Icons.local_fire_department,
                onTap: () => context.push(AppRoutes.calories),
              ),
              _QuickActionChip(
                label: 'Trainer',
                icon: Icons.person,
                onTap: () => context.push(AppRoutes.trainer),
              ),
              _QuickActionChip(
                label: 'Schedule',
                icon: Icons.calendar_month,
                onTap: () => context.push(AppRoutes.schedule),
              ),
              _QuickActionChip(
                label: 'Membership',
                icon: Icons.card_membership,
                onTap: () => context.push(AppRoutes.membership),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(Icons.event),
              title: const Text('Next Session'),
              subtitle: Text(
                DateFormat('EEE, MMM d • h:mm a')
                    .format(data.scheduleItems.first.startTime),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push(AppRoutes.schedule),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionChip extends StatelessWidget {
  const _QuickActionChip({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
      onPressed: onTap,
    );
  }
}
