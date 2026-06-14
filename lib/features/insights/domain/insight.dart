enum InsightSeverity { info, warning, urgent }

class SpendingInsight {
  const SpendingInsight({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.severity,
    required this.supportingTransactionIds,
    required this.suggestedAction,
    required this.status,
    required this.createdAt,
  });

  final String id;
  final String type;
  final String title;
  final String description;
  final InsightSeverity severity;
  final List<String> supportingTransactionIds;
  final String suggestedAction;
  final String status;
  final DateTime createdAt;
}
