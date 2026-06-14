import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../budget/application/budget_state.dart';

class InsightsScreen extends ConsumerWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final insights = ref.watch(insightsProvider);
    final recurring = ref.watch(recurringPaymentsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Insights')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          Text('Actionable insights',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          if (insights.isEmpty)
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('Insights will appear as spending patterns emerge.'),
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
                  subtitle: Text('Expected ${payment.nextExpectedAt.month}/${payment.nextExpectedAt.day}'),
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
}
