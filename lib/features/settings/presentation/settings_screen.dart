import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/preferences/app_preferences.dart';
import '../../budget/application/budget_state.dart';
import '../../transactions/application/transaction_csv_exporter.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(budgetStateProvider);
    final controller = ref.read(budgetStateProvider.notifier);
    final preferences = state.preferences;

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          _SettingsGroup(
            title: 'Capture',
            children: [
              SwitchListTile(
                value: preferences.notificationCaptureEnabled,
                onChanged: (value) {
                  controller.updatePreferences(
                    preferences.copyWith(notificationCaptureEnabled: value),
                  );
                },
                secondary: const Icon(Icons.notifications_active_outlined),
                title: const Text('Notification access'),
                subtitle: const Text(
                    'Android capture pipeline ready for native listener.'),
              ),
              SwitchListTile(
                value: preferences.emailScanningEnabled,
                onChanged: (value) {
                  controller.updatePreferences(
                    preferences.copyWith(emailScanningEnabled: value),
                  );
                },
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
                trailing: Text(preferences.currency),
              ),
              ListTile(
                leading: const Icon(Icons.category_outlined),
                title: const Text('Categories'),
                trailing: Text('${state.categories.length}'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: SegmentedButton<TrackingStyle>(
                  segments: const [
                    ButtonSegment(
                      value: TrackingStyle.relaxed,
                      label: Text('Relaxed'),
                    ),
                    ButtonSegment(
                      value: TrackingStyle.balanced,
                      label: Text('Balanced'),
                    ),
                    ButtonSegment(
                      value: TrackingStyle.strict,
                      label: Text('Strict'),
                    ),
                  ],
                  selected: {preferences.trackingStyle},
                  onSelectionChanged: (selection) {
                    controller.updatePreferences(
                      preferences.copyWith(trackingStyle: selection.first),
                    );
                  },
                ),
              ),
            ],
          ),
          _SettingsGroup(
            title: 'Backup',
            children: [
              SwitchListTile(
                value: preferences.cloudSyncEnabled,
                onChanged: (value) {
                  controller.updatePreferences(
                    preferences.copyWith(cloudSyncEnabled: value),
                  );
                },
                secondary: const Icon(Icons.cloud_sync_outlined),
                title: const Text('Encrypted cloud backup'),
                subtitle: const Text(
                    'Backend sync contract is staged for a later service.'),
              ),
              SwitchListTile(
                value: preferences.rawEmailStorageEnabled,
                onChanged: (value) {
                  controller.updatePreferences(
                    preferences.copyWith(rawEmailStorageEnabled: value),
                  );
                },
                secondary: const Icon(Icons.mark_email_read_outlined),
                title: const Text('Store raw email bodies'),
                subtitle:
                    const Text('Off keeps only parsed transaction fields.'),
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
              SwitchListTile(
                value: preferences.appLockEnabled,
                onChanged: (value) {
                  controller.updatePreferences(
                    preferences.copyWith(appLockEnabled: value),
                  );
                },
                secondary: const Icon(Icons.lock_outline),
                title: const Text('App lock'),
                subtitle:
                    const Text('Uses platform biometrics when available.'),
              ),
              ListTile(
                leading: const Icon(Icons.file_download_outlined),
                title: const Text('Export CSV'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _showCsvExport(context, state),
              ),
              const ListTile(
                leading: Icon(Icons.security_outlined),
                title: Text('No bank passwords'),
                subtitle: Text(
                    'Capture uses notifications, email receipts, and imports.'),
              ),
              ListTile(
                leading: const Icon(Icons.delete_outline),
                title: const Text('Delete local data'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _confirmReset(context, controller),
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

  void _confirmReset(
    BuildContext context,
    BudgetStateController controller,
  ) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete local data?'),
          content:
              const Text('This resets the local demo ledger and settings.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                await controller.resetLocalData();
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
              child: const Text('Reset'),
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
