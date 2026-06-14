import '../../../core/money/money.dart';

enum BudgetMode { simple, category, envelope }

class CategoryBudget {
  const CategoryBudget({
    required this.categoryId,
    required this.limit,
  });

  final String categoryId;
  final Money limit;
}

class BudgetPlan {
  const BudgetPlan({
    required this.id,
    required this.mode,
    required this.monthlyLimit,
    required this.savingsGoal,
    required this.cashBuffer,
    required this.fixedBills,
    required this.categoryBudgets,
    required this.periodStart,
    required this.periodEnd,
  });

  final String id;
  final BudgetMode mode;
  final Money monthlyLimit;
  final Money savingsGoal;
  final Money cashBuffer;
  final Money fixedBills;
  final List<CategoryBudget> categoryBudgets;
  final DateTime periodStart;
  final DateTime periodEnd;
}
