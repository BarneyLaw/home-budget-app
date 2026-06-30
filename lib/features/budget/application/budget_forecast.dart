import '../../../core/money/money.dart';
import '../../transactions/domain/budget_transaction.dart';
import '../domain/budget_plan.dart';

class BudgetForecastResult {
  const BudgetForecastResult({
    required this.discretionaryLimit,
    required this.spentThisPeriod,
    required this.remainingDiscretionary,
    required this.projectedSpend,
    required this.projectedOverage,
    required this.dailyTarget,
    required this.elapsedDays,
    required this.remainingDays,
    required this.totalDays,
  });

  final Money discretionaryLimit;
  final Money spentThisPeriod;
  final Money remainingDiscretionary;
  final Money projectedSpend;
  final Money projectedOverage;
  final Money dailyTarget;
  final int elapsedDays;
  final int remainingDays;
  final int totalDays;

  bool get isProjectedOverBudget => projectedOverage.minorUnits > 0;
}

class BudgetForecastCalculator {
  const BudgetForecastCalculator();

  BudgetForecastResult calculate({
    required BudgetPlan plan,
    required List<BudgetTransaction> transactions,
    required DateTime now,
  }) {
    final today = DateTime(now.year, now.month, now.day);
    final totalDays = plan.periodEnd
        .difference(plan.periodStart)
        .inDays
        .clamp(1, 366)
        .toInt();
    final rawElapsedDays = today.difference(plan.periodStart).inDays + 1;
    final elapsedDays = rawElapsedDays.clamp(1, totalDays).toInt();
    final remainingDays =
        plan.periodEnd.difference(today).inDays.clamp(1, totalDays).toInt();

    final spentMinor = transactions
        .where(
          (transaction) =>
              transaction.status == TransactionStatus.confirmed &&
              transaction.direction == TransactionDirection.expense &&
              !transaction.occurredAt.isBefore(plan.periodStart) &&
              transaction.occurredAt.isBefore(plan.periodEnd),
        )
        .fold<int>(
          0,
          (sum, transaction) => sum + transaction.amount.minorUnits,
        );

    final committedMinor = plan.savingsGoal.minorUnits +
        plan.cashBuffer.minorUnits +
        plan.fixedBills.minorUnits;
    final discretionaryLimitMinor =
        plan.monthlyLimit.minorUnits - committedMinor;
    final remainingMinor = discretionaryLimitMinor - spentMinor;
    final projectedMinor = (spentMinor / elapsedDays * totalDays).round();
    final projectedOverageMinor = projectedMinor - discretionaryLimitMinor;
    final dailyTargetMinor = (remainingMinor / remainingDays).floor();

    return BudgetForecastResult(
      discretionaryLimit: Money(discretionaryLimitMinor),
      spentThisPeriod: Money(spentMinor),
      remainingDiscretionary: Money(remainingMinor),
      projectedSpend: Money(projectedMinor),
      projectedOverage: Money(projectedOverageMinor),
      dailyTarget: Money(dailyTargetMinor),
      elapsedDays: elapsedDays,
      remainingDays: remainingDays,
      totalDays: totalDays,
    );
  }
}
