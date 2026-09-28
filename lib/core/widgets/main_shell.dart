import 'package:flutter/material.dart';
import 'package:gym_fitness_ui/core/constants/app_strings.dart';
import 'package:gym_fitness_ui/core/utils/responsive_utils.dart';
import 'package:gym_fitness_ui/core/widgets/app_footer.dart';
import 'package:go_router/go_router.dart';

class MainShell extends StatelessWidget {
  const MainShell({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  static const _destinations = [
    (icon: Icons.dashboard_outlined, selected: Icons.dashboard, label: AppStrings.dashboard),
    (icon: Icons.fitness_center_outlined, selected: Icons.fitness_center, label: AppStrings.workoutPlans),
    (icon: Icons.show_chart_outlined, selected: Icons.show_chart, label: AppStrings.progress),
    (icon: Icons.restaurant_outlined, selected: Icons.restaurant, label: AppStrings.diet),
    (icon: Icons.settings_outlined, selected: Icons.settings, label: AppStrings.settings),
  ];

  @override
  Widget build(BuildContext context) {
    final useRail = ResponsiveUtils.isDesktop(context) ||
        ResponsiveUtils.isTablet(context);

    if (useRail) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: navigationShell.goBranch,
              labelType: NavigationRailLabelType.all,
              destinations: _destinations
                  .map(
                    (d) => NavigationRailDestination(
                      icon: Icon(d.icon),
                      selectedIcon: Icon(d.selected),
                      label: Text(d.label),
                    ),
                  )
                  .toList(),
            ),
            const VerticalDivider(width: 1),
            Expanded(
              child: Column(
                children: [
                  Expanded(child: navigationShell),
                  const AppFooter(),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: navigationShell.goBranch,
            destinations: _destinations
                .map(
                  (d) => NavigationDestination(
                    icon: Icon(d.icon),
                    selectedIcon: Icon(d.selected),
                    label: d.label,
                  ),
                )
                .toList(),
          ),
          Container(
            width: double.infinity,
            color: Theme.of(context).colorScheme.surface,
            child: const AppFooter(),
          ),
        ],
      ),
    );
  }
}
