import 'package:flutter/material.dart';
import 'package:gym_fitness_ui/core/constants/app_constants.dart';

enum ScreenType { mobile, tablet, desktop }

class ResponsiveUtils {
  ResponsiveUtils._();

  static ScreenType screenType(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= AppConstants.desktopBreakpoint) {
      return ScreenType.desktop;
    }
    if (width >= AppConstants.tabletBreakpoint) {
      return ScreenType.tablet;
    }
    return ScreenType.mobile;
  }

  static bool isMobile(BuildContext context) =>
      screenType(context) == ScreenType.mobile;

  static bool isTablet(BuildContext context) =>
      screenType(context) == ScreenType.tablet;

  static bool isDesktop(BuildContext context) =>
      screenType(context) == ScreenType.desktop;

  static double horizontalPadding(BuildContext context) {
    return switch (screenType(context)) {
      ScreenType.mobile => 16,
      ScreenType.tablet => 24,
      ScreenType.desktop => 32,
    };
  }

  static int gridCrossAxisCount(BuildContext context) {
    return switch (screenType(context)) {
      ScreenType.mobile => 2,
      ScreenType.tablet => 3,
      ScreenType.desktop => 4,
    };
  }

  static double maxContentWidth(BuildContext context) {
    return switch (screenType(context)) {
      ScreenType.mobile => double.infinity,
      ScreenType.tablet => 720,
      ScreenType.desktop => 960,
    };
  }
}
