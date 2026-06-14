import '../../transactions/domain/budget_transaction.dart';
import '../domain/rule.dart';

class RulesEngine {
  const RulesEngine();

  BudgetTransaction apply(
    BudgetTransaction transaction,
    List<TransactionRule> rules,
  ) {
    final enabledRules = [...rules.where((rule) => rule.enabled)]
      ..sort((a, b) => a.priority.compareTo(b.priority));

    var updated = transaction;
    for (final rule in enabledRules) {
      if (!_matches(updated, rule.condition)) {
        continue;
      }
      updated = updated.copyWith(
        categoryId: rule.action.categoryId ?? updated.categoryId,
        direction: rule.action.markAsTransfer
            ? TransactionDirection.transfer
            : updated.direction,
        status: rule.action.ignore ? TransactionStatus.ignored : updated.status,
      );
    }
    return updated;
  }

  bool _matches(BudgetTransaction transaction, RuleCondition condition) {
    final merchantMatches = condition.merchantContains == null ||
        transaction.merchantName
            .toLowerCase()
            .contains(condition.merchantContains!.toLowerCase());
    final sourceMatches = condition.sourceApp == null ||
        transaction.sourceApp == condition.sourceApp;
    final textMatches = condition.textContains == null ||
        (transaction.notes ?? '')
            .toLowerCase()
            .contains(condition.textContains!.toLowerCase());
    return merchantMatches && sourceMatches && textMatches;
  }
}
