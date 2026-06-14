import 'budget_plan.dart';

abstract interface class BudgetRepository {
  Stream<BudgetPlan> watchActivePlan();

  Future<void> savePlan(BudgetPlan plan);
}
