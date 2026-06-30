import 'dart:convert';

import 'package:cryptography/cryptography.dart';
import 'package:flutter/material.dart';

import '../../../core/money/money.dart';
import '../../../core/preferences/app_preferences.dart';
import '../../budget/data/local_budget_store.dart';
import '../../budget/domain/budget_plan.dart';
import '../../rules/domain/rule.dart';
import '../../transactions/domain/budget_transaction.dart';
import '../../transactions/domain/category.dart';

class EncryptedBackupService {
  const EncryptedBackupService();

  static const _format = 'pocketpulse.encrypted-backup.v1';
  static const _iterations = 120000;

  Future<String> exportBackup({
    required LocalBudgetSnapshot snapshot,
    required String passphrase,
  }) async {
    final cleanPassphrase = passphrase.trim();
    if (cleanPassphrase.length < 8) {
      throw const FormatException('Backup passphrase must be 8+ characters');
    }

    final cipher = AesGcm.with256bits();
    final salt = SecretKeyData.random(length: 16).bytes;
    final nonce = cipher.newNonce();
    final secretKey = await _deriveKey(cleanPassphrase, salt);
    final plaintext = utf8.encode(jsonEncode(_snapshotToJson(snapshot)));
    final secretBox = await cipher.encrypt(
      plaintext,
      secretKey: secretKey,
      nonce: nonce,
    );

    return jsonEncode({
      'format': _format,
      'kdf': 'pbkdf2-hmac-sha256',
      'iterations': _iterations,
      'cipher': 'aes-256-gcm',
      'salt': base64Encode(salt),
      'nonce': base64Encode(secretBox.nonce),
      'mac': base64Encode(secretBox.mac.bytes),
      'ciphertext': base64Encode(secretBox.cipherText),
    });
  }

  Future<LocalBudgetSnapshot> importBackup({
    required String payload,
    required String passphrase,
  }) async {
    try {
      final envelope = jsonDecode(payload.trim()) as Map<String, dynamic>;
      if (envelope['format'] != _format) {
        throw const FormatException('Unsupported backup format');
      }

      final salt = base64Decode(envelope['salt'] as String);
      final nonce = base64Decode(envelope['nonce'] as String);
      final mac = Mac(base64Decode(envelope['mac'] as String));
      final ciphertext = base64Decode(envelope['ciphertext'] as String);
      final secretKey = await _deriveKey(passphrase.trim(), salt);
      final clearBytes = await AesGcm.with256bits().decrypt(
        SecretBox(ciphertext, nonce: nonce, mac: mac),
        secretKey: secretKey,
      );
      final snapshotJson =
          jsonDecode(utf8.decode(clearBytes)) as Map<String, dynamic>;
      return _snapshotFromJson(snapshotJson);
    } on FormatException {
      rethrow;
    } catch (_) {
      throw const FormatException('Could not decrypt backup');
    }
  }

  Future<SecretKey> _deriveKey(String passphrase, List<int> salt) {
    return Pbkdf2(
      macAlgorithm: Hmac.sha256(),
      iterations: _iterations,
      bits: 256,
    ).deriveKeyFromPassword(password: passphrase, nonce: salt);
  }

  Map<String, dynamic> _snapshotToJson(LocalBudgetSnapshot snapshot) {
    return {
      'version': 1,
      'exportedAt': DateTime.now().toIso8601String(),
      'plan': _planToJson(snapshot.plan),
      'categories': snapshot.categories.map(_categoryToJson).toList(),
      'transactions': snapshot.transactions.map(_transactionToJson).toList(),
      'rules': snapshot.rules.map(_ruleToJson).toList(),
      'preferences': snapshot.preferences.toJson(),
    };
  }

