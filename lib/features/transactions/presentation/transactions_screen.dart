import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/money/money.dart';
import '../../budget/application/budget_state.dart';
import '../domain/budget_transaction.dart';
import '../domain/category.dart';

class TransactionsScreen extends ConsumerStatefulWidget {
  const TransactionsScreen({super.key});

  @override
  ConsumerState<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends ConsumerState<TransactionsScreen> {
  String _query = '';
  String _status = 'all';
  String _categoryId = 'all';
  String _source = 'all';

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(budgetStateProvider);
    final transactions = state.transactions.where((transaction) {
      final category = state.categoryById(transaction.categoryId);
      final query = _query.toLowerCase();
      final queryMatches = query.isEmpty ||
          transaction.merchantName.toLowerCase().contains(query) ||
          category.name.toLowerCase().contains(query) ||
          (transaction.sourceApp ?? '').toLowerCase().contains(query);
      final statusMatches =
          _status == 'all' || transaction.status.name == _status;
      final categoryMatches =
          _categoryId == 'all' || transaction.categoryId == _categoryId;
      final sourceMatches =
          _source == 'all' || transaction.sourceType.name == _source;
      return queryMatches && statusMatches && categoryMatches && sourceMatches;
    }).toList()
      ..sort((a, b) => b.occurredAt.compareTo(a.occurredAt));

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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'all', label: Text('All')),
                ButtonSegment(value: 'confirmed', label: Text('Confirmed')),
                ButtonSegment(value: 'needsReview', label: Text('Review')),
                ButtonSegment(value: 'duplicate', label: Text('Duplicate')),
                ButtonSegment(value: 'ignored', label: Text('Ignored')),
              ],
              selected: {_status},
              onSelectionChanged: (selection) {
                setState(() => _status = selection.first);
              },
            ),
          ),
          const SizedBox(height: 8),
          _FilterRow(
            categories: state.categories,
            categoryId: _categoryId,
            source: _source,
            onCategoryChanged: (value) => setState(() => _categoryId = value),
            onSourceChanged: (value) => setState(() => _source = value),
          ),
          const SizedBox(height: 12),
          if (transactions.isEmpty)
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('No matching transactions.'),
              ),
            )
          else
            ..._groupedTransactionTiles(context, state, transactions),
        ],
      ),
    );
  }

  List<Widget> _groupedTransactionTiles(
    BuildContext context,
    BudgetState state,
    List<BudgetTransaction> transactions,
  ) {
    final widgets = <Widget>[];
    DateTime? currentDay;
    for (final transaction in transactions) {
      final day = DateTime(
        transaction.occurredAt.year,
        transaction.occurredAt.month,
        transaction.occurredAt.day,
      );
      if (currentDay != day) {
        currentDay = day;
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 6, left: 4),
            child: Text(
              DateFormat.yMMMEd().format(day),
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        );
      }
      widgets.add(_TransactionCard(transaction: transaction));
    }
    return widgets;
  }
}

class _FilterRow extends StatelessWidget {
  const _FilterRow({
    required this.categories,
    required this.categoryId,
    required this.source,
    required this.onCategoryChanged,
    required this.onSourceChanged,
  });

  final List<SpendingCategory> categories;
  final String categoryId;
  final String source;
  final ValueChanged<String> onCategoryChanged;
  final ValueChanged<String> onSourceChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            value: categoryId,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.category_outlined),
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
            ),
            items: [
              const DropdownMenuItem(
                  value: 'all', child: Text('All categories')),
              for (final category in categories)
                DropdownMenuItem(
                  value: category.id,
                  child: Text(category.name),
                ),
            ],
            onChanged: (value) {
              if (value != null) {
                onCategoryChanged(value);
              }
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: DropdownButtonFormField<String>(
            value: source,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.input_outlined),
              contentPadding: EdgeInsets.symmetric(horizontal: 12),
            ),
            items: const [
              DropdownMenuItem(value: 'all', child: Text('All sources')),
              DropdownMenuItem(value: 'manual', child: Text('Manual')),
              DropdownMenuItem(value: 'notification', child: Text('Notify')),
              DropdownMenuItem(value: 'email', child: Text('Email')),
              DropdownMenuItem(value: 'import', child: Text('Import')),
              DropdownMenuItem(value: 'api', child: Text('API')),
            ],
            onChanged: (value) {
              if (value != null) {
                onSourceChanged(value);
              }
            },
          ),
        ),
      ],
    );
  }
}

class _TransactionCard extends ConsumerWidget {
  const _TransactionCard({required this.transaction});

