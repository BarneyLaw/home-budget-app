import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../transactions/domain/budget_transaction.dart';
import '../application/budget_state.dart';

class BudgetScreen extends ConsumerWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(budgetStateProvider);
    final safe = ref.watch(safeToSpendProvider);
    final plan = state.plan;

    return Scaffold(
      appBar: AppBar(title: const Text('Budget')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Monthly plan',
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 12),
                  _MetricRow(
                    label: 'Spend limit',
                    value: plan.monthlyLimit.format(),
                  ),
                  _MetricRow(
                    label: 'Savings goal',
                    value: plan.savingsGoal.format(),
                  ),
                  _MetricRow(
                    label: 'Fixed bills accounted',
                    value: plan.fixedBills.format(),
                  ),
                  _MetricRow(
                    label: 'Remaining after commitments',
                    value: safe.remainingAfterCommitments.format(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text('Categories', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          ...plan.categoryBudgets.map((budget) {
            final category = state.categoryById(budget.categoryId);
            final spent = state.confirmedTransactions
                .where((transaction) =>
                    transaction.categoryId == budget.categoryId &&
                    transaction.direction == TransactionDirection.expense)
                .fold<int>(
                  0,
                  (sum, transaction) => sum + transaction.amount.minorUnits,
                );
            final progress =
                (spent / budget.limit.minorUnits).clamp(0.0, 1.0).toDouble();
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(category.icon, color: category.color),
                        const SizedBox(width: 10),
                        Expanded(child: Text(category.name)),
                        Text('${(progress * 100).round()}%'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: progress,
                      color: category.color,
                      backgroundColor: category.color.withOpacity(0.12),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${state.categoryById(budget.categoryId).name}: ${budget.limit.format()} limit',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _MetricRow extends StatelessWidget {
  const _MetricRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(
            value,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}
