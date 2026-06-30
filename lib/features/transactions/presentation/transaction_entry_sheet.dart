import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/money/money.dart';
import '../../budget/application/budget_state.dart';
import '../domain/budget_transaction.dart';
import '../domain/category.dart';

Future<void> showTransactionEntrySheet({
  required BuildContext context,
  required WidgetRef ref,
  BudgetTransaction? transaction,
}) {
  final state = ref.read(budgetStateProvider);
  final controller = ref.read(budgetStateProvider.notifier);
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (sheetContext) {
      return _TransactionEntrySheet(
        categories: state.categories,
        transaction: transaction,
        onSave: (draft) {
          final saved = transaction == null
              ? controller.addStructuredTransaction(
                  amount: draft.amount,
                  direction: draft.direction,
                  merchantName: draft.merchantName,
                  categoryId: draft.categoryId,
                  occurredAt: draft.occurredAt,
                  accountId: draft.accountId,
                  notes: draft.notes,
                  isRecurring: draft.isRecurring,
                )
              : _updateExistingTransaction(
                  controller: controller,
                  transaction: transaction,
                  draft: draft,
                );
          if (!saved) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Enter an amount and purpose')),
            );
            return;
          }
          Navigator.pop(sheetContext);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Transaction saved')),
          );
        },
      );
    },
  );
}

bool _updateExistingTransaction({
  required BudgetStateController controller,
  required BudgetTransaction transaction,
  required _TransactionDraft draft,
}) {
  if (draft.amount.minorUnits == 0 || draft.merchantName.trim().isEmpty) {
    return false;
  }
  controller.updateTransactionDetails(
    id: transaction.id,
    amount: Money(
      draft.amount.minorUnits.abs(),
      currency: draft.amount.currency,
    ),
    direction: draft.direction,
    merchantName: draft.merchantName.trim(),
    categoryId: draft.categoryId,
    occurredAt: draft.occurredAt,
    accountId: draft.accountId,
    notes: draft.notes,
    isRecurring: draft.isRecurring,
  );
  return true;
}

class _TransactionDraft {
  const _TransactionDraft({
    required this.amount,
    required this.direction,
    required this.merchantName,
    required this.categoryId,
    required this.occurredAt,
    required this.accountId,
    required this.notes,
    required this.isRecurring,
  });

  final Money amount;
  final TransactionDirection direction;
  final String merchantName;
  final String categoryId;
  final DateTime occurredAt;
  final String accountId;
  final String? notes;
  final bool isRecurring;
}

class _TransactionEntrySheet extends StatefulWidget {
  const _TransactionEntrySheet({
    required this.categories,
    required this.onSave,
    this.transaction,
  });

  final List<SpendingCategory> categories;
  final BudgetTransaction? transaction;
  final ValueChanged<_TransactionDraft> onSave;

  @override
  State<_TransactionEntrySheet> createState() => _TransactionEntrySheetState();
}

class _TransactionEntrySheetState extends State<_TransactionEntrySheet> {
  late final TextEditingController _amountController;
  late final TextEditingController _merchantController;
  late final TextEditingController _quantityController;
  late final TextEditingController _descriptionController;
  late TransactionDirection _direction;
  late String _categoryId;
  late String _accountId;
  late DateTime _occurredAt;
  late bool _isRecurring;

