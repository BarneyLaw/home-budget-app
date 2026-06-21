import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_budget_app/app/app.dart';
import 'package:home_budget_app/features/budget/application/budget_state.dart';

void main() {
  testWidgets('renders the Today dashboard', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          budgetStateProvider.overrideWith(
            (ref) => BudgetStateController.seeded(),
          ),
        ],
        child: const BudgetApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('PocketPulse'), findsOneWidget);
    expect(find.text('Safe to spend this week'), findsOneWidget);
    expect(find.text('Needs review'), findsOneWidget);
  });
}
