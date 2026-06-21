import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/money/money.dart';
import '../../transactions/domain/budget_transaction.dart';
import '../application/budget_state.dart';

class BudgetScreen extends ConsumerWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(budgetStateProvider);
    final controller = ref.read(budgetStateProvider.notifier);
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
                    onTap: () => _editMoney(
                      context,
                      title: 'Spend limit',
                      initial: plan.monthlyLimit,
                      onSaved: (value) =>
                          controller.updatePlan(monthlyLimit: value),
                    ),
                  ),
                  _MetricRow(
                    label: 'Savings goal',
                    value: plan.savingsGoal.format(),
                    onTap: () => _editMoney(
                      context,
                      title: 'Savings goal',
                      initial: plan.savingsGoal,
                      onSaved: (value) =>
                          controller.updatePlan(savingsGoal: value),
                    ),
                  ),
                  _MetricRow(
                    label: 'Cash buffer',
                    value: plan.cashBuffer.format(),
                    onTap: () => _editMoney(
                      context,
                      title: 'Cash buffer',
                      initial: plan.cashBuffer,
                      onSaved: (value) =>
                          controller.updatePlan(cashBuffer: value),
                    ),
                  ),
                  _MetricRow(
                    label: 'Fixed bills accounted',
                    value: plan.fixedBills.format(),
                    onTap: () => _editMoney(
                      context,
                      title: 'Fixed bills',
                      initial: plan.fixedBills,
                      onSaved: (value) =>
                          controller.updatePlan(fixedBills: value),
                    ),
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
            final spent = state.periodTransactions
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
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => _editMoney(
                  context,
                  title: '${category.name} limit',
                  initial: budget.limit,
                  onSaved: (value) => controller.updateCategoryBudget(
                    budget.categoryId,
                    value,
                  ),
                ),
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
                        backgroundColor: category.color.withValues(alpha: 0.12),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${state.categoryById(budget.categoryId).name}: ${budget.limit.format()} limit',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  void _editMoney(
    BuildContext context, {
    required String title,
    required Money initial,
    required ValueChanged<Money> onSaved,
  }) {
    final controller = TextEditingController(text: initial.toDecimalString());
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Amount'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                try {
                  onSaved(Money.fromDecimal(controller.text));
                  Navigator.pop(context);
                } on FormatException {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Enter a valid amount')),
                  );
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class _MetricRow extends StatelessWidget {
  const _MetricRow({required this.label, required this.value, this.onTap});

  final String label;
  final String value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Expanded(child: Text(label)),
            Text(
              value,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            if (onTap != null) ...[
              const SizedBox(width: 4),
              const Icon(Icons.edit_outlined, size: 16),
            ],
          ],
        ),
      ),
    );
  }
}