  @override
  void initState() {
    super.initState();
    final transaction = widget.transaction;
    _amountController = TextEditingController(
      text: transaction?.amount.toDecimalString() ?? '',
    );
    _merchantController = TextEditingController(
      text: transaction?.merchantName ?? '',
    );
    _quantityController = TextEditingController(text: '1');
    _descriptionController = TextEditingController(
      text: _descriptionFromNotes(transaction?.notes),
    );
    _direction = transaction?.direction ?? TransactionDirection.expense;
    _categoryId = transaction?.categoryId ??
        (widget.categories.isNotEmpty ? widget.categories.first.id : 'general');
    _accountId = transaction?.accountId ?? 'cash';
    _occurredAt = transaction?.occurredAt ?? DateTime.now();
    _isRecurring = transaction?.isRecurring ?? false;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _merchantController.dispose();
    _quantityController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, bottomInset + 16),
        child: FractionallySizedBox(
          heightFactor: 0.92,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.transaction == null ? 'Add purchase' : 'Edit details',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView(
                  children: [
                    SegmentedButton<TransactionDirection>(
                      segments: const [
                        ButtonSegment(
                          value: TransactionDirection.expense,
                          icon: Icon(Icons.remove_circle_outline),
                          label: Text('Expense'),
                        ),
                        ButtonSegment(
                          value: TransactionDirection.income,
                          icon: Icon(Icons.add_circle_outline),
                          label: Text('Income'),
                        ),
                        ButtonSegment(
                          value: TransactionDirection.transfer,
                          icon: Icon(Icons.swap_horiz),
                          label: Text('Transfer'),
                        ),
                      ],
                      selected: {_direction},
                      onSelectionChanged: (selection) {
                        setState(() => _direction = selection.first);
                      },
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _amountController,
                      autofocus: widget.transaction == null,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Total amount',
                        prefixIcon: Icon(Icons.payments_outlined),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _merchantController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: 'Purpose or merchant',
                        prefixIcon: Icon(Icons.storefront_outlined),
                      ),
                    ),
                    const SizedBox(height: 12),
                    DropdownButtonFormField<String>(
                      value: _categoryId,
                      decoration: const InputDecoration(
                        labelText: 'Purpose category',
                        prefixIcon: Icon(Icons.category_outlined),
                      ),
                      items: [
                        for (final category in widget.categories)
                          DropdownMenuItem(
                            value: category.id,
                            child: Row(
                              children: [
                                Icon(category.icon, color: category.color),
                                const SizedBox(width: 8),
                                Text(category.name),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => _categoryId = value);
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: _pickDate,
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          labelText: 'Date',
                          prefixIcon: Icon(Icons.event_outlined),
                        ),
                        child: Text(DateFormat.yMMMd().format(_occurredAt)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _quantityController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            decoration: const InputDecoration(
                              labelText: 'Quantity',
                              prefixIcon: Icon(Icons.numbers_outlined),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: _accountId,
                            decoration: const InputDecoration(
                              labelText: 'Paid with',
                              prefixIcon: Icon(Icons.account_balance_outlined),
                            ),
                            items: [
                              for (final account in _accountChoices(_accountId))
                                DropdownMenuItem(
                                  value: account,
                                  child: Text(_accountLabel(account)),
                                ),
                            ],
                            onChanged: (value) {
                              if (value != null) {
                                setState(() => _accountId = value);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _descriptionController,
                      minLines: 3,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        alignLabelWithHint: true,
                        prefixIcon: Icon(Icons.notes_outlined),
                      ),
                    ),
                    const SizedBox(height: 4),
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Recurring payment'),
                      value: _isRecurring,
                      onChanged: (value) {
                        setState(() => _isRecurring = value);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      icon: const Icon(Icons.check),
                      label: const Text('Save'),
                      onPressed: _save,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    final selected = await showDatePicker(
      context: context,
      initialDate: _occurredAt,
      firstDate: DateTime(_occurredAt.year - 5),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (selected == null) {
      return;
    }
    setState(() {
      _occurredAt = DateTime(
        selected.year,
        selected.month,
        selected.day,
        _occurredAt.hour,
        _occurredAt.minute,
      );
    });
  }

  void _save() {
    final quantity = double.tryParse(_quantityController.text.trim());
    if (quantity == null || quantity <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid quantity')),
      );
      return;
    }

    try {
      widget.onSave(
        _TransactionDraft(
          amount: Money.fromDecimal(_amountController.text),
          direction: _direction,
          merchantName: _merchantController.text,
          categoryId: _categoryId,
          occurredAt: _occurredAt,
          accountId: _accountId,
          notes: _buildNotes(
            description: _descriptionController.text,
            quantity: quantity,
            accountId: _accountId,
          ),
          isRecurring: _isRecurring,
        ),
      );
    } on FormatException {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a valid amount')),
      );
    }
  }
}

List<String> _accountChoices(String current) {
  final accounts = ['cash', 'card', 'bank', 'wallet', 'dbs-card'];
  if (!accounts.contains(current)) {
    return [current, ...accounts];
  }
  return accounts;
}

String _accountLabel(String accountId) {
  return switch (accountId) {
    'cash' => 'Cash',
    'card' => 'Card',
    'bank' => 'Bank',
    'wallet' => 'Wallet',
    'dbs-card' => 'DBS card',
    _ => accountId,
  };
}

String? _buildNotes({
  required String description,
  required double quantity,
  required String accountId,
}) {
  final parts = <String>[
    if (description.trim().isNotEmpty) description.trim(),
    if (quantity != 1) 'Quantity: ${_formatQuantity(quantity)}',
    'Paid with: ${_accountLabel(accountId)}',
  ];
  return parts.isEmpty ? null : parts.join('; ');
}

String _formatQuantity(double value) {
  if (value == value.roundToDouble()) {
    return value.toInt().toString();
  }
  return value.toStringAsFixed(2).replaceFirst(RegExp(r'0+$'), '');
}

String _descriptionFromNotes(String? notes) {
  if (notes == null || notes.trim().isEmpty) {
    return '';
  }
  return notes
      .split(';')
      .map((part) => part.trim())
      .where(
        (part) =>
            !part.startsWith('Quantity:') && !part.startsWith('Paid with:'),
      )
      .join('; ');
}
