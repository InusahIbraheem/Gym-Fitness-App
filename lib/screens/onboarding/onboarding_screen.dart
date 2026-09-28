import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_routes.dart';
import '../../core/services/auth_service.dart';
import '../../widgets/three_d_card.dart';
import '../../widgets/developer_footer.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'title': '3D Kinetic Training',
      'subtitle': 'Dynamic 3D exercise mechanics, precision rep tracking, and AI-powered posture analysis.',
      'icon': Icons.fitness_center_rounded,
      'gradient': const LinearGradient(
        colors: [Color(0xFFFF007F), Color(0xFFFF5E3A)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    },
    {
      'title': 'Live Biometric Matrix',
      'subtitle': 'Real-time heart rate zones, recovery heatmaps, and adaptive metabolic calorie burn logging.',
      'icon': Icons.bolt_rounded,
      'gradient': const LinearGradient(
        colors: [Color(0xFF00F2FE), Color(0xFF4FACFE)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    },
    {
      'title': 'Elite Trainer Sessions',
      'subtitle': '1-on-1 certified master coaching, custom nutrition plans, and smart workout schedule auto-sync.',
      'icon': Icons.military_tech_rounded,
      'gradient': const LinearGradient(
        colors: [Color(0xFF8E2DE2), Color(0xFFF000FF)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C0D14),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF007F).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFFF007F).withValues(alpha: 0.3)),
                        ),
                        child: const Icon(Icons.fitness_center_rounded, color: Color(0xFFFF007F), size: 22),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'NovaFit 3D',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      AuthService.instance.completeOnboarding();
                      context.go(AppRoutes.dashboard);
                    },
                    child: const Text('Skip', style: TextStyle(color: Color(0xFFFF007F), fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ThreeDCard(
                          tiltX: -8.0,
                          tiltY: 10.0,
                          elevation: 28,
                          borderRadius: 32,
                          gradient: page['gradient'] as Gradient,
                          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 32),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(22),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.2),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white.withValues(alpha: 0.4), width: 2),
                                ),
                                child: Icon(page['icon'] as IconData, size: 56, color: Colors.white),
                              ),
                              const SizedBox(height: 22),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.black.withValues(alpha: 0.3),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.auto_awesome, size: 14, color: Colors.amberAccent),
                                    SizedBox(width: 6),
                                    Text('3D FITNESS SUITE', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 36),
                        Text(
                          page['title'] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          page['subtitle'] as String,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.7),
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == i ? 28 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == i ? const Color(0xFFFF007F) : Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: FilledButton(
                  onPressed: () {
                    if (_currentPage < _pages.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      AuthService.instance.completeOnboarding();
                      context.go(AppRoutes.dashboard);
                    }
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFFFF007F),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: Text(
                    _currentPage == _pages.length - 1 ? 'Start Training' : 'Next',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const DeveloperFooter(compact: true),
          ],
        ),
      ),
    );
  }
}
