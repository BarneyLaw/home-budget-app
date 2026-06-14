import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../budget/application/budget_state.dart';
import '../domain/budget_transaction.dart';

class TransactionsScreen extends ConsumerStatefulWidget {
  const TransactionsScreen({super.key});

  @override
  ConsumerState<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends ConsumerState<TransactionsScreen> {
  String _query = '';
  String _status = 'all';

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(budgetStateProvider);
    final transactions = state.transactions.where((transaction) {
      final queryMatches = _query.isEmpty ||
          transaction.merchantName.toLowerCase().contains(_query.toLowerCase());
      final statusMatches = _status == 'all' || transaction.status.name == _status;
      return queryMatches && statusMatches;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Search merchant, category, source',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) => setState(() => _query = value),
          ),
          const SizedBox(height: 12),
          SegmentedButton<String>(
            segments: const [
              ButtonSegment(value: 'all', label: Text('All')),
              ButtonSegment(value: 'confirmed', label: Text('Confirmed')),
              ButtonSegment(value: 'needsReview', label: Text('Review')),
              ButtonSegment(value: 'duplicate', label: Text('Duplicate')),
            ],
            selected: {_status},
            onSelectionChanged: (selection) {
              setState(() => _status = selection.first);
            },
          ),
          const SizedBox(height: 12),
          ...transactions.map((transaction) {
            final category = state.categoryById(transaction.categoryId);
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: category.color.withOpacity(0.12),
                  child: Icon(category.icon, color: category.color),
                ),
                title: Text(transaction.merchantName),
                subtitle: Text(
                  '${category.name} - ${transaction.sourceType.name} - ${transaction.status.name}',
                ),
                trailing: Text(
                  transaction.amount.format(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                onTap: transaction.status == TransactionStatus.needsReview
                    ? () => _showReviewActions(context, transaction.id)
                    : null,
              ),
            );
          }),
        ],
      ),
    );
  }

  void _showReviewActions(BuildContext context, String id) {
    final controller = ref.read(budgetStateProvider.notifier);
    showModalBottomSheet<void>(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              runSpacing: 8,
              children: [
                ListTile(
                  leading: const Icon(Icons.check),
                  title: const Text('Confirm transaction'),
                  onTap: () {
                    controller.confirmTransaction(id);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.swap_horiz),
                  title: const Text('Mark as transfer'),
                  onTap: () {
                    controller.markAsTransfer(id);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.hide_source_outlined),
                  title: const Text('Ignore'),
                  onTap: () {
                    controller.ignoreTransaction(id);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
