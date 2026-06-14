class TransactionRule {
  const TransactionRule({
    required this.id,
    required this.name,
    required this.priority,
    required this.condition,
    required this.action,
    required this.enabled,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String name;
  final int priority;
  final RuleCondition condition;
  final RuleAction action;
  final bool enabled;
  final DateTime createdAt;
  final DateTime updatedAt;
}

class RuleCondition {
  const RuleCondition({
    this.merchantContains,
    this.sourceApp,
    this.textContains,
  });

  final String? merchantContains;
  final String? sourceApp;
  final String? textContains;
}

class RuleAction {
  const RuleAction({
    this.categoryId,
    this.markAsTransfer = false,
    this.ignore = false,
  });

  final String? categoryId;
  final bool markAsTransfer;
  final bool ignore;
}