  LocalBudgetSnapshot _snapshotFromJson(Map<String, dynamic> json) {
    return LocalBudgetSnapshot(
      plan: _planFromJson(json['plan'] as Map<String, dynamic>),
      categories: [
        for (final item in json['categories'] as List<dynamic>)
          _categoryFromJson(item as Map<String, dynamic>),
      ],
      transactions: [
        for (final item in json['transactions'] as List<dynamic>)
          _transactionFromJson(item as Map<String, dynamic>),
      ],
      rules: [
        for (final item in json['rules'] as List<dynamic>)
          _ruleFromJson(item as Map<String, dynamic>),
      ],
      preferences: AppPreferences.fromJson(
        json['preferences'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> _planToJson(BudgetPlan plan) {
    return {
      'id': plan.id,
      'mode': plan.mode.name,
      'monthlyLimit': _moneyToJson(plan.monthlyLimit),
      'savingsGoal': _moneyToJson(plan.savingsGoal),
      'cashBuffer': _moneyToJson(plan.cashBuffer),
      'fixedBills': _moneyToJson(plan.fixedBills),
      'categoryBudgets': [
        for (final budget in plan.categoryBudgets)
          {
            'categoryId': budget.categoryId,
            'limit': _moneyToJson(budget.limit),
          },
      ],
      'periodStart': plan.periodStart.toIso8601String(),
      'periodEnd': plan.periodEnd.toIso8601String(),
    };
  }

  BudgetPlan _planFromJson(Map<String, dynamic> json) {
    return BudgetPlan(
      id: json['id'] as String,
      mode: _enumByName(BudgetMode.values, json['mode'] as String),
      monthlyLimit:
          _moneyFromJson(json['monthlyLimit'] as Map<String, dynamic>),
      savingsGoal: _moneyFromJson(json['savingsGoal'] as Map<String, dynamic>),
      cashBuffer: _moneyFromJson(json['cashBuffer'] as Map<String, dynamic>),
      fixedBills: _moneyFromJson(json['fixedBills'] as Map<String, dynamic>),
      categoryBudgets: [
        for (final item in json['categoryBudgets'] as List<dynamic>)
          CategoryBudget(
            categoryId: (item as Map<String, dynamic>)['categoryId'] as String,
            limit: _moneyFromJson(item['limit'] as Map<String, dynamic>),
          ),
      ],
      periodStart: DateTime.parse(json['periodStart'] as String),
      periodEnd: DateTime.parse(json['periodEnd'] as String),
    );
  }

  Map<String, dynamic> _categoryToJson(SpendingCategory category) {
    return {
      'id': category.id,
      'name': category.name,
      'colorValue': _colorToArgb(category.color),
      'iconCodePoint': category.icon.codePoint,
    };
  }

  SpendingCategory _categoryFromJson(Map<String, dynamic> json) {
    return SpendingCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      color: Color(json['colorValue'] as int),
      icon: IconData(
        json['iconCodePoint'] as int,
        fontFamily: 'MaterialIcons',
      ),
    );
  }

  Map<String, dynamic> _transactionToJson(BudgetTransaction transaction) {
    return {
      'id': transaction.id,
      'amount': _moneyToJson(transaction.amount),
      'direction': transaction.direction.name,
      'merchantName': transaction.merchantName,
      'categoryId': transaction.categoryId,
      'accountId': transaction.accountId,
      'occurredAt': transaction.occurredAt.toIso8601String(),
      'capturedAt': transaction.capturedAt.toIso8601String(),
      'sourceType': transaction.sourceType.name,
      'sourceApp': transaction.sourceApp,
      'rawSourceId': transaction.rawSourceId,
      'confidence': transaction.confidence,
      'status': transaction.status.name,
      'notes': transaction.notes,
      'isRecurring': transaction.isRecurring,
      'createdAt': transaction.createdAt.toIso8601String(),
      'updatedAt': transaction.updatedAt.toIso8601String(),
    };
  }

  BudgetTransaction _transactionFromJson(Map<String, dynamic> json) {
    return BudgetTransaction(
      id: json['id'] as String,
      amount: _moneyFromJson(json['amount'] as Map<String, dynamic>),
      direction:
          _enumByName(TransactionDirection.values, json['direction'] as String),
      merchantName: json['merchantName'] as String,
      categoryId: json['categoryId'] as String,
      accountId: json['accountId'] as String,
      occurredAt: DateTime.parse(json['occurredAt'] as String),
      capturedAt: DateTime.parse(json['capturedAt'] as String),
      sourceType: _enumByName(
          TransactionSourceType.values, json['sourceType'] as String),
      sourceApp: json['sourceApp'] as String?,
      rawSourceId: json['rawSourceId'] as String?,
      confidence: (json['confidence'] as num).toDouble(),
      status: _enumByName(TransactionStatus.values, json['status'] as String),
      notes: json['notes'] as String?,
      isRecurring: json['isRecurring'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> _ruleToJson(TransactionRule rule) {
    return {
      'id': rule.id,
      'name': rule.name,
      'priority': rule.priority,
      'enabled': rule.enabled,
      'createdAt': rule.createdAt.toIso8601String(),
      'updatedAt': rule.updatedAt.toIso8601String(),
      'condition': {
        'merchantContains': rule.condition.merchantContains,
        'sourceApp': rule.condition.sourceApp,
        'textContains': rule.condition.textContains,
      },
      'action': {
        'categoryId': rule.action.categoryId,
        'markAsTransfer': rule.action.markAsTransfer,
        'ignore': rule.action.ignore,
      },
    };
  }

  TransactionRule _ruleFromJson(Map<String, dynamic> json) {
    final condition = json['condition'] as Map<String, dynamic>;
    final action = json['action'] as Map<String, dynamic>;
    return TransactionRule(
      id: json['id'] as String,
      name: json['name'] as String,
      priority: json['priority'] as int,
      enabled: json['enabled'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      condition: RuleCondition(
        merchantContains: condition['merchantContains'] as String?,
        sourceApp: condition['sourceApp'] as String?,
        textContains: condition['textContains'] as String?,
      ),
      action: RuleAction(
        categoryId: action['categoryId'] as String?,
        markAsTransfer: action['markAsTransfer'] as bool? ?? false,
        ignore: action['ignore'] as bool? ?? false,
      ),
    );
  }

  Map<String, dynamic> _moneyToJson(Money money) {
    return {'minorUnits': money.minorUnits, 'currency': money.currency};
  }

  Money _moneyFromJson(Map<String, dynamic> json) {
    return Money(
      json['minorUnits'] as int,
      currency: json['currency'] as String? ?? 'SGD',
    );
  }

  T _enumByName<T extends Enum>(List<T> values, String name) {
    return values.firstWhere((value) => value.name == name);
  }

  int _colorToArgb(Color color) {
    return (color.a * 255).round() << 24 |
        (color.r * 255).round() << 16 |
        (color.g * 255).round() << 8 |
        (color.b * 255).round();
  }
}
