import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../budget/application/budget_state.dart';
import '../../transactions/application/transaction_csv_exporter.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(budgetStateProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          _SettingsGroup(
            title: 'Capture',
            children: [
              SwitchListTile(
                value: true,
                onChanged: (_) {},
                secondary: const Icon(Icons.notifications_active_outlined),
                title: const Text('Notification access'),
                subtitle: const Text('Android capture pipeline ready for native listener.'),
              ),
              SwitchListTile(
                value: false,
                onChanged: (_) {},
                secondary: const Icon(Icons.mail_outline),
                title: const Text('Gmail receipt scanning'),
                subtitle: const Text('Planned email import source.'),
              ),
            ],
          ),
          _SettingsGroup(
            title: 'Budget',
            children: [
              ListTile(
                leading: const Icon(Icons.currency_exchange),
                title: const Text('Currency'),
                trailing: Text(state.plan.monthlyLimit.currency),
              ),
              ListTile(
                leading: const Icon(Icons.category_outlined),
                title: const Text('Categories'),
                trailing: Text('${state.categories.length}'),
              ),
            ],
          ),
          _SettingsGroup(
            title: 'Rules',
            children: [
              for (final rule in state.rules)
                ListTile(
                  leading: Icon(
                    rule.enabled
                        ? Icons.auto_fix_high_outlined
                        : Icons.block_outlined,
                  ),
                  title: Text(rule.name),
                  subtitle: Text('Priority ${rule.priority}'),
                ),
            ],
          ),
          _SettingsGroup(
            title: 'Privacy',
            children: [
              const ListTile(
                leading: Icon(Icons.lock_outline),
                title: Text('App lock'),
                trailing: Icon(Icons.chevron_right),
              ),
              ListTile(
                leading: const Icon(Icons.file_download_outlined),
                title: const Text('Export CSV'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _showCsvExport(context, state),
              ),
              const ListTile(
                leading: Icon(Icons.delete_outline),
                title: Text('Delete local data'),
                trailing: Icon(Icons.chevron_right),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showCsvExport(BuildContext context, BudgetState state) {
    final csv = const TransactionCsvExporter().export(
      transactions: state.transactions,
      categories: state.categories,
    );
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('CSV export'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: SelectableText(csv),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  const _SettingsGroup({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text(title, style: Theme.of(context).textTheme.titleLarge),
          ),
          Card(
            child: Column(children: children),
          ),
        ],
      ),
    );
  }
}