  final BudgetTransaction transaction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(budgetStateProvider);
    final category = state.categoryById(transaction.categoryId);
    final sign =
        transaction.direction == TransactionDirection.income ? '+' : '';
    final statusColor = switch (transaction.status) {
      TransactionStatus.confirmed => Theme.of(context).colorScheme.primary,
      TransactionStatus.needsReview => const Color(0xFFB45309),
      TransactionStatus.ignored => const Color(0xFF64748B),
      TransactionStatus.duplicate => const Color(0xFFBE123C),
      TransactionStatus.pendingSync => const Color(0xFF2563EB),
    };

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: category.color.withValues(alpha: 0.12),
          child: Icon(category.icon, color: category.color),
        ),
        title: Text(transaction.merchantName),
        subtitle: Text(
          '${category.name} - ${transaction.sourceType.name} - ${transaction.status.name}',
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '$sign${transaction.amount.format()}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 4),
            Icon(Icons.circle, size: 8, color: statusColor),
          ],
        ),
        onTap: () => _showTransactionActions(context, ref, transaction),
      ),
    );
  }

  void _showTransactionActions(
    BuildContext context,
    WidgetRef ref,
    BudgetTransaction transaction,
  ) {
    final controller = ref.read(budgetStateProvider.notifier);
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return SafeArea(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            children: [
              ListTile(
                title: Text(transaction.merchantName),
                subtitle: Text(
                  '${transaction.amount.format()} - ${(transaction.confidence * 100).round()}% confidence',
                ),
              ),
              if (transaction.status != TransactionStatus.confirmed)
                ListTile(
                  leading: const Icon(Icons.check),
                  title: const Text('Confirm'),
                  onTap: () {
                    controller.confirmTransaction(transaction.id);
                    Navigator.pop(context);
                  },
                ),
              ListTile(
                leading: const Icon(Icons.category_outlined),
                title: const Text('Change category'),
                onTap: () {
                  Navigator.pop(context);
                  _showCategoryPicker(context, ref, transaction);
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit_outlined),
                title: const Text('Edit details'),
                onTap: () {
                  Navigator.pop(context);
                  _showEditDialog(context, ref, transaction);
                },
              ),
              ListTile(
                leading: const Icon(Icons.call_split_outlined),
                title: const Text('Split transaction'),
                onTap: () {
                  Navigator.pop(context);
                  _showSplitDialog(context, ref, transaction);
                },
              ),
              ListTile(
                leading: const Icon(Icons.swap_horiz),
                title: const Text('Mark as transfer'),
                onTap: () {
                  controller.markAsTransfer(transaction.id);
                  Navigator.pop(context);
                },
              ),
              if (transaction.status == TransactionStatus.duplicate)
                ListTile(
                  leading: const Icon(Icons.merge_outlined),
                  title: const Text('Merge duplicate'),
                  onTap: () {
                    controller.mergeDuplicate(transaction.id);
                    Navigator.pop(context);
                  },
                ),
              ListTile(
                leading: const Icon(Icons.hide_source_outlined),
                title: const Text('Ignore'),
                onTap: () {
                  controller.ignoreTransaction(transaction.id);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCategoryPicker(
    BuildContext context,
    WidgetRef ref,
    BudgetTransaction transaction,
  ) {
    final state = ref.read(budgetStateProvider);
    final controller = ref.read(budgetStateProvider.notifier);
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final category in state.categories)
                  ChoiceChip(
                    selected: transaction.categoryId == category.id,
                    label: Text(category.name),
                    avatar: Icon(category.icon, size: 18),
                    onSelected: (_) {
                      controller.changeTransactionCategory(
                        transaction.id,
                        category.id,
                      );
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

  void _showEditDialog(
    BuildContext context,
    WidgetRef ref,
    BudgetTransaction transaction,
  ) {
    final merchantController =
        TextEditingController(text: transaction.merchantName);
    final amountController =
        TextEditingController(text: transaction.amount.toDecimalString());
    final notesController =
        TextEditingController(text: transaction.notes ?? '');
    final controller = ref.read(budgetStateProvider.notifier);

    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit transaction'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: merchantController,
                decoration: const InputDecoration(labelText: 'Merchant'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Amount'),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: notesController,
                decoration: const InputDecoration(labelText: 'Notes'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                try {
                  controller.updateTransactionDetails(
                    id: transaction.id,
                    merchantName: merchantController.text.trim().isEmpty
                        ? transaction.merchantName
                        : merchantController.text.trim(),
                    amount: Money.fromDecimal(amountController.text),
                    notes: notesController.text.trim(),
                  );
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

  void _showSplitDialog(
    BuildContext context,
    WidgetRef ref,
    BudgetTransaction transaction,
  ) {
    final state = ref.read(budgetStateProvider);
    final amountController = TextEditingController();
    var firstCategoryId = transaction.categoryId;
    var secondCategoryId = state.categories.first.id;
    final controller = ref.read(budgetStateProvider.notifier);

    showDialog<void>(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Split transaction'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'First amount',
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: firstCategoryId,
                    decoration: const InputDecoration(labelText: 'First part'),
                    items: [
                      for (final category in state.categories)
                        DropdownMenuItem(
                          value: category.id,
                          child: Text(category.name),
                        ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => firstCategoryId = value);
                      }
                    },
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: secondCategoryId,
                    decoration: const InputDecoration(labelText: 'Second part'),
                    items: [
                      for (final category in state.categories)
                        DropdownMenuItem(
                          value: category.id,
                          child: Text(category.name),
                        ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => secondCategoryId = value);
                      }
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                FilledButton(
                  onPressed: () {
                    try {
                      final ok = controller.splitTransaction(
                        id: transaction.id,
                        firstAmount: Money.fromDecimal(amountController.text),
                        firstCategoryId: firstCategoryId,
                        secondCategoryId: secondCategoryId,
                      );
                      if (ok) {
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Split amount must be smaller'),
                          ),
                        );
                      }
                    } on FormatException {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Enter a valid amount')),
                      );
                    }
                  },
                  child: const Text('Split'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
