import 'package:flutter_test/flutter_test.dart';
import 'package:gym_fitness_ui/main.dart';

void main() {
  testWidgets('App launches onboarding screen', (WidgetTester tester) async {
    await tester.pumpWidget(const GymApp());
    await tester.pumpAndSettle();

    expect(find.text('Transform Your Body'), findsOneWidget);
    expect(find.text('Developed by @inusah_ibraheem'), findsOneWidget);
  });
}

