import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gym_fitness_ui/core/constants/app_routes.dart';
import 'package:gym_fitness_ui/core/constants/app_strings.dart';
import 'package:gym_fitness_ui/core/services/auth_service.dart';
import 'package:gym_fitness_ui/core/services/mock_data_service.dart';
import 'package:gym_fitness_ui/core/widgets/app_scaffold.dart';
import 'package:gym_fitness_ui/core/widgets/section_header.dart';
import 'package:intl/intl.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = MockDataService.instance.userProfile;
    final theme = Theme.of(context);

    return AppScaffold(
      showFooter: false,
      title: 'Settings',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: theme.colorScheme.primaryContainer,
                child: Text(
                  user.avatarInitials,
                  style: TextStyle(color: theme.colorScheme.onPrimaryContainer),
                ),
              ),
              title: Text(user.name),
              subtitle: Text(user.email),
              trailing: const Icon(Icons.edit_outlined),
            ),
          ),
          const SizedBox(height: 16),
          const SectionHeader(title: 'Preferences'),
          _SettingsTile(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            subtitle: 'Workout reminders and updates',
            onTap: () {},
          ),
          _SettingsTile(
            icon: Icons.dark_mode_outlined,
            title: 'Appearance',
            subtitle: 'Theme and display settings',
            onTap: () {},
          ),
          _SettingsTile(
            icon: Icons.language_outlined,
            title: 'Language',
            subtitle: 'English (US)',
            onTap: () {},
          ),
          const SectionHeader(title: 'Account'),
          _SettingsTile(
            icon: Icons.card_membership,
            title: AppStrings.membership,
            subtitle: '${user.membershipTier} • Since ${DateFormat.yMMMd().format(user.joinDate)}',
            onTap: () => context.push(AppRoutes.membership),
          ),
          _SettingsTile(
            icon: Icons.person_outline,
            title: AppStrings.trainer,
            subtitle: 'Manage your trainer connection',
            onTap: () => context.push(AppRoutes.trainer),
          ),
          _SettingsTile(
            icon: Icons.calendar_month_outlined,
            title: AppStrings.schedule,
            subtitle: 'View and manage sessions',
            onTap: () => context.push(AppRoutes.schedule),
          ),
          const SectionHeader(title: 'Support'),
          _SettingsTile(
            icon: Icons.help_outline,
            title: 'Help Center',
            subtitle: 'FAQs and contact support',
            onTap: () {},
          ),
          _SettingsTile(
            icon: Icons.info_outline,
            title: 'About',
            subtitle: 'Gym Fitness UI v1.0.0',
            onTap: () {},
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                AuthService.instance.signOut();
                context.go(AppRoutes.login);
              },
              icon: const Icon(Icons.logout),
              label: const Text(AppStrings.signOut),
              style: OutlinedButton.styleFrom(
                foregroundColor: theme.colorScheme.error,
                side: BorderSide(color: theme.colorScheme.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
