import '../../../core/money/money.dart';
import '../../transactions/domain/budget_transaction.dart';
import '../domain/budget_plan.dart';

class SafeToSpendResult {
  const SafeToSpendResult({
    required this.safeThisWeek,
    required this.spentToday,
    required this.spentThisPeriod,
    required this.remainingAfterCommitments,
    required this.dailyPaceDelta,
    required this.message,
  });

  final Money safeThisWeek;
  final Money spentToday;
  final Money spentThisPeriod;
  final Money remainingAfterCommitments;
  final Money dailyPaceDelta;
  final String message;
}

class SafeToSpendCalculator {
  const SafeToSpendCalculator();

  SafeToSpendResult calculate({
    required BudgetPlan plan,
    required List<BudgetTransaction> transactions,
    required DateTime now,
  }) {
    final periodTransactions = transactions.where((transaction) {
      return transaction.status == TransactionStatus.confirmed &&
          transaction.direction == TransactionDirection.expense &&
          !transaction.occurredAt.isBefore(plan.periodStart) &&
          transaction.occurredAt.isBefore(plan.periodEnd);
    }).toList();

    final spentMinor = periodTransactions.fold<int>(
      0,
      (sum, transaction) => sum + transaction.amount.minorUnits,
    );

    final todayStart = DateTime(now.year, now.month, now.day);
    final spentTodayMinor = periodTransactions
        .where((transaction) => !transaction.occurredAt.isBefore(todayStart))
        .fold<int>(
            0, (sum, transaction) => sum + transaction.amount.minorUnits);

    final committedMinor = plan.savingsGoal.minorUnits +
        plan.fixedBills.minorUnits +
        plan.cashBuffer.minorUnits;
    final remainingMinor =
        plan.monthlyLimit.minorUnits - committedMinor - spentMinor;
    final daysRemaining =
        plan.periodEnd.difference(todayStart).inDays.clamp(1, 31).toInt();
    final weekWindow = daysRemaining < 7 ? daysRemaining : 7;
    final safeThisWeekMinor = (remainingMinor / daysRemaining * weekWindow)
        .floor()
        .clamp(0, plan.monthlyLimit.minorUnits)
        .toInt();

    final elapsedDays = todayStart.difference(plan.periodStart).inDays + 1;
    final targetDailyMinor =
        (plan.monthlyLimit.minorUnits - committedMinor) ~/ 30;
    final actualDailyMinor = elapsedDays <= 0 ? 0 : spentMinor ~/ elapsedDays;
    final paceDeltaMinor = actualDailyMinor - targetDailyMinor;

    final message = paceDeltaMinor <= 0
        ? 'You are on track for the week.'
        : 'You are pacing ${(Money(paceDeltaMinor).format())}/day above target.';

    return SafeToSpendResult(
      safeThisWeek: Money(safeThisWeekMinor),
      spentToday: Money(spentTodayMinor),
      spentThisPeriod: Money(spentMinor),
      remainingAfterCommitments: Money(remainingMinor),
      dailyPaceDelta: Money(paceDeltaMinor),
      message: message,
    );
  }
}
