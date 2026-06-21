import '../../../core/money/money.dart';

enum BudgetMode { simple, category, envelope }

class CategoryBudget {
  const CategoryBudget({
    required this.categoryId,
    required this.limit,
  });

  final String categoryId;
  final Money limit;

  CategoryBudget copyWith({
    String? categoryId,
    Money? limit,
  }) {
    return CategoryBudget(
      categoryId: categoryId ?? this.categoryId,
      limit: limit ?? this.limit,
    );
  }
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

  BudgetPlan copyWith({
    String? id,
    BudgetMode? mode,
    Money? monthlyLimit,
    Money? savingsGoal,
    Money? cashBuffer,
    Money? fixedBills,
    List<CategoryBudget>? categoryBudgets,
    DateTime? periodStart,
    DateTime? periodEnd,
  }) {
    return BudgetPlan(
      id: id ?? this.id,
      mode: mode ?? this.mode,
      monthlyLimit: monthlyLimit ?? this.monthlyLimit,
      savingsGoal: savingsGoal ?? this.savingsGoal,
      cashBuffer: cashBuffer ?? this.cashBuffer,
      fixedBills: fixedBills ?? this.fixedBills,
      categoryBudgets: categoryBudgets ?? this.categoryBudgets,
      periodStart: periodStart ?? this.periodStart,
      periodEnd: periodEnd ?? this.periodEnd,
    );
  }
}
