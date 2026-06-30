import 'package:flutter_test/flutter_test.dart';
import 'package:home_budget_app/features/backup/application/encrypted_backup_service.dart';
import 'package:home_budget_app/features/budget/application/budget_state.dart';

void main() {
  test('exports and imports an encrypted local backup snapshot', () async {
    final controller = BudgetStateController.seeded();
    final snapshot = controller.state.toSnapshot();
    const service = EncryptedBackupService();

    final payload = await service.exportBackup(
      snapshot: snapshot,
      passphrase: 'correct horse battery staple',
    );
    final restored = await service.importBackup(
      payload: payload,
      passphrase: 'correct horse battery staple',
    );

    expect(payload, contains('pocketpulse.encrypted-backup.v1'));
    expect(payload, isNot(contains('Kopi @ Canteen')));
    expect(restored.transactions.length, snapshot.transactions.length);
    expect(restored.plan.monthlyLimit.minorUnits, 90000);
    expect(restored.preferences.onboardingComplete, isTrue);
  });

  test('rejects short backup passphrases', () async {
    final controller = BudgetStateController.seeded();

    expect(
      () => const EncryptedBackupService().exportBackup(
        snapshot: controller.state.toSnapshot(),
        passphrase: 'short',
      ),
      throwsA(isA<FormatException>()),
    );
  });
}
