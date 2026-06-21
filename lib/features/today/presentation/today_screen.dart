import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/money/money.dart';
import '../../budget/application/budget_state.dart';
import '../../transactions/domain/budget_transaction.dart';

class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(budgetStateProvider);
    final controller = ref.read(budgetStateProvider.notifier);
    final safeToSpend = ref.watch(safeToSpendProvider);
    final reviewItems = state.reviewTransactions.take(3).toList();
    final recent = state.confirmedTransactions.take(4).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('PocketPulse'),
        actions: [
          IconButton(
            tooltip: 'Capture demo notification',
            icon: const Icon(Icons.notifications_active_outlined),
            onPressed: () {
              controller.simulateNotificationCapture();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    ref.read(budgetStateProvider).lastImportMessage ??
                        'Notification captured',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          _SafeToSpendCard(
            amount: safeToSpend.safeThisWeek,
            spentToday: safeToSpend.spentToday,
            message: safeToSpend.message,
          ),
          const SizedBox(height: 16),
          _QuickEntry(controller: controller, state: state),
          const SizedBox(height: 16),
          _SectionHeader(
            title: 'Needs review',
            trailing: '${state.reviewTransactions.length}',
          ),
          if (reviewItems.isEmpty)
            const _EmptyPanel(message: 'No uncertain transactions right now.')
          else
            ...reviewItems.map(
              (transaction) => _ReviewTile(transaction: transaction),
            ),
          const SizedBox(height: 16),
          const _SectionHeader(title: 'Recent'),
          ...recent.map((transaction) {
            final category = state.categoryById(transaction.categoryId);
            return _TransactionTile(
              transaction: transaction,
              categoryName: category.name,
              color: category.color,
            );
          }),
        ],
      ),
    );
  }
}

class _SafeToSpendCard extends StatelessWidget {
  const _SafeToSpendCard({
    required this.amount,
    required this.spentToday,
    required this.message,
  });

  final Money amount;
  final Money spentToday;
  final String message;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Safe to spend this week',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              amount.format(compact: true),
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              'You have spent ${spentToday.format()} today. $message',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF4B5563),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickEntry extends StatefulWidget {
  const _QuickEntry({required this.controller, required this.state});

  final BudgetStateController controller;
  final BudgetState state;

  @override
  State<_QuickEntry> createState() => _QuickEntryState();
}

class _QuickEntryState extends State<_QuickEntry> {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.state.quickEntryText);
  }

  @override
  void didUpdateWidget(covariant _QuickEntry oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state.quickEntryText != _textController.text) {
      _textController.text = widget.state.quickEntryText;
      _textController.selection = TextSelection.collapsed(
        offset: _textController.text.length,
      );
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  hintText: '4.80 kopi',
                  prefixIcon: Icon(Icons.add_card_outlined),
                ),
                textInputAction: TextInputAction.done,
                onChanged: widget.controller.setQuickEntryText,
                onSubmitted: (_) => _submit(context),
              ),
            ),
            const SizedBox(width: 8),
            IconButton.filled(
              tooltip: 'Add transaction',
              icon: const Icon(Icons.arrow_upward),
              onPressed: () => _submit(context),
            ),
          ],
        ),
      ),
    );
  }

  void _submit(BuildContext context) {
    final added = widget.controller.addManualEntry();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(added ? 'Transaction added' : 'Enter an amount')),
    );
  }
}

class _ReviewTile extends ConsumerWidget {
  const _ReviewTile({required this.transaction});

  final BudgetTransaction transaction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(budgetStateProvider.notifier);
    final state = ref.watch(budgetStateProvider);
    final category = state.categoryById(transaction.categoryId);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    transaction.merchantName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Text(
                  transaction.amount.format(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              '${category.name} - ${(transaction.confidence * 100).round()}% confidence',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                FilledButton.icon(
                  icon: const Icon(Icons.check),
                  label: const Text('Confirm'),
                  onPressed: () =>
                      controller.confirmTransaction(transaction.id),
                ),
                OutlinedButton.icon(
                  icon: const Icon(Icons.swap_horiz),
                  label: const Text('Transfer'),
                  onPressed: () => controller.markAsTransfer(transaction.id),
                ),
                OutlinedButton.icon(
                  icon: const Icon(Icons.auto_fix_high_outlined),
                  label: const Text('Rule'),
                  onPressed: () {
                    controller.createRuleFromTransaction(transaction.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Rule created')),
                    );
                  },
                ),
                IconButton(
                  tooltip: 'Ignore',
                  icon: const Icon(Icons.hide_source_outlined),
                  onPressed: () => controller.ignoreTransaction(transaction.id),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  const _TransactionTile({
    required this.transaction,
    required this.categoryName,
    required this.color,
  });

  final BudgetTransaction transaction;
  final String categoryName;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final sign =
        transaction.direction == TransactionDirection.income ? '+' : '';
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4),
      leading: CircleAvatar(
        backgroundColor: color.withValues(alpha: 0.12),
        child: Icon(Icons.payments_outlined, color: color),
      ),
      title: Text(transaction.merchantName),
      subtitle: Text(categoryName),
      trailing: Text(
        '$sign${transaction.amount.format()}',
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, this.trailing});

  final String title;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const Spacer(),
          if (trailing != null)
            Badge(
              label: Text(trailing!),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
        ],
      ),
    );
  }
}

class _EmptyPanel extends StatelessWidget {
  const _EmptyPanel({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(message),
      ),
    );
  }
}
