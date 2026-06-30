import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/preferences/app_preferences.dart';
import '../../budget/application/budget_state.dart';
import '../../transactions/application/monthly_report_pdf_exporter.dart';
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
                subtitle:
                    const Text('Parse pasted Gmail receipts into spending.'),
              ),
              ListTile(
                enabled: preferences.emailScanningEnabled,
                leading: const Icon(Icons.mark_email_read_outlined),
                title: const Text('Paste Gmail receipt'),
                subtitle: const Text('Import a receipt email body now.'),
                trailing: const Icon(Icons.chevron_right),
                onTap: preferences.emailScanningEnabled
                    ? () => _showEmailReceiptImport(context, controller)
                    : null,
              ),
              ListTile(
                enabled: preferences.emailScanningEnabled,
                leading: const Icon(Icons.playlist_add_check_outlined),
                title: const Text('Import demo Gmail receipts'),
                subtitle: const Text('Runs the receipt parser with examples.'),
                onTap: preferences.emailScanningEnabled
                    ? () {
                        final count = controller.importDemoGmailReceipts();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Imported $count receipts')),
                        );
                      }
                    : null,
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
                title: const Text('Encrypted backup'),
                subtitle: const Text(
                    'Create or restore passphrase-protected local backups.'),
              ),
              ListTile(
                enabled: preferences.cloudSyncEnabled,
                leading: const Icon(Icons.lock_outline),
                title: const Text('Create encrypted backup'),
                subtitle: const Text('Share or copy an encrypted snapshot.'),
                trailing: const Icon(Icons.chevron_right),
                onTap: preferences.cloudSyncEnabled
                    ? () => _showBackupExport(context, controller)
                    : null,
              ),
              ListTile(
                enabled: preferences.cloudSyncEnabled,
                leading: const Icon(Icons.restore_page_outlined),
                title: const Text('Restore encrypted backup'),
                subtitle: const Text('Paste a backup and passphrase.'),
                trailing: const Icon(Icons.chevron_right),
                onTap: preferences.cloudSyncEnabled
                    ? () => _showBackupRestore(context, controller)
                    : null,
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
                title: const Text('Export center'),
                subtitle: const Text('Copy or share CSV and monthly PDF.'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => _showExportCenter(context, state),
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

  void _showEmailReceiptImport(
    BuildContext context,
    BudgetStateController controller,
  ) {
    final receiptController = TextEditingController();
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Paste Gmail receipt'),
          content: SizedBox(
            width: double.maxFinite,
            child: TextField(
              controller: receiptController,
              minLines: 8,
              maxLines: 12,
              decoration: const InputDecoration(
                hintText:
                    'Subject: Your receipt from Grab\nDate: 2026-06-14\nTotal SGD 12.90',
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                final imported =
                    controller.importEmailReceipt(receiptController.text);
                Navigator.pop(dialogContext);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      imported
                          ? 'Receipt imported'
                          : 'Receipt was not imported',
                    ),
                  ),
                );
              },
              child: const Text('Import'),
            ),
          ],
        );
      },
    );
  }

  void _showExportCenter(BuildContext context, BudgetState state) {
    final csv = const TransactionCsvExporter().export(
      transactions: state.transactions,
      categories: state.categories,
    );
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
                leading: const Icon(Icons.copy_outlined),
                title: const Text('Copy CSV'),
                subtitle: const Text('Copy ledger data to the clipboard.'),
                onTap: () async {
                  await Clipboard.setData(ClipboardData(text: csv));
                  if (context.mounted) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('CSV copied')),
                    );
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.table_view_outlined),
                title: const Text('Share CSV file'),
                subtitle: const Text('Share or download the full ledger.'),
                onTap: () async {
                  await _shareBytes(
                    context,
                    bytes: Uint8List.fromList(utf8.encode(csv)),
                    filename: 'pocketpulse-transactions.csv',
                    mimeType: 'text/csv',
                    title: 'PocketPulse transactions CSV',
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.picture_as_pdf_outlined),
                title: const Text('Share monthly PDF'),
                subtitle: const Text('Generate this month’s spending report.'),
                onTap: () async {
                  final bytes = await const MonthlyReportPdfExporter().export(
                    plan: state.plan,
                    transactions: state.transactions,
                    categories: state.categories,
                    generatedAt: DateTime.now(),
                  );
                  if (!context.mounted) {
                    return;
                  }
                  await _shareBytes(
                    context,
                    bytes: bytes,
                    filename:
                        'pocketpulse-${DateFormat('yyyy-MM').format(state.plan.periodStart)}.pdf',
                    mimeType: 'application/pdf',
                    title: 'PocketPulse monthly PDF',
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.code_outlined),
                title: const Text('Preview CSV text'),
                subtitle: const Text('Inspect and select the export payload.'),
                onTap: () {
                  Navigator.pop(context);
                  _showCsvPreview(context, csv);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showCsvPreview(BuildContext context, String csv) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('CSV export'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(child: SelectableText(csv)),
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

  void _showBackupExport(
    BuildContext context,
    BudgetStateController controller,
  ) {
    final passphraseController = TextEditingController();
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Create encrypted backup'),
          content: TextField(
            controller: passphraseController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Backup passphrase',
              helperText: 'Use at least 8 characters.',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                try {
                  final backup = await controller.exportEncryptedBackup(
                    passphraseController.text,
                  );
                  if (!dialogContext.mounted) {
                    return;
                  }
                  Navigator.pop(dialogContext);
                  _showBackupPayload(context, backup);
                } on FormatException catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error.message)),
                  );
                }
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );
  }

  void _showBackupPayload(BuildContext context, String backup) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Encrypted backup'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(child: SelectableText(backup)),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: backup));
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Backup copied')),
                  );
                }
              },
              child: const Text('Copy'),
            ),
            FilledButton(
              onPressed: () async {
                await _shareBytes(
                  dialogContext,
                  bytes: Uint8List.fromList(utf8.encode(backup)),
                  filename: 'pocketpulse-backup.json',
                  mimeType: 'application/json',
                  title: 'PocketPulse encrypted backup',
                );
              },
              child: const Text('Share'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showBackupRestore(
    BuildContext context,
    BudgetStateController controller,
  ) {
    final passphraseController = TextEditingController();
    final backupController = TextEditingController();
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Restore encrypted backup'),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: passphraseController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Backup passphrase',
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: backupController,
                  minLines: 6,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    labelText: 'Encrypted backup JSON',
                    alignLabelWithHint: true,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                try {
                  await controller.restoreEncryptedBackup(
                    payload: backupController.text,
                    passphrase: passphraseController.text,
                  );
                  if (!dialogContext.mounted) {
                    return;
                  }
                  Navigator.pop(dialogContext);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Backup restored')),
                  );
                } on FormatException catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(error.message)),
                  );
                }
              },
              child: const Text('Restore'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _shareBytes(
    BuildContext context, {
    required Uint8List bytes,
    required String filename,
    required String mimeType,
    required String title,
  }) async {
    final renderBox = context.findRenderObject() as RenderBox?;
    await SharePlus.instance.share(
      ShareParams(
        title: title,
        files: [XFile.fromData(bytes, mimeType: mimeType)],
        fileNameOverrides: [filename],
        downloadFallbackEnabled: true,
        sharePositionOrigin: renderBox == null
            ? null
            : renderBox.localToGlobal(Offset.zero) & renderBox.size,
      ),
    );
    if (context.mounted) {
      Navigator.pop(context);
    }
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
