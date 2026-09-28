import 'package:flutter/material.dart';
import 'package:gym_fitness_ui/core/utils/responsive_utils.dart';
import 'package:gym_fitness_ui/core/widgets/app_footer.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.floatingActionButton,
    this.showBackButton = false,
    this.showFooter = true,
  });

  final String title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final bool showBackButton;
  final bool showFooter;

  @override
  Widget build(BuildContext context) {
    final padding = ResponsiveUtils.horizontalPadding(context);
    final maxWidth = ResponsiveUtils.maxContentWidth(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        automaticallyImplyLeading: showBackButton,
        actions: actions,
      ),
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(padding, 8, padding, 0),
                  sliver: SliverToBoxAdapter(child: body),
                ),
                if (showFooter) const SliverToBoxAdapter(child: AppFooter()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
