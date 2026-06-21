import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../core/money/money.dart';
import '../../budget/application/budget_state.dart';
import '../../transactions/domain/budget_transaction.dart';

class InsightsScreen extends ConsumerWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final insights = ref.watch(insightsProvider);
    final recurring = ref.watch(recurringPaymentsProvider);
    final state = ref.watch(budgetStateProvider);
    final categorySpend = _categorySpend(state);

    return Scaffold(
      appBar: AppBar(title: const Text('Insights')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          Text('This month', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          _CategorySpendChart(categorySpend: categorySpend),
          const SizedBox(height: 16),
          Text('Actionable insights',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          if (insights.isEmpty)
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child:
                    Text('Insights will appear as spending patterns emerge.'),
              ),
            )
          else
            ...insights.map(
              (insight) => Card(
                child: ListTile(
                  leading: const Icon(Icons.lightbulb_outline),
                  title: Text(insight.title),
                  subtitle: Text(insight.description),
                  trailing: const Icon(Icons.chevron_right),
                ),
              ),
            ),
          const SizedBox(height: 16),
          Text('Recurring', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          if (recurring.isEmpty)
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('No recurring payments detected yet.'),
              ),
            )
          else
            ...recurring.map(
              (payment) => Card(
                child: ListTile(
                  leading: const Icon(Icons.autorenew_outlined),
                  title: Text(payment.merchantName),
                  subtitle: Text(
                      'Expected ${payment.nextExpectedAt.month}/${payment.nextExpectedAt.day}'),
                  trailing: Text(
                    payment.amount.format(),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  List<_CategorySpend> _categorySpend(BudgetState state) {
    final totals = <String, int>{};
    for (final transaction in state.periodTransactions.where(
      (transaction) => transaction.direction == TransactionDirection.expense,
    )) {
      totals.update(
        transaction.categoryId,
        (value) => value + transaction.amount.minorUnits,
        ifAbsent: () => transaction.amount.minorUnits,
      );
    }

    return [
      for (final category in state.categories)
        _CategorySpend(
          label: category.name,
          color: category.color,
          amount: Money(totals[category.id] ?? 0),
        ),
    ]..sort(
        (a, b) => b.amount.minorUnits.compareTo(a.amount.minorUnits),
      );
  }
}

class _CategorySpend {
  const _CategorySpend({
    required this.label,
    required this.color,
    required this.amount,
  });

  final String label;
  final Color color;
  final Money amount;
}

class _CategorySpendChart extends StatelessWidget {
  const _CategorySpendChart({required this.categorySpend});

  final List<_CategorySpend> categorySpend;

  @override
  Widget build(BuildContext context) {
    final visible = categorySpend
        .where((item) => item.amount.minorUnits > 0)
        .take(5)
        .toList();
    if (visible.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text('Category trends will appear after confirmed spending.'),
        ),
      );
    }

    final maxY = visible
        .map((item) => item.amount.minorUnits)
        .reduce((a, b) => a > b ? a : b)
        .toDouble();

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
        child: SizedBox(
          height: 220,
          child: BarChart(
            BarChartData(
              maxY: maxY,
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
              barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    final item = visible[group.x];
                    return BarTooltipItem(
                      item.amount.format(),
                      Theme.of(context).textTheme.bodyMedium!,
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(),
                rightTitles: const AxisTitles(),
                leftTitles: const AxisTitles(),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 44,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();
                      if (index < 0 || index >= visible.length) {
                        return const SizedBox.shrink();
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          visible[index].label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      );
                    },
                  ),
                ),
              ),
              barGroups: [
                for (var index = 0; index < visible.length; index++)
                  BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: visible[index].amount.minorUnits.toDouble(),
                        width: 22,
                        borderRadius: BorderRadius.circular(4),
                        color: visible[index].color,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
