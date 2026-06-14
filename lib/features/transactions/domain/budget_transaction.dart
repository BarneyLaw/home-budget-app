import '../../../core/money/money.dart';

enum TransactionDirection { expense, income, transfer }

enum TransactionSourceType { notification, email, manual, import, api }

enum TransactionStatus { confirmed, needsReview, ignored, duplicate }

class BudgetTransaction {
  const BudgetTransaction({
    required this.id,
    required this.amount,
    required this.direction,
    required this.merchantName,
    required this.categoryId,
    required this.accountId,
    required this.occurredAt,
    required this.capturedAt,
    required this.sourceType,
    required this.confidence,
    required this.status,
    this.sourceApp,
    this.rawSourceId,
    this.notes,
    this.isRecurring = false,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final Money amount;
  final TransactionDirection direction;
  final String merchantName;
  final String categoryId;
  final String accountId;
  final DateTime occurredAt;
  final DateTime capturedAt;
  final TransactionSourceType sourceType;
  final String? sourceApp;
  final String? rawSourceId;
  final double confidence;
  final TransactionStatus status;
  final String? notes;
  final bool isRecurring;
  final DateTime createdAt;
  final DateTime updatedAt;

  BudgetTransaction copyWith({
    String? id,
    Money? amount,
    TransactionDirection? direction,
    String? merchantName,
    String? categoryId,
    String? accountId,
    DateTime? occurredAt,
    DateTime? capturedAt,
    TransactionSourceType? sourceType,
    String? sourceApp,
    String? rawSourceId,
    double? confidence,
    TransactionStatus? status,
    String? notes,
    bool? isRecurring,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return BudgetTransaction(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      direction: direction ?? this.direction,
      merchantName: merchantName ?? this.merchantName,
      categoryId: categoryId ?? this.categoryId,
      accountId: accountId ?? this.accountId,
      occurredAt: occurredAt ?? this.occurredAt,
      capturedAt: capturedAt ?? this.capturedAt,
      sourceType: sourceType ?? this.sourceType,
      sourceApp: sourceApp ?? this.sourceApp,
      rawSourceId: rawSourceId ?? this.rawSourceId,
      confidence: confidence ?? this.confidence,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      isRecurring: isRecurring ?? this.isRecurring,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
