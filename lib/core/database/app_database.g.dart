// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TransactionRecordsTable extends TransactionRecords
    with TableInfo<$TransactionRecordsTable, TransactionRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransactionRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMinorMeta =
      const VerificationMeta('amountMinor');
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
      'amount_minor', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('SGD'));
  static const VerificationMeta _directionMeta =
      const VerificationMeta('direction');
  @override
  late final GeneratedColumn<String> direction = GeneratedColumn<String>(
      'direction', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _merchantNameMeta =
      const VerificationMeta('merchantName');
  @override
  late final GeneratedColumn<String> merchantName = GeneratedColumn<String>(
      'merchant_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _normalizedMerchantIdMeta =
      const VerificationMeta('normalizedMerchantId');
  @override
  late final GeneratedColumn<String> normalizedMerchantId =
      GeneratedColumn<String>('normalized_merchant_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _accountIdMeta =
      const VerificationMeta('accountId');
  @override
  late final GeneratedColumn<String> accountId = GeneratedColumn<String>(
      'account_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _occurredAtMeta =
      const VerificationMeta('occurredAt');
  @override
  late final GeneratedColumn<DateTime> occurredAt = GeneratedColumn<DateTime>(
      'occurred_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _capturedAtMeta =
      const VerificationMeta('capturedAt');
  @override
  late final GeneratedColumn<DateTime> capturedAt = GeneratedColumn<DateTime>(
      'captured_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _sourceTypeMeta =
      const VerificationMeta('sourceType');
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
      'source_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceAppMeta =
      const VerificationMeta('sourceApp');
  @override
  late final GeneratedColumn<String> sourceApp = GeneratedColumn<String>(
      'source_app', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _rawSourceIdMeta =
      const VerificationMeta('rawSourceId');
  @override
  late final GeneratedColumn<String> rawSourceId = GeneratedColumn<String>(
      'raw_source_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _confidenceMeta =
      const VerificationMeta('confidence');
  @override
  late final GeneratedColumn<double> confidence = GeneratedColumn<double>(
      'confidence', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isRecurringMeta =
      const VerificationMeta('isRecurring');
  @override
  late final GeneratedColumn<bool> isRecurring = GeneratedColumn<bool>(
      'is_recurring', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_recurring" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        amountMinor,
        currency,
        direction,
        merchantName,
        normalizedMerchantId,
        categoryId,
        accountId,
        occurredAt,
        capturedAt,
        sourceType,
        sourceApp,
        rawSourceId,
        confidence,
        status,
        notes,
        isRecurring,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaction_records';
  @override
  VerificationContext validateIntegrity(Insertable<TransactionRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
          _amountMinorMeta,
          amountMinor.isAcceptableOrUnknown(
              data['amount_minor']!, _amountMinorMeta));
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    }
    if (data.containsKey('direction')) {
      context.handle(_directionMeta,
          direction.isAcceptableOrUnknown(data['direction']!, _directionMeta));
    } else if (isInserting) {
      context.missing(_directionMeta);
    }
    if (data.containsKey('merchant_name')) {
      context.handle(
          _merchantNameMeta,
          merchantName.isAcceptableOrUnknown(
              data['merchant_name']!, _merchantNameMeta));
    } else if (isInserting) {
      context.missing(_merchantNameMeta);
    }
    if (data.containsKey('normalized_merchant_id')) {
      context.handle(
          _normalizedMerchantIdMeta,
          normalizedMerchantId.isAcceptableOrUnknown(
              data['normalized_merchant_id']!, _normalizedMerchantIdMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(_accountIdMeta,
          accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta));
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('occurred_at')) {
      context.handle(
          _occurredAtMeta,
          occurredAt.isAcceptableOrUnknown(
              data['occurred_at']!, _occurredAtMeta));
    } else if (isInserting) {
      context.missing(_occurredAtMeta);
    }
    if (data.containsKey('captured_at')) {
      context.handle(
          _capturedAtMeta,
          capturedAt.isAcceptableOrUnknown(
              data['captured_at']!, _capturedAtMeta));
    } else if (isInserting) {
      context.missing(_capturedAtMeta);
    }
    if (data.containsKey('source_type')) {
      context.handle(
          _sourceTypeMeta,
          sourceType.isAcceptableOrUnknown(
              data['source_type']!, _sourceTypeMeta));
    } else if (isInserting) {
      context.missing(_sourceTypeMeta);
    }
    if (data.containsKey('source_app')) {
      context.handle(_sourceAppMeta,
          sourceApp.isAcceptableOrUnknown(data['source_app']!, _sourceAppMeta));
    }
    if (data.containsKey('raw_source_id')) {
      context.handle(
          _rawSourceIdMeta,
          rawSourceId.isAcceptableOrUnknown(
              data['raw_source_id']!, _rawSourceIdMeta));
    }
    if (data.containsKey('confidence')) {
      context.handle(
          _confidenceMeta,
          confidence.isAcceptableOrUnknown(
              data['confidence']!, _confidenceMeta));
    } else if (isInserting) {
      context.missing(_confidenceMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('is_recurring')) {
      context.handle(
          _isRecurringMeta,
          isRecurring.isAcceptableOrUnknown(
              data['is_recurring']!, _isRecurringMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransactionRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransactionRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      amountMinor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount_minor'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      direction: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}direction'])!,
      merchantName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}merchant_name'])!,
      normalizedMerchantId: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}normalized_merchant_id']),
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id'])!,
      accountId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}account_id'])!,
      occurredAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}occurred_at'])!,
      capturedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}captured_at'])!,
      sourceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_type'])!,
      sourceApp: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_app']),
      rawSourceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}raw_source_id']),
      confidence: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}confidence'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      isRecurring: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_recurring'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $TransactionRecordsTable createAlias(String alias) {
    return $TransactionRecordsTable(attachedDatabase, alias);
  }
}

class TransactionRecord extends DataClass
    implements Insertable<TransactionRecord> {
  final String id;
  final int amountMinor;
  final String currency;
  final String direction;
  final String merchantName;
  final String? normalizedMerchantId;
  final String categoryId;
  final String accountId;
  final DateTime occurredAt;
  final DateTime capturedAt;
  final String sourceType;
  final String? sourceApp;
  final String? rawSourceId;
  final double confidence;
  final String status;
  final String? notes;
  final bool isRecurring;
  final DateTime createdAt;
  final DateTime updatedAt;
  const TransactionRecord(
      {required this.id,
      required this.amountMinor,
      required this.currency,
      required this.direction,
      required this.merchantName,
      this.normalizedMerchantId,
      required this.categoryId,
      required this.accountId,
      required this.occurredAt,
      required this.capturedAt,
      required this.sourceType,
      this.sourceApp,
      this.rawSourceId,
      required this.confidence,
      required this.status,
      this.notes,
      required this.isRecurring,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['amount_minor'] = Variable<int>(amountMinor);
    map['currency'] = Variable<String>(currency);
    map['direction'] = Variable<String>(direction);
    map['merchant_name'] = Variable<String>(merchantName);
    if (!nullToAbsent || normalizedMerchantId != null) {
      map['normalized_merchant_id'] = Variable<String>(normalizedMerchantId);
    }
    map['category_id'] = Variable<String>(categoryId);
    map['account_id'] = Variable<String>(accountId);
    map['occurred_at'] = Variable<DateTime>(occurredAt);
    map['captured_at'] = Variable<DateTime>(capturedAt);
    map['source_type'] = Variable<String>(sourceType);
    if (!nullToAbsent || sourceApp != null) {
      map['source_app'] = Variable<String>(sourceApp);
    }
    if (!nullToAbsent || rawSourceId != null) {
      map['raw_source_id'] = Variable<String>(rawSourceId);
    }
    map['confidence'] = Variable<double>(confidence);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_recurring'] = Variable<bool>(isRecurring);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TransactionRecordsCompanion toCompanion(bool nullToAbsent) {
    return TransactionRecordsCompanion(
      id: Value(id),
      amountMinor: Value(amountMinor),
      currency: Value(currency),
      direction: Value(direction),
      merchantName: Value(merchantName),
      normalizedMerchantId: normalizedMerchantId == null && nullToAbsent
          ? const Value.absent()
          : Value(normalizedMerchantId),
      categoryId: Value(categoryId),
      accountId: Value(accountId),
      occurredAt: Value(occurredAt),
      capturedAt: Value(capturedAt),
      sourceType: Value(sourceType),
      sourceApp: sourceApp == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceApp),
      rawSourceId: rawSourceId == null && nullToAbsent
          ? const Value.absent()
          : Value(rawSourceId),
      confidence: Value(confidence),
      status: Value(status),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      isRecurring: Value(isRecurring),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory TransactionRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransactionRecord(
      id: serializer.fromJson<String>(json['id']),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
      currency: serializer.fromJson<String>(json['currency']),
      direction: serializer.fromJson<String>(json['direction']),
      merchantName: serializer.fromJson<String>(json['merchantName']),
      normalizedMerchantId:
          serializer.fromJson<String?>(json['normalizedMerchantId']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      accountId: serializer.fromJson<String>(json['accountId']),
      occurredAt: serializer.fromJson<DateTime>(json['occurredAt']),
      capturedAt: serializer.fromJson<DateTime>(json['capturedAt']),
      sourceType: serializer.fromJson<String>(json['sourceType']),
      sourceApp: serializer.fromJson<String?>(json['sourceApp']),
      rawSourceId: serializer.fromJson<String?>(json['rawSourceId']),
      confidence: serializer.fromJson<double>(json['confidence']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String?>(json['notes']),
      isRecurring: serializer.fromJson<bool>(json['isRecurring']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'amountMinor': serializer.toJson<int>(amountMinor),
      'currency': serializer.toJson<String>(currency),
      'direction': serializer.toJson<String>(direction),
      'merchantName': serializer.toJson<String>(merchantName),
      'normalizedMerchantId': serializer.toJson<String?>(normalizedMerchantId),
      'categoryId': serializer.toJson<String>(categoryId),
      'accountId': serializer.toJson<String>(accountId),
      'occurredAt': serializer.toJson<DateTime>(occurredAt),
      'capturedAt': serializer.toJson<DateTime>(capturedAt),
      'sourceType': serializer.toJson<String>(sourceType),
      'sourceApp': serializer.toJson<String?>(sourceApp),
      'rawSourceId': serializer.toJson<String?>(rawSourceId),
      'confidence': serializer.toJson<double>(confidence),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String?>(notes),
      'isRecurring': serializer.toJson<bool>(isRecurring),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  TransactionRecord copyWith(
          {String? id,
          int? amountMinor,
          String? currency,
          String? direction,
          String? merchantName,
          Value<String?> normalizedMerchantId = const Value.absent(),
          String? categoryId,
          String? accountId,
          DateTime? occurredAt,
          DateTime? capturedAt,
          String? sourceType,
          Value<String?> sourceApp = const Value.absent(),
          Value<String?> rawSourceId = const Value.absent(),
          double? confidence,
          String? status,
          Value<String?> notes = const Value.absent(),
          bool? isRecurring,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      TransactionRecord(
        id: id ?? this.id,
        amountMinor: amountMinor ?? this.amountMinor,
        currency: currency ?? this.currency,
        direction: direction ?? this.direction,
        merchantName: merchantName ?? this.merchantName,
        normalizedMerchantId: normalizedMerchantId.present
            ? normalizedMerchantId.value
            : this.normalizedMerchantId,
        categoryId: categoryId ?? this.categoryId,
        accountId: accountId ?? this.accountId,
        occurredAt: occurredAt ?? this.occurredAt,
        capturedAt: capturedAt ?? this.capturedAt,
        sourceType: sourceType ?? this.sourceType,
        sourceApp: sourceApp.present ? sourceApp.value : this.sourceApp,
        rawSourceId: rawSourceId.present ? rawSourceId.value : this.rawSourceId,
        confidence: confidence ?? this.confidence,
        status: status ?? this.status,
        notes: notes.present ? notes.value : this.notes,
        isRecurring: isRecurring ?? this.isRecurring,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  TransactionRecord copyWithCompanion(TransactionRecordsCompanion data) {
    return TransactionRecord(
      id: data.id.present ? data.id.value : this.id,
      amountMinor:
          data.amountMinor.present ? data.amountMinor.value : this.amountMinor,
      currency: data.currency.present ? data.currency.value : this.currency,
      direction: data.direction.present ? data.direction.value : this.direction,
      merchantName: data.merchantName.present
          ? data.merchantName.value
          : this.merchantName,
      normalizedMerchantId: data.normalizedMerchantId.present
          ? data.normalizedMerchantId.value
          : this.normalizedMerchantId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      occurredAt:
          data.occurredAt.present ? data.occurredAt.value : this.occurredAt,
      capturedAt:
          data.capturedAt.present ? data.capturedAt.value : this.capturedAt,
      sourceType:
          data.sourceType.present ? data.sourceType.value : this.sourceType,
      sourceApp: data.sourceApp.present ? data.sourceApp.value : this.sourceApp,
      rawSourceId:
          data.rawSourceId.present ? data.rawSourceId.value : this.rawSourceId,
      confidence:
          data.confidence.present ? data.confidence.value : this.confidence,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      isRecurring:
          data.isRecurring.present ? data.isRecurring.value : this.isRecurring,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransactionRecord(')
          ..write('id: $id, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('currency: $currency, ')
          ..write('direction: $direction, ')
          ..write('merchantName: $merchantName, ')
          ..write('normalizedMerchantId: $normalizedMerchantId, ')
          ..write('categoryId: $categoryId, ')
          ..write('accountId: $accountId, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('capturedAt: $capturedAt, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourceApp: $sourceApp, ')
          ..write('rawSourceId: $rawSourceId, ')
          ..write('confidence: $confidence, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('isRecurring: $isRecurring, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      amountMinor,
      currency,
      direction,
      merchantName,
      normalizedMerchantId,
      categoryId,
      accountId,
      occurredAt,
      capturedAt,
      sourceType,
      sourceApp,
      rawSourceId,
      confidence,
      status,
      notes,
      isRecurring,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransactionRecord &&
          other.id == this.id &&
          other.amountMinor == this.amountMinor &&
          other.currency == this.currency &&
          other.direction == this.direction &&
          other.merchantName == this.merchantName &&
          other.normalizedMerchantId == this.normalizedMerchantId &&
          other.categoryId == this.categoryId &&
          other.accountId == this.accountId &&
          other.occurredAt == this.occurredAt &&
          other.capturedAt == this.capturedAt &&
          other.sourceType == this.sourceType &&
          other.sourceApp == this.sourceApp &&
          other.rawSourceId == this.rawSourceId &&
          other.confidence == this.confidence &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.isRecurring == this.isRecurring &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TransactionRecordsCompanion extends UpdateCompanion<TransactionRecord> {
  final Value<String> id;
  final Value<int> amountMinor;
  final Value<String> currency;
  final Value<String> direction;
  final Value<String> merchantName;
  final Value<String?> normalizedMerchantId;
  final Value<String> categoryId;
  final Value<String> accountId;
  final Value<DateTime> occurredAt;
  final Value<DateTime> capturedAt;
  final Value<String> sourceType;
  final Value<String?> sourceApp;
  final Value<String?> rawSourceId;
  final Value<double> confidence;
  final Value<String> status;
  final Value<String?> notes;
  final Value<bool> isRecurring;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const TransactionRecordsCompanion({
    this.id = const Value.absent(),
    this.amountMinor = const Value.absent(),
    this.currency = const Value.absent(),
    this.direction = const Value.absent(),
    this.merchantName = const Value.absent(),
    this.normalizedMerchantId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.occurredAt = const Value.absent(),
    this.capturedAt = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.sourceApp = const Value.absent(),
    this.rawSourceId = const Value.absent(),
    this.confidence = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.isRecurring = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TransactionRecordsCompanion.insert({
    required String id,
    required int amountMinor,
    this.currency = const Value.absent(),
    required String direction,
    required String merchantName,
    this.normalizedMerchantId = const Value.absent(),
    required String categoryId,
    required String accountId,
    required DateTime occurredAt,
    required DateTime capturedAt,
    required String sourceType,
    this.sourceApp = const Value.absent(),
    this.rawSourceId = const Value.absent(),
    required double confidence,
    required String status,
    this.notes = const Value.absent(),
    this.isRecurring = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        amountMinor = Value(amountMinor),
        direction = Value(direction),
        merchantName = Value(merchantName),
        categoryId = Value(categoryId),
        accountId = Value(accountId),
        occurredAt = Value(occurredAt),
        capturedAt = Value(capturedAt),
        sourceType = Value(sourceType),
        confidence = Value(confidence),
        status = Value(status),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<TransactionRecord> custom({
    Expression<String>? id,
    Expression<int>? amountMinor,
    Expression<String>? currency,
    Expression<String>? direction,
    Expression<String>? merchantName,
    Expression<String>? normalizedMerchantId,
    Expression<String>? categoryId,
    Expression<String>? accountId,
    Expression<DateTime>? occurredAt,
    Expression<DateTime>? capturedAt,
    Expression<String>? sourceType,
    Expression<String>? sourceApp,
    Expression<String>? rawSourceId,
    Expression<double>? confidence,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<bool>? isRecurring,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amountMinor != null) 'amount_minor': amountMinor,
      if (currency != null) 'currency': currency,
      if (direction != null) 'direction': direction,
      if (merchantName != null) 'merchant_name': merchantName,
      if (normalizedMerchantId != null)
        'normalized_merchant_id': normalizedMerchantId,
      if (categoryId != null) 'category_id': categoryId,
      if (accountId != null) 'account_id': accountId,
      if (occurredAt != null) 'occurred_at': occurredAt,
      if (capturedAt != null) 'captured_at': capturedAt,
      if (sourceType != null) 'source_type': sourceType,
      if (sourceApp != null) 'source_app': sourceApp,
      if (rawSourceId != null) 'raw_source_id': rawSourceId,
      if (confidence != null) 'confidence': confidence,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (isRecurring != null) 'is_recurring': isRecurring,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TransactionRecordsCompanion copyWith(
      {Value<String>? id,
      Value<int>? amountMinor,
      Value<String>? currency,
      Value<String>? direction,
      Value<String>? merchantName,
      Value<String?>? normalizedMerchantId,
      Value<String>? categoryId,
      Value<String>? accountId,
      Value<DateTime>? occurredAt,
      Value<DateTime>? capturedAt,
      Value<String>? sourceType,
      Value<String?>? sourceApp,
      Value<String?>? rawSourceId,
      Value<double>? confidence,
      Value<String>? status,
      Value<String?>? notes,
      Value<bool>? isRecurring,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return TransactionRecordsCompanion(
      id: id ?? this.id,
      amountMinor: amountMinor ?? this.amountMinor,
      currency: currency ?? this.currency,
      direction: direction ?? this.direction,
      merchantName: merchantName ?? this.merchantName,
      normalizedMerchantId: normalizedMerchantId ?? this.normalizedMerchantId,
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
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (direction.present) {
      map['direction'] = Variable<String>(direction.value);
    }
    if (merchantName.present) {
      map['merchant_name'] = Variable<String>(merchantName.value);
    }
    if (normalizedMerchantId.present) {
      map['normalized_merchant_id'] =
          Variable<String>(normalizedMerchantId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<String>(accountId.value);
    }
    if (occurredAt.present) {
      map['occurred_at'] = Variable<DateTime>(occurredAt.value);
    }
    if (capturedAt.present) {
      map['captured_at'] = Variable<DateTime>(capturedAt.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (sourceApp.present) {
      map['source_app'] = Variable<String>(sourceApp.value);
    }
    if (rawSourceId.present) {
      map['raw_source_id'] = Variable<String>(rawSourceId.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<double>(confidence.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isRecurring.present) {
      map['is_recurring'] = Variable<bool>(isRecurring.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransactionRecordsCompanion(')
          ..write('id: $id, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('currency: $currency, ')
          ..write('direction: $direction, ')
          ..write('merchantName: $merchantName, ')
          ..write('normalizedMerchantId: $normalizedMerchantId, ')
          ..write('categoryId: $categoryId, ')
          ..write('accountId: $accountId, ')
          ..write('occurredAt: $occurredAt, ')
          ..write('capturedAt: $capturedAt, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourceApp: $sourceApp, ')
          ..write('rawSourceId: $rawSourceId, ')
          ..write('confidence: $confidence, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('isRecurring: $isRecurring, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoryRecordsTable extends CategoryRecords
    with TableInfo<$CategoryRecordsTable, CategoryRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _colorValueMeta =
      const VerificationMeta('colorValue');
  @override
  late final GeneratedColumn<int> colorValue = GeneratedColumn<int>(
      'color_value', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _iconCodePointMeta =
      const VerificationMeta('iconCodePoint');
  @override
  late final GeneratedColumn<int> iconCodePoint = GeneratedColumn<int>(
      'icon_code_point', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sortOrderMeta =
      const VerificationMeta('sortOrder');
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
      'sort_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _isArchivedMeta =
      const VerificationMeta('isArchived');
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
      'is_archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_archived" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, colorValue, iconCodePoint, sortOrder, isArchived];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_records';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color_value')) {
      context.handle(
          _colorValueMeta,
          colorValue.isAcceptableOrUnknown(
              data['color_value']!, _colorValueMeta));
    } else if (isInserting) {
      context.missing(_colorValueMeta);
    }
    if (data.containsKey('icon_code_point')) {
      context.handle(
          _iconCodePointMeta,
          iconCodePoint.isAcceptableOrUnknown(
              data['icon_code_point']!, _iconCodePointMeta));
    } else if (isInserting) {
      context.missing(_iconCodePointMeta);
    }
    if (data.containsKey('sort_order')) {
      context.handle(_sortOrderMeta,
          sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta));
    }
    if (data.containsKey('is_archived')) {
      context.handle(
          _isArchivedMeta,
          isArchived.isAcceptableOrUnknown(
              data['is_archived']!, _isArchivedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      colorValue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color_value'])!,
      iconCodePoint: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}icon_code_point'])!,
      sortOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sort_order'])!,
      isArchived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_archived'])!,
    );
  }

  @override
  $CategoryRecordsTable createAlias(String alias) {
    return $CategoryRecordsTable(attachedDatabase, alias);
  }
}

class CategoryRecord extends DataClass implements Insertable<CategoryRecord> {
  final String id;
  final String name;
  final int colorValue;
  final int iconCodePoint;
  final int sortOrder;
  final bool isArchived;
  const CategoryRecord(
      {required this.id,
      required this.name,
      required this.colorValue,
      required this.iconCodePoint,
      required this.sortOrder,
      required this.isArchived});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['color_value'] = Variable<int>(colorValue);
    map['icon_code_point'] = Variable<int>(iconCodePoint);
    map['sort_order'] = Variable<int>(sortOrder);
    map['is_archived'] = Variable<bool>(isArchived);
    return map;
  }

  CategoryRecordsCompanion toCompanion(bool nullToAbsent) {
    return CategoryRecordsCompanion(
      id: Value(id),
      name: Value(name),
      colorValue: Value(colorValue),
      iconCodePoint: Value(iconCodePoint),
      sortOrder: Value(sortOrder),
      isArchived: Value(isArchived),
    );
  }

  factory CategoryRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryRecord(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      colorValue: serializer.fromJson<int>(json['colorValue']),
      iconCodePoint: serializer.fromJson<int>(json['iconCodePoint']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'colorValue': serializer.toJson<int>(colorValue),
      'iconCodePoint': serializer.toJson<int>(iconCodePoint),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'isArchived': serializer.toJson<bool>(isArchived),
    };
  }

  CategoryRecord copyWith(
          {String? id,
          String? name,
          int? colorValue,
          int? iconCodePoint,
          int? sortOrder,
          bool? isArchived}) =>
      CategoryRecord(
        id: id ?? this.id,
        name: name ?? this.name,
        colorValue: colorValue ?? this.colorValue,
        iconCodePoint: iconCodePoint ?? this.iconCodePoint,
        sortOrder: sortOrder ?? this.sortOrder,
        isArchived: isArchived ?? this.isArchived,
      );
  CategoryRecord copyWithCompanion(CategoryRecordsCompanion data) {
    return CategoryRecord(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      colorValue:
          data.colorValue.present ? data.colorValue.value : this.colorValue,
      iconCodePoint: data.iconCodePoint.present
          ? data.iconCodePoint.value
          : this.iconCodePoint,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      isArchived:
          data.isArchived.present ? data.isArchived.value : this.isArchived,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryRecord(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorValue: $colorValue, ')
          ..write('iconCodePoint: $iconCodePoint, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isArchived: $isArchived')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, colorValue, iconCodePoint, sortOrder, isArchived);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryRecord &&
          other.id == this.id &&
          other.name == this.name &&
          other.colorValue == this.colorValue &&
          other.iconCodePoint == this.iconCodePoint &&
          other.sortOrder == this.sortOrder &&
          other.isArchived == this.isArchived);
}

class CategoryRecordsCompanion extends UpdateCompanion<CategoryRecord> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> colorValue;
  final Value<int> iconCodePoint;
  final Value<int> sortOrder;
  final Value<bool> isArchived;
  final Value<int> rowid;
  const CategoryRecordsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.iconCodePoint = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoryRecordsCompanion.insert({
    required String id,
    required String name,
    required int colorValue,
    required int iconCodePoint,
    this.sortOrder = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        colorValue = Value(colorValue),
        iconCodePoint = Value(iconCodePoint);
  static Insertable<CategoryRecord> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? colorValue,
    Expression<int>? iconCodePoint,
    Expression<int>? sortOrder,
    Expression<bool>? isArchived,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (colorValue != null) 'color_value': colorValue,
      if (iconCodePoint != null) 'icon_code_point': iconCodePoint,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (isArchived != null) 'is_archived': isArchived,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoryRecordsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<int>? colorValue,
      Value<int>? iconCodePoint,
      Value<int>? sortOrder,
      Value<bool>? isArchived,
      Value<int>? rowid}) {
    return CategoryRecordsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      colorValue: colorValue ?? this.colorValue,
      iconCodePoint: iconCodePoint ?? this.iconCodePoint,
      sortOrder: sortOrder ?? this.sortOrder,
      isArchived: isArchived ?? this.isArchived,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (colorValue.present) {
      map['color_value'] = Variable<int>(colorValue.value);
    }
    if (iconCodePoint.present) {
      map['icon_code_point'] = Variable<int>(iconCodePoint.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryRecordsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorValue: $colorValue, ')
          ..write('iconCodePoint: $iconCodePoint, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isArchived: $isArchived, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BudgetRecordsTable extends BudgetRecords
    with TableInfo<$BudgetRecordsTable, BudgetRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BudgetRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _modeMeta = const VerificationMeta('mode');
  @override
  late final GeneratedColumn<String> mode = GeneratedColumn<String>(
      'mode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _monthlyLimitMinorMeta =
      const VerificationMeta('monthlyLimitMinor');
  @override
  late final GeneratedColumn<int> monthlyLimitMinor = GeneratedColumn<int>(
      'monthly_limit_minor', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _savingsGoalMinorMeta =
      const VerificationMeta('savingsGoalMinor');
  @override
  late final GeneratedColumn<int> savingsGoalMinor = GeneratedColumn<int>(
      'savings_goal_minor', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _cashBufferMinorMeta =
      const VerificationMeta('cashBufferMinor');
  @override
  late final GeneratedColumn<int> cashBufferMinor = GeneratedColumn<int>(
      'cash_buffer_minor', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _fixedBillsMinorMeta =
      const VerificationMeta('fixedBillsMinor');
  @override
  late final GeneratedColumn<int> fixedBillsMinor = GeneratedColumn<int>(
      'fixed_bills_minor', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('SGD'));
  static const VerificationMeta _periodStartMeta =
      const VerificationMeta('periodStart');
  @override
  late final GeneratedColumn<DateTime> periodStart = GeneratedColumn<DateTime>(
      'period_start', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _periodEndMeta =
      const VerificationMeta('periodEnd');
  @override
  late final GeneratedColumn<DateTime> periodEnd = GeneratedColumn<DateTime>(
      'period_end', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        mode,
        monthlyLimitMinor,
        savingsGoalMinor,
        cashBufferMinor,
        fixedBillsMinor,
        currency,
        periodStart,
        periodEnd,
        isActive,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'budget_records';
  @override
  VerificationContext validateIntegrity(Insertable<BudgetRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mode')) {
      context.handle(
          _modeMeta, mode.isAcceptableOrUnknown(data['mode']!, _modeMeta));
    } else if (isInserting) {
      context.missing(_modeMeta);
    }
    if (data.containsKey('monthly_limit_minor')) {
      context.handle(
          _monthlyLimitMinorMeta,
          monthlyLimitMinor.isAcceptableOrUnknown(
              data['monthly_limit_minor']!, _monthlyLimitMinorMeta));
    } else if (isInserting) {
      context.missing(_monthlyLimitMinorMeta);
    }
    if (data.containsKey('savings_goal_minor')) {
      context.handle(
          _savingsGoalMinorMeta,
          savingsGoalMinor.isAcceptableOrUnknown(
              data['savings_goal_minor']!, _savingsGoalMinorMeta));
    } else if (isInserting) {
      context.missing(_savingsGoalMinorMeta);
    }
    if (data.containsKey('cash_buffer_minor')) {
      context.handle(
          _cashBufferMinorMeta,
          cashBufferMinor.isAcceptableOrUnknown(
              data['cash_buffer_minor']!, _cashBufferMinorMeta));
    } else if (isInserting) {
      context.missing(_cashBufferMinorMeta);
    }
    if (data.containsKey('fixed_bills_minor')) {
      context.handle(
          _fixedBillsMinorMeta,
          fixedBillsMinor.isAcceptableOrUnknown(
              data['fixed_bills_minor']!, _fixedBillsMinorMeta));
    } else if (isInserting) {
      context.missing(_fixedBillsMinorMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    }
    if (data.containsKey('period_start')) {
      context.handle(
          _periodStartMeta,
          periodStart.isAcceptableOrUnknown(
              data['period_start']!, _periodStartMeta));
    } else if (isInserting) {
      context.missing(_periodStartMeta);
    }
    if (data.containsKey('period_end')) {
      context.handle(_periodEndMeta,
          periodEnd.isAcceptableOrUnknown(data['period_end']!, _periodEndMeta));
    } else if (isInserting) {
      context.missing(_periodEndMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BudgetRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BudgetRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      mode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mode'])!,
      monthlyLimitMinor: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}monthly_limit_minor'])!,
      savingsGoalMinor: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}savings_goal_minor'])!,
      cashBufferMinor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cash_buffer_minor'])!,
      fixedBillsMinor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}fixed_bills_minor'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      periodStart: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}period_start'])!,
      periodEnd: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}period_end'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $BudgetRecordsTable createAlias(String alias) {
    return $BudgetRecordsTable(attachedDatabase, alias);
  }
}

class BudgetRecord extends DataClass implements Insertable<BudgetRecord> {
  final String id;
  final String mode;
  final int monthlyLimitMinor;
  final int savingsGoalMinor;
  final int cashBufferMinor;
  final int fixedBillsMinor;
  final String currency;
  final DateTime periodStart;
  final DateTime periodEnd;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  const BudgetRecord(
      {required this.id,
      required this.mode,
      required this.monthlyLimitMinor,
      required this.savingsGoalMinor,
      required this.cashBufferMinor,
      required this.fixedBillsMinor,
      required this.currency,
      required this.periodStart,
      required this.periodEnd,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mode'] = Variable<String>(mode);
    map['monthly_limit_minor'] = Variable<int>(monthlyLimitMinor);
    map['savings_goal_minor'] = Variable<int>(savingsGoalMinor);
    map['cash_buffer_minor'] = Variable<int>(cashBufferMinor);
    map['fixed_bills_minor'] = Variable<int>(fixedBillsMinor);
    map['currency'] = Variable<String>(currency);
    map['period_start'] = Variable<DateTime>(periodStart);
    map['period_end'] = Variable<DateTime>(periodEnd);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BudgetRecordsCompanion toCompanion(bool nullToAbsent) {
    return BudgetRecordsCompanion(
      id: Value(id),
      mode: Value(mode),
      monthlyLimitMinor: Value(monthlyLimitMinor),
      savingsGoalMinor: Value(savingsGoalMinor),
      cashBufferMinor: Value(cashBufferMinor),
      fixedBillsMinor: Value(fixedBillsMinor),
      currency: Value(currency),
      periodStart: Value(periodStart),
      periodEnd: Value(periodEnd),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory BudgetRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BudgetRecord(
      id: serializer.fromJson<String>(json['id']),
      mode: serializer.fromJson<String>(json['mode']),
      monthlyLimitMinor: serializer.fromJson<int>(json['monthlyLimitMinor']),
      savingsGoalMinor: serializer.fromJson<int>(json['savingsGoalMinor']),
      cashBufferMinor: serializer.fromJson<int>(json['cashBufferMinor']),
      fixedBillsMinor: serializer.fromJson<int>(json['fixedBillsMinor']),
      currency: serializer.fromJson<String>(json['currency']),
      periodStart: serializer.fromJson<DateTime>(json['periodStart']),
      periodEnd: serializer.fromJson<DateTime>(json['periodEnd']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mode': serializer.toJson<String>(mode),
      'monthlyLimitMinor': serializer.toJson<int>(monthlyLimitMinor),
      'savingsGoalMinor': serializer.toJson<int>(savingsGoalMinor),
      'cashBufferMinor': serializer.toJson<int>(cashBufferMinor),
      'fixedBillsMinor': serializer.toJson<int>(fixedBillsMinor),
      'currency': serializer.toJson<String>(currency),
      'periodStart': serializer.toJson<DateTime>(periodStart),
      'periodEnd': serializer.toJson<DateTime>(periodEnd),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BudgetRecord copyWith(
          {String? id,
          String? mode,
          int? monthlyLimitMinor,
          int? savingsGoalMinor,
          int? cashBufferMinor,
          int? fixedBillsMinor,
          String? currency,
          DateTime? periodStart,
          DateTime? periodEnd,
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      BudgetRecord(
        id: id ?? this.id,
        mode: mode ?? this.mode,
        monthlyLimitMinor: monthlyLimitMinor ?? this.monthlyLimitMinor,
        savingsGoalMinor: savingsGoalMinor ?? this.savingsGoalMinor,
        cashBufferMinor: cashBufferMinor ?? this.cashBufferMinor,
        fixedBillsMinor: fixedBillsMinor ?? this.fixedBillsMinor,
        currency: currency ?? this.currency,
        periodStart: periodStart ?? this.periodStart,
        periodEnd: periodEnd ?? this.periodEnd,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  BudgetRecord copyWithCompanion(BudgetRecordsCompanion data) {
    return BudgetRecord(
      id: data.id.present ? data.id.value : this.id,
      mode: data.mode.present ? data.mode.value : this.mode,
      monthlyLimitMinor: data.monthlyLimitMinor.present
          ? data.monthlyLimitMinor.value
          : this.monthlyLimitMinor,
      savingsGoalMinor: data.savingsGoalMinor.present
          ? data.savingsGoalMinor.value
          : this.savingsGoalMinor,
      cashBufferMinor: data.cashBufferMinor.present
          ? data.cashBufferMinor.value
          : this.cashBufferMinor,
      fixedBillsMinor: data.fixedBillsMinor.present
          ? data.fixedBillsMinor.value
          : this.fixedBillsMinor,
      currency: data.currency.present ? data.currency.value : this.currency,
      periodStart:
          data.periodStart.present ? data.periodStart.value : this.periodStart,
      periodEnd: data.periodEnd.present ? data.periodEnd.value : this.periodEnd,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BudgetRecord(')
          ..write('id: $id, ')
          ..write('mode: $mode, ')
          ..write('monthlyLimitMinor: $monthlyLimitMinor, ')
          ..write('savingsGoalMinor: $savingsGoalMinor, ')
          ..write('cashBufferMinor: $cashBufferMinor, ')
          ..write('fixedBillsMinor: $fixedBillsMinor, ')
          ..write('currency: $currency, ')
          ..write('periodStart: $periodStart, ')
          ..write('periodEnd: $periodEnd, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      mode,
      monthlyLimitMinor,
      savingsGoalMinor,
      cashBufferMinor,
      fixedBillsMinor,
      currency,
      periodStart,
      periodEnd,
      isActive,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BudgetRecord &&
          other.id == this.id &&
          other.mode == this.mode &&
          other.monthlyLimitMinor == this.monthlyLimitMinor &&
          other.savingsGoalMinor == this.savingsGoalMinor &&
          other.cashBufferMinor == this.cashBufferMinor &&
          other.fixedBillsMinor == this.fixedBillsMinor &&
          other.currency == this.currency &&
          other.periodStart == this.periodStart &&
          other.periodEnd == this.periodEnd &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BudgetRecordsCompanion extends UpdateCompanion<BudgetRecord> {
  final Value<String> id;
  final Value<String> mode;
  final Value<int> monthlyLimitMinor;
  final Value<int> savingsGoalMinor;
  final Value<int> cashBufferMinor;
  final Value<int> fixedBillsMinor;
  final Value<String> currency;
  final Value<DateTime> periodStart;
  final Value<DateTime> periodEnd;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const BudgetRecordsCompanion({
    this.id = const Value.absent(),
    this.mode = const Value.absent(),
    this.monthlyLimitMinor = const Value.absent(),
    this.savingsGoalMinor = const Value.absent(),
    this.cashBufferMinor = const Value.absent(),
    this.fixedBillsMinor = const Value.absent(),
    this.currency = const Value.absent(),
    this.periodStart = const Value.absent(),
    this.periodEnd = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BudgetRecordsCompanion.insert({
    required String id,
    required String mode,
    required int monthlyLimitMinor,
    required int savingsGoalMinor,
    required int cashBufferMinor,
    required int fixedBillsMinor,
    this.currency = const Value.absent(),
    required DateTime periodStart,
    required DateTime periodEnd,
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        mode = Value(mode),
        monthlyLimitMinor = Value(monthlyLimitMinor),
        savingsGoalMinor = Value(savingsGoalMinor),
        cashBufferMinor = Value(cashBufferMinor),
        fixedBillsMinor = Value(fixedBillsMinor),
        periodStart = Value(periodStart),
        periodEnd = Value(periodEnd),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<BudgetRecord> custom({
    Expression<String>? id,
    Expression<String>? mode,
    Expression<int>? monthlyLimitMinor,
    Expression<int>? savingsGoalMinor,
    Expression<int>? cashBufferMinor,
    Expression<int>? fixedBillsMinor,
    Expression<String>? currency,
    Expression<DateTime>? periodStart,
    Expression<DateTime>? periodEnd,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mode != null) 'mode': mode,
      if (monthlyLimitMinor != null) 'monthly_limit_minor': monthlyLimitMinor,
      if (savingsGoalMinor != null) 'savings_goal_minor': savingsGoalMinor,
      if (cashBufferMinor != null) 'cash_buffer_minor': cashBufferMinor,
      if (fixedBillsMinor != null) 'fixed_bills_minor': fixedBillsMinor,
      if (currency != null) 'currency': currency,
      if (periodStart != null) 'period_start': periodStart,
      if (periodEnd != null) 'period_end': periodEnd,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BudgetRecordsCompanion copyWith(
      {Value<String>? id,
      Value<String>? mode,
      Value<int>? monthlyLimitMinor,
      Value<int>? savingsGoalMinor,
      Value<int>? cashBufferMinor,
      Value<int>? fixedBillsMinor,
      Value<String>? currency,
      Value<DateTime>? periodStart,
      Value<DateTime>? periodEnd,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return BudgetRecordsCompanion(
      id: id ?? this.id,
      mode: mode ?? this.mode,
      monthlyLimitMinor: monthlyLimitMinor ?? this.monthlyLimitMinor,
      savingsGoalMinor: savingsGoalMinor ?? this.savingsGoalMinor,
      cashBufferMinor: cashBufferMinor ?? this.cashBufferMinor,
      fixedBillsMinor: fixedBillsMinor ?? this.fixedBillsMinor,
      currency: currency ?? this.currency,
      periodStart: periodStart ?? this.periodStart,
      periodEnd: periodEnd ?? this.periodEnd,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(mode.value);
    }
    if (monthlyLimitMinor.present) {
      map['monthly_limit_minor'] = Variable<int>(monthlyLimitMinor.value);
    }
    if (savingsGoalMinor.present) {
      map['savings_goal_minor'] = Variable<int>(savingsGoalMinor.value);
    }
    if (cashBufferMinor.present) {
      map['cash_buffer_minor'] = Variable<int>(cashBufferMinor.value);
    }
    if (fixedBillsMinor.present) {
      map['fixed_bills_minor'] = Variable<int>(fixedBillsMinor.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (periodStart.present) {
      map['period_start'] = Variable<DateTime>(periodStart.value);
    }
    if (periodEnd.present) {
      map['period_end'] = Variable<DateTime>(periodEnd.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BudgetRecordsCompanion(')
          ..write('id: $id, ')
          ..write('mode: $mode, ')
          ..write('monthlyLimitMinor: $monthlyLimitMinor, ')
          ..write('savingsGoalMinor: $savingsGoalMinor, ')
          ..write('cashBufferMinor: $cashBufferMinor, ')
          ..write('fixedBillsMinor: $fixedBillsMinor, ')
          ..write('currency: $currency, ')
          ..write('periodStart: $periodStart, ')
          ..write('periodEnd: $periodEnd, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoryBudgetRecordsTable extends CategoryBudgetRecords
    with TableInfo<$CategoryBudgetRecordsTable, CategoryBudgetRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryBudgetRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _budgetIdMeta =
      const VerificationMeta('budgetId');
  @override
  late final GeneratedColumn<String> budgetId = GeneratedColumn<String>(
      'budget_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _limitMinorMeta =
      const VerificationMeta('limitMinor');
  @override
  late final GeneratedColumn<int> limitMinor = GeneratedColumn<int>(
      'limit_minor', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('SGD'));
  @override
  List<GeneratedColumn> get $columns =>
      [budgetId, categoryId, limitMinor, currency];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_budget_records';
  @override
  VerificationContext validateIntegrity(
      Insertable<CategoryBudgetRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('budget_id')) {
      context.handle(_budgetIdMeta,
          budgetId.isAcceptableOrUnknown(data['budget_id']!, _budgetIdMeta));
    } else if (isInserting) {
      context.missing(_budgetIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('limit_minor')) {
      context.handle(
          _limitMinorMeta,
          limitMinor.isAcceptableOrUnknown(
              data['limit_minor']!, _limitMinorMeta));
    } else if (isInserting) {
      context.missing(_limitMinorMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {budgetId, categoryId};
  @override
  CategoryBudgetRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryBudgetRecord(
      budgetId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}budget_id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id'])!,
      limitMinor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}limit_minor'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
    );
  }

  @override
  $CategoryBudgetRecordsTable createAlias(String alias) {
    return $CategoryBudgetRecordsTable(attachedDatabase, alias);
  }
}

class CategoryBudgetRecord extends DataClass
    implements Insertable<CategoryBudgetRecord> {
  final String budgetId;
  final String categoryId;
  final int limitMinor;
  final String currency;
  const CategoryBudgetRecord(
      {required this.budgetId,
      required this.categoryId,
      required this.limitMinor,
      required this.currency});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['budget_id'] = Variable<String>(budgetId);
    map['category_id'] = Variable<String>(categoryId);
    map['limit_minor'] = Variable<int>(limitMinor);
    map['currency'] = Variable<String>(currency);
    return map;
  }

  CategoryBudgetRecordsCompanion toCompanion(bool nullToAbsent) {
    return CategoryBudgetRecordsCompanion(
      budgetId: Value(budgetId),
      categoryId: Value(categoryId),
      limitMinor: Value(limitMinor),
      currency: Value(currency),
    );
  }

  factory CategoryBudgetRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryBudgetRecord(
      budgetId: serializer.fromJson<String>(json['budgetId']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      limitMinor: serializer.fromJson<int>(json['limitMinor']),
      currency: serializer.fromJson<String>(json['currency']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'budgetId': serializer.toJson<String>(budgetId),
      'categoryId': serializer.toJson<String>(categoryId),
      'limitMinor': serializer.toJson<int>(limitMinor),
      'currency': serializer.toJson<String>(currency),
    };
  }

  CategoryBudgetRecord copyWith(
          {String? budgetId,
          String? categoryId,
          int? limitMinor,
          String? currency}) =>
      CategoryBudgetRecord(
        budgetId: budgetId ?? this.budgetId,
        categoryId: categoryId ?? this.categoryId,
        limitMinor: limitMinor ?? this.limitMinor,
        currency: currency ?? this.currency,
      );
  CategoryBudgetRecord copyWithCompanion(CategoryBudgetRecordsCompanion data) {
    return CategoryBudgetRecord(
      budgetId: data.budgetId.present ? data.budgetId.value : this.budgetId,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      limitMinor:
          data.limitMinor.present ? data.limitMinor.value : this.limitMinor,
      currency: data.currency.present ? data.currency.value : this.currency,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryBudgetRecord(')
          ..write('budgetId: $budgetId, ')
          ..write('categoryId: $categoryId, ')
          ..write('limitMinor: $limitMinor, ')
          ..write('currency: $currency')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(budgetId, categoryId, limitMinor, currency);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryBudgetRecord &&
          other.budgetId == this.budgetId &&
          other.categoryId == this.categoryId &&
          other.limitMinor == this.limitMinor &&
          other.currency == this.currency);
}

class CategoryBudgetRecordsCompanion
    extends UpdateCompanion<CategoryBudgetRecord> {
  final Value<String> budgetId;
  final Value<String> categoryId;
  final Value<int> limitMinor;
  final Value<String> currency;
  final Value<int> rowid;
  const CategoryBudgetRecordsCompanion({
    this.budgetId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.limitMinor = const Value.absent(),
    this.currency = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoryBudgetRecordsCompanion.insert({
    required String budgetId,
    required String categoryId,
    required int limitMinor,
    this.currency = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : budgetId = Value(budgetId),
        categoryId = Value(categoryId),
        limitMinor = Value(limitMinor);
  static Insertable<CategoryBudgetRecord> custom({
    Expression<String>? budgetId,
    Expression<String>? categoryId,
    Expression<int>? limitMinor,
    Expression<String>? currency,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (budgetId != null) 'budget_id': budgetId,
      if (categoryId != null) 'category_id': categoryId,
      if (limitMinor != null) 'limit_minor': limitMinor,
      if (currency != null) 'currency': currency,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoryBudgetRecordsCompanion copyWith(
      {Value<String>? budgetId,
      Value<String>? categoryId,
      Value<int>? limitMinor,
      Value<String>? currency,
      Value<int>? rowid}) {
    return CategoryBudgetRecordsCompanion(
      budgetId: budgetId ?? this.budgetId,
      categoryId: categoryId ?? this.categoryId,
      limitMinor: limitMinor ?? this.limitMinor,
      currency: currency ?? this.currency,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (budgetId.present) {
      map['budget_id'] = Variable<String>(budgetId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (limitMinor.present) {
      map['limit_minor'] = Variable<int>(limitMinor.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryBudgetRecordsCompanion(')
          ..write('budgetId: $budgetId, ')
          ..write('categoryId: $categoryId, ')
          ..write('limitMinor: $limitMinor, ')
          ..write('currency: $currency, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecurringRuleRecordsTable extends RecurringRuleRecords
    with TableInfo<$RecurringRuleRecordsTable, RecurringRuleRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecurringRuleRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _merchantNameMeta =
      const VerificationMeta('merchantName');
  @override
  late final GeneratedColumn<String> merchantName = GeneratedColumn<String>(
      'merchant_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMinorMeta =
      const VerificationMeta('amountMinor');
  @override
  late final GeneratedColumn<int> amountMinor = GeneratedColumn<int>(
      'amount_minor', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('SGD'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cadenceMeta =
      const VerificationMeta('cadence');
  @override
  late final GeneratedColumn<String> cadence = GeneratedColumn<String>(
      'cadence', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nextExpectedAtMeta =
      const VerificationMeta('nextExpectedAt');
  @override
  late final GeneratedColumn<DateTime> nextExpectedAt =
      GeneratedColumn<DateTime>('next_expected_at', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _enabledMeta =
      const VerificationMeta('enabled');
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
      'enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("enabled" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        merchantName,
        amountMinor,
        currency,
        categoryId,
        cadence,
        nextExpectedAt,
        enabled,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recurring_rule_records';
  @override
  VerificationContext validateIntegrity(
      Insertable<RecurringRuleRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('merchant_name')) {
      context.handle(
          _merchantNameMeta,
          merchantName.isAcceptableOrUnknown(
              data['merchant_name']!, _merchantNameMeta));
    } else if (isInserting) {
      context.missing(_merchantNameMeta);
    }
    if (data.containsKey('amount_minor')) {
      context.handle(
          _amountMinorMeta,
          amountMinor.isAcceptableOrUnknown(
              data['amount_minor']!, _amountMinorMeta));
    } else if (isInserting) {
      context.missing(_amountMinorMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('cadence')) {
      context.handle(_cadenceMeta,
          cadence.isAcceptableOrUnknown(data['cadence']!, _cadenceMeta));
    } else if (isInserting) {
      context.missing(_cadenceMeta);
    }
    if (data.containsKey('next_expected_at')) {
      context.handle(
          _nextExpectedAtMeta,
          nextExpectedAt.isAcceptableOrUnknown(
              data['next_expected_at']!, _nextExpectedAtMeta));
    } else if (isInserting) {
      context.missing(_nextExpectedAtMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(_enabledMeta,
          enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecurringRuleRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecurringRuleRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      merchantName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}merchant_name'])!,
      amountMinor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount_minor'])!,
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id'])!,
      cadence: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cadence'])!,
      nextExpectedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}next_expected_at'])!,
      enabled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}enabled'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $RecurringRuleRecordsTable createAlias(String alias) {
    return $RecurringRuleRecordsTable(attachedDatabase, alias);
  }
}

class RecurringRuleRecord extends DataClass
    implements Insertable<RecurringRuleRecord> {
  final String id;
  final String merchantName;
  final int amountMinor;
  final String currency;
  final String categoryId;
  final String cadence;
  final DateTime nextExpectedAt;
  final bool enabled;
  final DateTime createdAt;
  final DateTime updatedAt;
  const RecurringRuleRecord(
      {required this.id,
      required this.merchantName,
      required this.amountMinor,
      required this.currency,
      required this.categoryId,
      required this.cadence,
      required this.nextExpectedAt,
      required this.enabled,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['merchant_name'] = Variable<String>(merchantName);
    map['amount_minor'] = Variable<int>(amountMinor);
    map['currency'] = Variable<String>(currency);
    map['category_id'] = Variable<String>(categoryId);
    map['cadence'] = Variable<String>(cadence);
    map['next_expected_at'] = Variable<DateTime>(nextExpectedAt);
    map['enabled'] = Variable<bool>(enabled);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  RecurringRuleRecordsCompanion toCompanion(bool nullToAbsent) {
    return RecurringRuleRecordsCompanion(
      id: Value(id),
      merchantName: Value(merchantName),
      amountMinor: Value(amountMinor),
      currency: Value(currency),
      categoryId: Value(categoryId),
      cadence: Value(cadence),
      nextExpectedAt: Value(nextExpectedAt),
      enabled: Value(enabled),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory RecurringRuleRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecurringRuleRecord(
      id: serializer.fromJson<String>(json['id']),
      merchantName: serializer.fromJson<String>(json['merchantName']),
      amountMinor: serializer.fromJson<int>(json['amountMinor']),
      currency: serializer.fromJson<String>(json['currency']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
      cadence: serializer.fromJson<String>(json['cadence']),
      nextExpectedAt: serializer.fromJson<DateTime>(json['nextExpectedAt']),
      enabled: serializer.fromJson<bool>(json['enabled']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'merchantName': serializer.toJson<String>(merchantName),
      'amountMinor': serializer.toJson<int>(amountMinor),
      'currency': serializer.toJson<String>(currency),
      'categoryId': serializer.toJson<String>(categoryId),
      'cadence': serializer.toJson<String>(cadence),
      'nextExpectedAt': serializer.toJson<DateTime>(nextExpectedAt),
      'enabled': serializer.toJson<bool>(enabled),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  RecurringRuleRecord copyWith(
          {String? id,
          String? merchantName,
          int? amountMinor,
          String? currency,
          String? categoryId,
          String? cadence,
          DateTime? nextExpectedAt,
          bool? enabled,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      RecurringRuleRecord(
        id: id ?? this.id,
        merchantName: merchantName ?? this.merchantName,
        amountMinor: amountMinor ?? this.amountMinor,
        currency: currency ?? this.currency,
        categoryId: categoryId ?? this.categoryId,
        cadence: cadence ?? this.cadence,
        nextExpectedAt: nextExpectedAt ?? this.nextExpectedAt,
        enabled: enabled ?? this.enabled,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  RecurringRuleRecord copyWithCompanion(RecurringRuleRecordsCompanion data) {
    return RecurringRuleRecord(
      id: data.id.present ? data.id.value : this.id,
      merchantName: data.merchantName.present
          ? data.merchantName.value
          : this.merchantName,
      amountMinor:
          data.amountMinor.present ? data.amountMinor.value : this.amountMinor,
      currency: data.currency.present ? data.currency.value : this.currency,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      cadence: data.cadence.present ? data.cadence.value : this.cadence,
      nextExpectedAt: data.nextExpectedAt.present
          ? data.nextExpectedAt.value
          : this.nextExpectedAt,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecurringRuleRecord(')
          ..write('id: $id, ')
          ..write('merchantName: $merchantName, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('currency: $currency, ')
          ..write('categoryId: $categoryId, ')
          ..write('cadence: $cadence, ')
          ..write('nextExpectedAt: $nextExpectedAt, ')
          ..write('enabled: $enabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, merchantName, amountMinor, currency,
      categoryId, cadence, nextExpectedAt, enabled, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecurringRuleRecord &&
          other.id == this.id &&
          other.merchantName == this.merchantName &&
          other.amountMinor == this.amountMinor &&
          other.currency == this.currency &&
          other.categoryId == this.categoryId &&
          other.cadence == this.cadence &&
          other.nextExpectedAt == this.nextExpectedAt &&
          other.enabled == this.enabled &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class RecurringRuleRecordsCompanion
    extends UpdateCompanion<RecurringRuleRecord> {
  final Value<String> id;
  final Value<String> merchantName;
  final Value<int> amountMinor;
  final Value<String> currency;
  final Value<String> categoryId;
  final Value<String> cadence;
  final Value<DateTime> nextExpectedAt;
  final Value<bool> enabled;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const RecurringRuleRecordsCompanion({
    this.id = const Value.absent(),
    this.merchantName = const Value.absent(),
    this.amountMinor = const Value.absent(),
    this.currency = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.cadence = const Value.absent(),
    this.nextExpectedAt = const Value.absent(),
    this.enabled = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecurringRuleRecordsCompanion.insert({
    required String id,
    required String merchantName,
    required int amountMinor,
    this.currency = const Value.absent(),
    required String categoryId,
    required String cadence,
    required DateTime nextExpectedAt,
    this.enabled = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        merchantName = Value(merchantName),
        amountMinor = Value(amountMinor),
        categoryId = Value(categoryId),
        cadence = Value(cadence),
        nextExpectedAt = Value(nextExpectedAt),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<RecurringRuleRecord> custom({
    Expression<String>? id,
    Expression<String>? merchantName,
    Expression<int>? amountMinor,
    Expression<String>? currency,
    Expression<String>? categoryId,
    Expression<String>? cadence,
    Expression<DateTime>? nextExpectedAt,
    Expression<bool>? enabled,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (merchantName != null) 'merchant_name': merchantName,
      if (amountMinor != null) 'amount_minor': amountMinor,
      if (currency != null) 'currency': currency,
      if (categoryId != null) 'category_id': categoryId,
      if (cadence != null) 'cadence': cadence,
      if (nextExpectedAt != null) 'next_expected_at': nextExpectedAt,
      if (enabled != null) 'enabled': enabled,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecurringRuleRecordsCompanion copyWith(
      {Value<String>? id,
      Value<String>? merchantName,
      Value<int>? amountMinor,
      Value<String>? currency,
      Value<String>? categoryId,
      Value<String>? cadence,
      Value<DateTime>? nextExpectedAt,
      Value<bool>? enabled,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return RecurringRuleRecordsCompanion(
      id: id ?? this.id,
      merchantName: merchantName ?? this.merchantName,
      amountMinor: amountMinor ?? this.amountMinor,
      currency: currency ?? this.currency,
      categoryId: categoryId ?? this.categoryId,
      cadence: cadence ?? this.cadence,
      nextExpectedAt: nextExpectedAt ?? this.nextExpectedAt,
      enabled: enabled ?? this.enabled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (merchantName.present) {
      map['merchant_name'] = Variable<String>(merchantName.value);
    }
    if (amountMinor.present) {
      map['amount_minor'] = Variable<int>(amountMinor.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (cadence.present) {
      map['cadence'] = Variable<String>(cadence.value);
    }
    if (nextExpectedAt.present) {
      map['next_expected_at'] = Variable<DateTime>(nextExpectedAt.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecurringRuleRecordsCompanion(')
          ..write('id: $id, ')
          ..write('merchantName: $merchantName, ')
          ..write('amountMinor: $amountMinor, ')
          ..write('currency: $currency, ')
          ..write('categoryId: $categoryId, ')
          ..write('cadence: $cadence, ')
          ..write('nextExpectedAt: $nextExpectedAt, ')
          ..write('enabled: $enabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserRuleRecordsTable extends UserRuleRecords
    with TableInfo<$UserRuleRecordsTable, UserRuleRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserRuleRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
      'priority', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _merchantContainsMeta =
      const VerificationMeta('merchantContains');
  @override
  late final GeneratedColumn<String> merchantContains = GeneratedColumn<String>(
      'merchant_contains', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceAppMeta =
      const VerificationMeta('sourceApp');
  @override
  late final GeneratedColumn<String> sourceApp = GeneratedColumn<String>(
      'source_app', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _textContainsMeta =
      const VerificationMeta('textContains');
  @override
  late final GeneratedColumn<String> textContains = GeneratedColumn<String>(
      'text_contains', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _markAsTransferMeta =
      const VerificationMeta('markAsTransfer');
  @override
  late final GeneratedColumn<bool> markAsTransfer = GeneratedColumn<bool>(
      'mark_as_transfer', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("mark_as_transfer" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _ignoreMeta = const VerificationMeta('ignore');
  @override
  late final GeneratedColumn<bool> ignore = GeneratedColumn<bool>(
      'ignore', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("ignore" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _enabledMeta =
      const VerificationMeta('enabled');
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
      'enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("enabled" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        priority,
        merchantContains,
        sourceApp,
        textContains,
        categoryId,
        markAsTransfer,
        ignore,
        enabled,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_rule_records';
  @override
  VerificationContext validateIntegrity(Insertable<UserRuleRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    } else if (isInserting) {
      context.missing(_priorityMeta);
    }
    if (data.containsKey('merchant_contains')) {
      context.handle(
          _merchantContainsMeta,
          merchantContains.isAcceptableOrUnknown(
              data['merchant_contains']!, _merchantContainsMeta));
    }
    if (data.containsKey('source_app')) {
      context.handle(_sourceAppMeta,
          sourceApp.isAcceptableOrUnknown(data['source_app']!, _sourceAppMeta));
    }
    if (data.containsKey('text_contains')) {
      context.handle(
          _textContainsMeta,
          textContains.isAcceptableOrUnknown(
              data['text_contains']!, _textContainsMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('mark_as_transfer')) {
      context.handle(
          _markAsTransferMeta,
          markAsTransfer.isAcceptableOrUnknown(
              data['mark_as_transfer']!, _markAsTransferMeta));
    }
    if (data.containsKey('ignore')) {
      context.handle(_ignoreMeta,
          ignore.isAcceptableOrUnknown(data['ignore']!, _ignoreMeta));
    }
    if (data.containsKey('enabled')) {
      context.handle(_enabledMeta,
          enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserRuleRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserRuleRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}priority'])!,
      merchantContains: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}merchant_contains']),
      sourceApp: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_app']),
      textContains: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}text_contains']),
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id']),
      markAsTransfer: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}mark_as_transfer'])!,
      ignore: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}ignore'])!,
      enabled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}enabled'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $UserRuleRecordsTable createAlias(String alias) {
    return $UserRuleRecordsTable(attachedDatabase, alias);
  }
}

class UserRuleRecord extends DataClass implements Insertable<UserRuleRecord> {
  final String id;
  final String name;
  final int priority;
  final String? merchantContains;
  final String? sourceApp;
  final String? textContains;
  final String? categoryId;
  final bool markAsTransfer;
  final bool ignore;
  final bool enabled;
  final DateTime createdAt;
  final DateTime updatedAt;
  const UserRuleRecord(
      {required this.id,
      required this.name,
      required this.priority,
      this.merchantContains,
      this.sourceApp,
      this.textContains,
      this.categoryId,
      required this.markAsTransfer,
      required this.ignore,
      required this.enabled,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['priority'] = Variable<int>(priority);
    if (!nullToAbsent || merchantContains != null) {
      map['merchant_contains'] = Variable<String>(merchantContains);
    }
    if (!nullToAbsent || sourceApp != null) {
      map['source_app'] = Variable<String>(sourceApp);
    }
    if (!nullToAbsent || textContains != null) {
      map['text_contains'] = Variable<String>(textContains);
    }
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    map['mark_as_transfer'] = Variable<bool>(markAsTransfer);
    map['ignore'] = Variable<bool>(ignore);
    map['enabled'] = Variable<bool>(enabled);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  UserRuleRecordsCompanion toCompanion(bool nullToAbsent) {
    return UserRuleRecordsCompanion(
      id: Value(id),
      name: Value(name),
      priority: Value(priority),
      merchantContains: merchantContains == null && nullToAbsent
          ? const Value.absent()
          : Value(merchantContains),
      sourceApp: sourceApp == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceApp),
      textContains: textContains == null && nullToAbsent
          ? const Value.absent()
          : Value(textContains),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      markAsTransfer: Value(markAsTransfer),
      ignore: Value(ignore),
      enabled: Value(enabled),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UserRuleRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserRuleRecord(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      priority: serializer.fromJson<int>(json['priority']),
      merchantContains: serializer.fromJson<String?>(json['merchantContains']),
      sourceApp: serializer.fromJson<String?>(json['sourceApp']),
      textContains: serializer.fromJson<String?>(json['textContains']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      markAsTransfer: serializer.fromJson<bool>(json['markAsTransfer']),
      ignore: serializer.fromJson<bool>(json['ignore']),
      enabled: serializer.fromJson<bool>(json['enabled']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'priority': serializer.toJson<int>(priority),
      'merchantContains': serializer.toJson<String?>(merchantContains),
      'sourceApp': serializer.toJson<String?>(sourceApp),
      'textContains': serializer.toJson<String?>(textContains),
      'categoryId': serializer.toJson<String?>(categoryId),
      'markAsTransfer': serializer.toJson<bool>(markAsTransfer),
      'ignore': serializer.toJson<bool>(ignore),
      'enabled': serializer.toJson<bool>(enabled),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  UserRuleRecord copyWith(
          {String? id,
          String? name,
          int? priority,
          Value<String?> merchantContains = const Value.absent(),
          Value<String?> sourceApp = const Value.absent(),
          Value<String?> textContains = const Value.absent(),
          Value<String?> categoryId = const Value.absent(),
          bool? markAsTransfer,
          bool? ignore,
          bool? enabled,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      UserRuleRecord(
        id: id ?? this.id,
        name: name ?? this.name,
        priority: priority ?? this.priority,
        merchantContains: merchantContains.present
            ? merchantContains.value
            : this.merchantContains,
        sourceApp: sourceApp.present ? sourceApp.value : this.sourceApp,
        textContains:
            textContains.present ? textContains.value : this.textContains,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        markAsTransfer: markAsTransfer ?? this.markAsTransfer,
        ignore: ignore ?? this.ignore,
        enabled: enabled ?? this.enabled,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  UserRuleRecord copyWithCompanion(UserRuleRecordsCompanion data) {
    return UserRuleRecord(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      priority: data.priority.present ? data.priority.value : this.priority,
      merchantContains: data.merchantContains.present
          ? data.merchantContains.value
          : this.merchantContains,
      sourceApp: data.sourceApp.present ? data.sourceApp.value : this.sourceApp,
      textContains: data.textContains.present
          ? data.textContains.value
          : this.textContains,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      markAsTransfer: data.markAsTransfer.present
          ? data.markAsTransfer.value
          : this.markAsTransfer,
      ignore: data.ignore.present ? data.ignore.value : this.ignore,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserRuleRecord(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('priority: $priority, ')
          ..write('merchantContains: $merchantContains, ')
          ..write('sourceApp: $sourceApp, ')
          ..write('textContains: $textContains, ')
          ..write('categoryId: $categoryId, ')
          ..write('markAsTransfer: $markAsTransfer, ')
          ..write('ignore: $ignore, ')
          ..write('enabled: $enabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      priority,
      merchantContains,
      sourceApp,
      textContains,
      categoryId,
      markAsTransfer,
      ignore,
      enabled,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserRuleRecord &&
          other.id == this.id &&
          other.name == this.name &&
          other.priority == this.priority &&
          other.merchantContains == this.merchantContains &&
          other.sourceApp == this.sourceApp &&
          other.textContains == this.textContains &&
          other.categoryId == this.categoryId &&
          other.markAsTransfer == this.markAsTransfer &&
          other.ignore == this.ignore &&
          other.enabled == this.enabled &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UserRuleRecordsCompanion extends UpdateCompanion<UserRuleRecord> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> priority;
  final Value<String?> merchantContains;
  final Value<String?> sourceApp;
  final Value<String?> textContains;
  final Value<String?> categoryId;
  final Value<bool> markAsTransfer;
  final Value<bool> ignore;
  final Value<bool> enabled;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const UserRuleRecordsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.priority = const Value.absent(),
    this.merchantContains = const Value.absent(),
    this.sourceApp = const Value.absent(),
    this.textContains = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.markAsTransfer = const Value.absent(),
    this.ignore = const Value.absent(),
    this.enabled = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserRuleRecordsCompanion.insert({
    required String id,
    required String name,
    required int priority,
    this.merchantContains = const Value.absent(),
    this.sourceApp = const Value.absent(),
    this.textContains = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.markAsTransfer = const Value.absent(),
    this.ignore = const Value.absent(),
    this.enabled = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        priority = Value(priority),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<UserRuleRecord> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? priority,
    Expression<String>? merchantContains,
    Expression<String>? sourceApp,
    Expression<String>? textContains,
    Expression<String>? categoryId,
    Expression<bool>? markAsTransfer,
    Expression<bool>? ignore,
    Expression<bool>? enabled,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
      if (merchantContains != null) 'merchant_contains': merchantContains,
      if (sourceApp != null) 'source_app': sourceApp,
      if (textContains != null) 'text_contains': textContains,
      if (categoryId != null) 'category_id': categoryId,
      if (markAsTransfer != null) 'mark_as_transfer': markAsTransfer,
      if (ignore != null) 'ignore': ignore,
      if (enabled != null) 'enabled': enabled,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserRuleRecordsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<int>? priority,
      Value<String?>? merchantContains,
      Value<String?>? sourceApp,
      Value<String?>? textContains,
      Value<String?>? categoryId,
      Value<bool>? markAsTransfer,
      Value<bool>? ignore,
      Value<bool>? enabled,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return UserRuleRecordsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      priority: priority ?? this.priority,
      merchantContains: merchantContains ?? this.merchantContains,
      sourceApp: sourceApp ?? this.sourceApp,
      textContains: textContains ?? this.textContains,
      categoryId: categoryId ?? this.categoryId,
      markAsTransfer: markAsTransfer ?? this.markAsTransfer,
      ignore: ignore ?? this.ignore,
      enabled: enabled ?? this.enabled,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (merchantContains.present) {
      map['merchant_contains'] = Variable<String>(merchantContains.value);
    }
    if (sourceApp.present) {
      map['source_app'] = Variable<String>(sourceApp.value);
    }
    if (textContains.present) {
      map['text_contains'] = Variable<String>(textContains.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (markAsTransfer.present) {
      map['mark_as_transfer'] = Variable<bool>(markAsTransfer.value);
    }
    if (ignore.present) {
      map['ignore'] = Variable<bool>(ignore.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserRuleRecordsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('priority: $priority, ')
          ..write('merchantContains: $merchantContains, ')
          ..write('sourceApp: $sourceApp, ')
          ..write('textContains: $textContains, ')
          ..write('categoryId: $categoryId, ')
          ..write('markAsTransfer: $markAsTransfer, ')
          ..write('ignore: $ignore, ')
          ..write('enabled: $enabled, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RawCaptureRecordsTable extends RawCaptureRecords
    with TableInfo<$RawCaptureRecordsTable, RawCaptureRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RawCaptureRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceTypeMeta =
      const VerificationMeta('sourceType');
  @override
  late final GeneratedColumn<String> sourceType = GeneratedColumn<String>(
      'source_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sourceAppMeta =
      const VerificationMeta('sourceApp');
  @override
  late final GeneratedColumn<String> sourceApp = GeneratedColumn<String>(
      'source_app', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _rawTextMeta =
      const VerificationMeta('rawText');
  @override
  late final GeneratedColumn<String> rawText = GeneratedColumn<String>(
      'raw_text', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _receivedAtMeta =
      const VerificationMeta('receivedAt');
  @override
  late final GeneratedColumn<DateTime> receivedAt = GeneratedColumn<DateTime>(
      'received_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _parsedAmountMinorMeta =
      const VerificationMeta('parsedAmountMinor');
  @override
  late final GeneratedColumn<int> parsedAmountMinor = GeneratedColumn<int>(
      'parsed_amount_minor', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _parsedMerchantMeta =
      const VerificationMeta('parsedMerchant');
  @override
  late final GeneratedColumn<String> parsedMerchant = GeneratedColumn<String>(
      'parsed_merchant', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _parsedTimestampMeta =
      const VerificationMeta('parsedTimestamp');
  @override
  late final GeneratedColumn<DateTime> parsedTimestamp =
      GeneratedColumn<DateTime>('parsed_timestamp', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _parserVersionMeta =
      const VerificationMeta('parserVersion');
  @override
  late final GeneratedColumn<String> parserVersion = GeneratedColumn<String>(
      'parser_version', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hashMeta = const VerificationMeta('hash');
  @override
  late final GeneratedColumn<String> hash = GeneratedColumn<String>(
      'hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sourceType,
        sourceApp,
        rawText,
        receivedAt,
        parsedAmountMinor,
        parsedMerchant,
        parsedTimestamp,
        parserVersion,
        hash,
        status
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'raw_capture_records';
  @override
  VerificationContext validateIntegrity(Insertable<RawCaptureRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('source_type')) {
      context.handle(
          _sourceTypeMeta,
          sourceType.isAcceptableOrUnknown(
              data['source_type']!, _sourceTypeMeta));
    } else if (isInserting) {
      context.missing(_sourceTypeMeta);
    }
    if (data.containsKey('source_app')) {
      context.handle(_sourceAppMeta,
          sourceApp.isAcceptableOrUnknown(data['source_app']!, _sourceAppMeta));
    } else if (isInserting) {
      context.missing(_sourceAppMeta);
    }
    if (data.containsKey('raw_text')) {
      context.handle(_rawTextMeta,
          rawText.isAcceptableOrUnknown(data['raw_text']!, _rawTextMeta));
    } else if (isInserting) {
      context.missing(_rawTextMeta);
    }
    if (data.containsKey('received_at')) {
      context.handle(
          _receivedAtMeta,
          receivedAt.isAcceptableOrUnknown(
              data['received_at']!, _receivedAtMeta));
    } else if (isInserting) {
      context.missing(_receivedAtMeta);
    }
    if (data.containsKey('parsed_amount_minor')) {
      context.handle(
          _parsedAmountMinorMeta,
          parsedAmountMinor.isAcceptableOrUnknown(
              data['parsed_amount_minor']!, _parsedAmountMinorMeta));
    }
    if (data.containsKey('parsed_merchant')) {
      context.handle(
          _parsedMerchantMeta,
          parsedMerchant.isAcceptableOrUnknown(
              data['parsed_merchant']!, _parsedMerchantMeta));
    }
    if (data.containsKey('parsed_timestamp')) {
      context.handle(
          _parsedTimestampMeta,
          parsedTimestamp.isAcceptableOrUnknown(
              data['parsed_timestamp']!, _parsedTimestampMeta));
    }
    if (data.containsKey('parser_version')) {
      context.handle(
          _parserVersionMeta,
          parserVersion.isAcceptableOrUnknown(
              data['parser_version']!, _parserVersionMeta));
    } else if (isInserting) {
      context.missing(_parserVersionMeta);
    }
    if (data.containsKey('hash')) {
      context.handle(
          _hashMeta, hash.isAcceptableOrUnknown(data['hash']!, _hashMeta));
    } else if (isInserting) {
      context.missing(_hashMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RawCaptureRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RawCaptureRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      sourceType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_type'])!,
      sourceApp: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source_app'])!,
      rawText: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}raw_text'])!,
      receivedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}received_at'])!,
      parsedAmountMinor: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}parsed_amount_minor']),
      parsedMerchant: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parsed_merchant']),
      parsedTimestamp: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}parsed_timestamp']),
      parserVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parser_version'])!,
      hash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hash'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $RawCaptureRecordsTable createAlias(String alias) {
    return $RawCaptureRecordsTable(attachedDatabase, alias);
  }
}

class RawCaptureRecord extends DataClass
    implements Insertable<RawCaptureRecord> {
  final String id;
  final String sourceType;
  final String sourceApp;
  final String rawText;
  final DateTime receivedAt;
  final int? parsedAmountMinor;
  final String? parsedMerchant;
  final DateTime? parsedTimestamp;
  final String parserVersion;
  final String hash;
  final String status;
  const RawCaptureRecord(
      {required this.id,
      required this.sourceType,
      required this.sourceApp,
      required this.rawText,
      required this.receivedAt,
      this.parsedAmountMinor,
      this.parsedMerchant,
      this.parsedTimestamp,
      required this.parserVersion,
      required this.hash,
      required this.status});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['source_type'] = Variable<String>(sourceType);
    map['source_app'] = Variable<String>(sourceApp);
    map['raw_text'] = Variable<String>(rawText);
    map['received_at'] = Variable<DateTime>(receivedAt);
    if (!nullToAbsent || parsedAmountMinor != null) {
      map['parsed_amount_minor'] = Variable<int>(parsedAmountMinor);
    }
    if (!nullToAbsent || parsedMerchant != null) {
      map['parsed_merchant'] = Variable<String>(parsedMerchant);
    }
    if (!nullToAbsent || parsedTimestamp != null) {
      map['parsed_timestamp'] = Variable<DateTime>(parsedTimestamp);
    }
    map['parser_version'] = Variable<String>(parserVersion);
    map['hash'] = Variable<String>(hash);
    map['status'] = Variable<String>(status);
    return map;
  }

  RawCaptureRecordsCompanion toCompanion(bool nullToAbsent) {
    return RawCaptureRecordsCompanion(
      id: Value(id),
      sourceType: Value(sourceType),
      sourceApp: Value(sourceApp),
      rawText: Value(rawText),
      receivedAt: Value(receivedAt),
      parsedAmountMinor: parsedAmountMinor == null && nullToAbsent
          ? const Value.absent()
          : Value(parsedAmountMinor),
      parsedMerchant: parsedMerchant == null && nullToAbsent
          ? const Value.absent()
          : Value(parsedMerchant),
      parsedTimestamp: parsedTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(parsedTimestamp),
      parserVersion: Value(parserVersion),
      hash: Value(hash),
      status: Value(status),
    );
  }

  factory RawCaptureRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RawCaptureRecord(
      id: serializer.fromJson<String>(json['id']),
      sourceType: serializer.fromJson<String>(json['sourceType']),
      sourceApp: serializer.fromJson<String>(json['sourceApp']),
      rawText: serializer.fromJson<String>(json['rawText']),
      receivedAt: serializer.fromJson<DateTime>(json['receivedAt']),
      parsedAmountMinor: serializer.fromJson<int?>(json['parsedAmountMinor']),
      parsedMerchant: serializer.fromJson<String?>(json['parsedMerchant']),
      parsedTimestamp: serializer.fromJson<DateTime?>(json['parsedTimestamp']),
      parserVersion: serializer.fromJson<String>(json['parserVersion']),
      hash: serializer.fromJson<String>(json['hash']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sourceType': serializer.toJson<String>(sourceType),
      'sourceApp': serializer.toJson<String>(sourceApp),
      'rawText': serializer.toJson<String>(rawText),
      'receivedAt': serializer.toJson<DateTime>(receivedAt),
      'parsedAmountMinor': serializer.toJson<int?>(parsedAmountMinor),
      'parsedMerchant': serializer.toJson<String?>(parsedMerchant),
      'parsedTimestamp': serializer.toJson<DateTime?>(parsedTimestamp),
      'parserVersion': serializer.toJson<String>(parserVersion),
      'hash': serializer.toJson<String>(hash),
      'status': serializer.toJson<String>(status),
    };
  }

  RawCaptureRecord copyWith(
          {String? id,
          String? sourceType,
          String? sourceApp,
          String? rawText,
          DateTime? receivedAt,
          Value<int?> parsedAmountMinor = const Value.absent(),
          Value<String?> parsedMerchant = const Value.absent(),
          Value<DateTime?> parsedTimestamp = const Value.absent(),
          String? parserVersion,
          String? hash,
          String? status}) =>
      RawCaptureRecord(
        id: id ?? this.id,
        sourceType: sourceType ?? this.sourceType,
        sourceApp: sourceApp ?? this.sourceApp,
        rawText: rawText ?? this.rawText,
        receivedAt: receivedAt ?? this.receivedAt,
        parsedAmountMinor: parsedAmountMinor.present
            ? parsedAmountMinor.value
            : this.parsedAmountMinor,
        parsedMerchant:
            parsedMerchant.present ? parsedMerchant.value : this.parsedMerchant,
        parsedTimestamp: parsedTimestamp.present
            ? parsedTimestamp.value
            : this.parsedTimestamp,
        parserVersion: parserVersion ?? this.parserVersion,
        hash: hash ?? this.hash,
        status: status ?? this.status,
      );
  RawCaptureRecord copyWithCompanion(RawCaptureRecordsCompanion data) {
    return RawCaptureRecord(
      id: data.id.present ? data.id.value : this.id,
      sourceType:
          data.sourceType.present ? data.sourceType.value : this.sourceType,
      sourceApp: data.sourceApp.present ? data.sourceApp.value : this.sourceApp,
      rawText: data.rawText.present ? data.rawText.value : this.rawText,
      receivedAt:
          data.receivedAt.present ? data.receivedAt.value : this.receivedAt,
      parsedAmountMinor: data.parsedAmountMinor.present
          ? data.parsedAmountMinor.value
          : this.parsedAmountMinor,
      parsedMerchant: data.parsedMerchant.present
          ? data.parsedMerchant.value
          : this.parsedMerchant,
      parsedTimestamp: data.parsedTimestamp.present
          ? data.parsedTimestamp.value
          : this.parsedTimestamp,
      parserVersion: data.parserVersion.present
          ? data.parserVersion.value
          : this.parserVersion,
      hash: data.hash.present ? data.hash.value : this.hash,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RawCaptureRecord(')
          ..write('id: $id, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourceApp: $sourceApp, ')
          ..write('rawText: $rawText, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('parsedAmountMinor: $parsedAmountMinor, ')
          ..write('parsedMerchant: $parsedMerchant, ')
          ..write('parsedTimestamp: $parsedTimestamp, ')
          ..write('parserVersion: $parserVersion, ')
          ..write('hash: $hash, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      sourceType,
      sourceApp,
      rawText,
      receivedAt,
      parsedAmountMinor,
      parsedMerchant,
      parsedTimestamp,
      parserVersion,
      hash,
      status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RawCaptureRecord &&
          other.id == this.id &&
          other.sourceType == this.sourceType &&
          other.sourceApp == this.sourceApp &&
          other.rawText == this.rawText &&
          other.receivedAt == this.receivedAt &&
          other.parsedAmountMinor == this.parsedAmountMinor &&
          other.parsedMerchant == this.parsedMerchant &&
          other.parsedTimestamp == this.parsedTimestamp &&
          other.parserVersion == this.parserVersion &&
          other.hash == this.hash &&
          other.status == this.status);
}

class RawCaptureRecordsCompanion extends UpdateCompanion<RawCaptureRecord> {
  final Value<String> id;
  final Value<String> sourceType;
  final Value<String> sourceApp;
  final Value<String> rawText;
  final Value<DateTime> receivedAt;
  final Value<int?> parsedAmountMinor;
  final Value<String?> parsedMerchant;
  final Value<DateTime?> parsedTimestamp;
  final Value<String> parserVersion;
  final Value<String> hash;
  final Value<String> status;
  final Value<int> rowid;
  const RawCaptureRecordsCompanion({
    this.id = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.sourceApp = const Value.absent(),
    this.rawText = const Value.absent(),
    this.receivedAt = const Value.absent(),
    this.parsedAmountMinor = const Value.absent(),
    this.parsedMerchant = const Value.absent(),
    this.parsedTimestamp = const Value.absent(),
    this.parserVersion = const Value.absent(),
    this.hash = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RawCaptureRecordsCompanion.insert({
    required String id,
    required String sourceType,
    required String sourceApp,
    required String rawText,
    required DateTime receivedAt,
    this.parsedAmountMinor = const Value.absent(),
    this.parsedMerchant = const Value.absent(),
    this.parsedTimestamp = const Value.absent(),
    required String parserVersion,
    required String hash,
    required String status,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        sourceType = Value(sourceType),
        sourceApp = Value(sourceApp),
        rawText = Value(rawText),
        receivedAt = Value(receivedAt),
        parserVersion = Value(parserVersion),
        hash = Value(hash),
        status = Value(status);
  static Insertable<RawCaptureRecord> custom({
    Expression<String>? id,
    Expression<String>? sourceType,
    Expression<String>? sourceApp,
    Expression<String>? rawText,
    Expression<DateTime>? receivedAt,
    Expression<int>? parsedAmountMinor,
    Expression<String>? parsedMerchant,
    Expression<DateTime>? parsedTimestamp,
    Expression<String>? parserVersion,
    Expression<String>? hash,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sourceType != null) 'source_type': sourceType,
      if (sourceApp != null) 'source_app': sourceApp,
      if (rawText != null) 'raw_text': rawText,
      if (receivedAt != null) 'received_at': receivedAt,
      if (parsedAmountMinor != null) 'parsed_amount_minor': parsedAmountMinor,
      if (parsedMerchant != null) 'parsed_merchant': parsedMerchant,
      if (parsedTimestamp != null) 'parsed_timestamp': parsedTimestamp,
      if (parserVersion != null) 'parser_version': parserVersion,
      if (hash != null) 'hash': hash,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RawCaptureRecordsCompanion copyWith(
      {Value<String>? id,
      Value<String>? sourceType,
      Value<String>? sourceApp,
      Value<String>? rawText,
      Value<DateTime>? receivedAt,
      Value<int?>? parsedAmountMinor,
      Value<String?>? parsedMerchant,
      Value<DateTime?>? parsedTimestamp,
      Value<String>? parserVersion,
      Value<String>? hash,
      Value<String>? status,
      Value<int>? rowid}) {
    return RawCaptureRecordsCompanion(
      id: id ?? this.id,
      sourceType: sourceType ?? this.sourceType,
      sourceApp: sourceApp ?? this.sourceApp,
      rawText: rawText ?? this.rawText,
      receivedAt: receivedAt ?? this.receivedAt,
      parsedAmountMinor: parsedAmountMinor ?? this.parsedAmountMinor,
      parsedMerchant: parsedMerchant ?? this.parsedMerchant,
      parsedTimestamp: parsedTimestamp ?? this.parsedTimestamp,
      parserVersion: parserVersion ?? this.parserVersion,
      hash: hash ?? this.hash,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sourceType.present) {
      map['source_type'] = Variable<String>(sourceType.value);
    }
    if (sourceApp.present) {
      map['source_app'] = Variable<String>(sourceApp.value);
    }
    if (rawText.present) {
      map['raw_text'] = Variable<String>(rawText.value);
    }
    if (receivedAt.present) {
      map['received_at'] = Variable<DateTime>(receivedAt.value);
    }
    if (parsedAmountMinor.present) {
      map['parsed_amount_minor'] = Variable<int>(parsedAmountMinor.value);
    }
    if (parsedMerchant.present) {
      map['parsed_merchant'] = Variable<String>(parsedMerchant.value);
    }
    if (parsedTimestamp.present) {
      map['parsed_timestamp'] = Variable<DateTime>(parsedTimestamp.value);
    }
    if (parserVersion.present) {
      map['parser_version'] = Variable<String>(parserVersion.value);
    }
    if (hash.present) {
      map['hash'] = Variable<String>(hash.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RawCaptureRecordsCompanion(')
          ..write('id: $id, ')
          ..write('sourceType: $sourceType, ')
          ..write('sourceApp: $sourceApp, ')
          ..write('rawText: $rawText, ')
          ..write('receivedAt: $receivedAt, ')
          ..write('parsedAmountMinor: $parsedAmountMinor, ')
          ..write('parsedMerchant: $parsedMerchant, ')
          ..write('parsedTimestamp: $parsedTimestamp, ')
          ..write('parserVersion: $parserVersion, ')
          ..write('hash: $hash, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReviewItemRecordsTable extends ReviewItemRecords
    with TableInfo<$ReviewItemRecordsTable, ReviewItemRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReviewItemRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _rawCaptureIdMeta =
      const VerificationMeta('rawCaptureId');
  @override
  late final GeneratedColumn<String> rawCaptureId = GeneratedColumn<String>(
      'raw_capture_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _proposedTransactionIdMeta =
      const VerificationMeta('proposedTransactionId');
  @override
  late final GeneratedColumn<String> proposedTransactionId =
      GeneratedColumn<String>('proposed_transaction_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
      'reason', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _confidenceMeta =
      const VerificationMeta('confidence');
  @override
  late final GeneratedColumn<double> confidence = GeneratedColumn<double>(
      'confidence', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _resolvedAtMeta =
      const VerificationMeta('resolvedAt');
  @override
  late final GeneratedColumn<DateTime> resolvedAt = GeneratedColumn<DateTime>(
      'resolved_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        rawCaptureId,
        proposedTransactionId,
        reason,
        confidence,
        status,
        createdAt,
        resolvedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'review_item_records';
  @override
  VerificationContext validateIntegrity(Insertable<ReviewItemRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('raw_capture_id')) {
      context.handle(
          _rawCaptureIdMeta,
          rawCaptureId.isAcceptableOrUnknown(
              data['raw_capture_id']!, _rawCaptureIdMeta));
    } else if (isInserting) {
      context.missing(_rawCaptureIdMeta);
    }
    if (data.containsKey('proposed_transaction_id')) {
      context.handle(
          _proposedTransactionIdMeta,
          proposedTransactionId.isAcceptableOrUnknown(
              data['proposed_transaction_id']!, _proposedTransactionIdMeta));
    } else if (isInserting) {
      context.missing(_proposedTransactionIdMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(_reasonMeta,
          reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta));
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('confidence')) {
      context.handle(
          _confidenceMeta,
          confidence.isAcceptableOrUnknown(
              data['confidence']!, _confidenceMeta));
    } else if (isInserting) {
      context.missing(_confidenceMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('resolved_at')) {
      context.handle(
          _resolvedAtMeta,
          resolvedAt.isAcceptableOrUnknown(
              data['resolved_at']!, _resolvedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReviewItemRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReviewItemRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      rawCaptureId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}raw_capture_id'])!,
      proposedTransactionId: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}proposed_transaction_id'])!,
      reason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reason'])!,
      confidence: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}confidence'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      resolvedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}resolved_at']),
    );
  }

  @override
  $ReviewItemRecordsTable createAlias(String alias) {
    return $ReviewItemRecordsTable(attachedDatabase, alias);
  }
}

class ReviewItemRecord extends DataClass
    implements Insertable<ReviewItemRecord> {
  final String id;
  final String rawCaptureId;
  final String proposedTransactionId;
  final String reason;
  final double confidence;
  final String status;
  final DateTime createdAt;
  final DateTime? resolvedAt;
  const ReviewItemRecord(
      {required this.id,
      required this.rawCaptureId,
      required this.proposedTransactionId,
      required this.reason,
      required this.confidence,
      required this.status,
      required this.createdAt,
      this.resolvedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['raw_capture_id'] = Variable<String>(rawCaptureId);
    map['proposed_transaction_id'] = Variable<String>(proposedTransactionId);
    map['reason'] = Variable<String>(reason);
    map['confidence'] = Variable<double>(confidence);
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || resolvedAt != null) {
      map['resolved_at'] = Variable<DateTime>(resolvedAt);
    }
    return map;
  }

  ReviewItemRecordsCompanion toCompanion(bool nullToAbsent) {
    return ReviewItemRecordsCompanion(
      id: Value(id),
      rawCaptureId: Value(rawCaptureId),
      proposedTransactionId: Value(proposedTransactionId),
      reason: Value(reason),
      confidence: Value(confidence),
      status: Value(status),
      createdAt: Value(createdAt),
      resolvedAt: resolvedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(resolvedAt),
    );
  }

  factory ReviewItemRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReviewItemRecord(
      id: serializer.fromJson<String>(json['id']),
      rawCaptureId: serializer.fromJson<String>(json['rawCaptureId']),
      proposedTransactionId:
          serializer.fromJson<String>(json['proposedTransactionId']),
      reason: serializer.fromJson<String>(json['reason']),
      confidence: serializer.fromJson<double>(json['confidence']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      resolvedAt: serializer.fromJson<DateTime?>(json['resolvedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'rawCaptureId': serializer.toJson<String>(rawCaptureId),
      'proposedTransactionId': serializer.toJson<String>(proposedTransactionId),
      'reason': serializer.toJson<String>(reason),
      'confidence': serializer.toJson<double>(confidence),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'resolvedAt': serializer.toJson<DateTime?>(resolvedAt),
    };
  }

  ReviewItemRecord copyWith(
          {String? id,
          String? rawCaptureId,
          String? proposedTransactionId,
          String? reason,
          double? confidence,
          String? status,
          DateTime? createdAt,
          Value<DateTime?> resolvedAt = const Value.absent()}) =>
      ReviewItemRecord(
        id: id ?? this.id,
        rawCaptureId: rawCaptureId ?? this.rawCaptureId,
        proposedTransactionId:
            proposedTransactionId ?? this.proposedTransactionId,
        reason: reason ?? this.reason,
        confidence: confidence ?? this.confidence,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        resolvedAt: resolvedAt.present ? resolvedAt.value : this.resolvedAt,
      );
  ReviewItemRecord copyWithCompanion(ReviewItemRecordsCompanion data) {
    return ReviewItemRecord(
      id: data.id.present ? data.id.value : this.id,
      rawCaptureId: data.rawCaptureId.present
          ? data.rawCaptureId.value
          : this.rawCaptureId,
      proposedTransactionId: data.proposedTransactionId.present
          ? data.proposedTransactionId.value
          : this.proposedTransactionId,
      reason: data.reason.present ? data.reason.value : this.reason,
      confidence:
          data.confidence.present ? data.confidence.value : this.confidence,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      resolvedAt:
          data.resolvedAt.present ? data.resolvedAt.value : this.resolvedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReviewItemRecord(')
          ..write('id: $id, ')
          ..write('rawCaptureId: $rawCaptureId, ')
          ..write('proposedTransactionId: $proposedTransactionId, ')
          ..write('reason: $reason, ')
          ..write('confidence: $confidence, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('resolvedAt: $resolvedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, rawCaptureId, proposedTransactionId,
      reason, confidence, status, createdAt, resolvedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReviewItemRecord &&
          other.id == this.id &&
          other.rawCaptureId == this.rawCaptureId &&
          other.proposedTransactionId == this.proposedTransactionId &&
          other.reason == this.reason &&
          other.confidence == this.confidence &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.resolvedAt == this.resolvedAt);
}

class ReviewItemRecordsCompanion extends UpdateCompanion<ReviewItemRecord> {
  final Value<String> id;
  final Value<String> rawCaptureId;
  final Value<String> proposedTransactionId;
  final Value<String> reason;
  final Value<double> confidence;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<DateTime?> resolvedAt;
  final Value<int> rowid;
  const ReviewItemRecordsCompanion({
    this.id = const Value.absent(),
    this.rawCaptureId = const Value.absent(),
    this.proposedTransactionId = const Value.absent(),
    this.reason = const Value.absent(),
    this.confidence = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.resolvedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReviewItemRecordsCompanion.insert({
    required String id,
    required String rawCaptureId,
    required String proposedTransactionId,
    required String reason,
    required double confidence,
    required String status,
    required DateTime createdAt,
    this.resolvedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        rawCaptureId = Value(rawCaptureId),
        proposedTransactionId = Value(proposedTransactionId),
        reason = Value(reason),
        confidence = Value(confidence),
        status = Value(status),
        createdAt = Value(createdAt);
  static Insertable<ReviewItemRecord> custom({
    Expression<String>? id,
    Expression<String>? rawCaptureId,
    Expression<String>? proposedTransactionId,
    Expression<String>? reason,
    Expression<double>? confidence,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? resolvedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rawCaptureId != null) 'raw_capture_id': rawCaptureId,
      if (proposedTransactionId != null)
        'proposed_transaction_id': proposedTransactionId,
      if (reason != null) 'reason': reason,
      if (confidence != null) 'confidence': confidence,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (resolvedAt != null) 'resolved_at': resolvedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReviewItemRecordsCompanion copyWith(
      {Value<String>? id,
      Value<String>? rawCaptureId,
      Value<String>? proposedTransactionId,
      Value<String>? reason,
      Value<double>? confidence,
      Value<String>? status,
      Value<DateTime>? createdAt,
      Value<DateTime?>? resolvedAt,
      Value<int>? rowid}) {
    return ReviewItemRecordsCompanion(
      id: id ?? this.id,
      rawCaptureId: rawCaptureId ?? this.rawCaptureId,
      proposedTransactionId:
          proposedTransactionId ?? this.proposedTransactionId,
      reason: reason ?? this.reason,
      confidence: confidence ?? this.confidence,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      resolvedAt: resolvedAt ?? this.resolvedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (rawCaptureId.present) {
      map['raw_capture_id'] = Variable<String>(rawCaptureId.value);
    }
    if (proposedTransactionId.present) {
      map['proposed_transaction_id'] =
          Variable<String>(proposedTransactionId.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (confidence.present) {
      map['confidence'] = Variable<double>(confidence.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (resolvedAt.present) {
      map['resolved_at'] = Variable<DateTime>(resolvedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReviewItemRecordsCompanion(')
          ..write('id: $id, ')
          ..write('rawCaptureId: $rawCaptureId, ')
          ..write('proposedTransactionId: $proposedTransactionId, ')
          ..write('reason: $reason, ')
          ..write('confidence: $confidence, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('resolvedAt: $resolvedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InsightRecordsTable extends InsightRecords
    with TableInfo<$InsightRecordsTable, InsightRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InsightRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _severityMeta =
      const VerificationMeta('severity');
  @override
  late final GeneratedColumn<String> severity = GeneratedColumn<String>(
      'severity', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _supportingTransactionIdsMeta =
      const VerificationMeta('supportingTransactionIds');
  @override
  late final GeneratedColumn<String> supportingTransactionIds =
      GeneratedColumn<String>('supporting_transaction_ids', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _suggestedActionMeta =
      const VerificationMeta('suggestedAction');
  @override
  late final GeneratedColumn<String> suggestedAction = GeneratedColumn<String>(
      'suggested_action', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _dismissedAtMeta =
      const VerificationMeta('dismissedAt');
  @override
  late final GeneratedColumn<DateTime> dismissedAt = GeneratedColumn<DateTime>(
      'dismissed_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        type,
        title,
        description,
        severity,
        supportingTransactionIds,
        suggestedAction,
        status,
        createdAt,
        dismissedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'insight_records';
  @override
  VerificationContext validateIntegrity(Insertable<InsightRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('severity')) {
      context.handle(_severityMeta,
          severity.isAcceptableOrUnknown(data['severity']!, _severityMeta));
    } else if (isInserting) {
      context.missing(_severityMeta);
    }
    if (data.containsKey('supporting_transaction_ids')) {
      context.handle(
          _supportingTransactionIdsMeta,
          supportingTransactionIds.isAcceptableOrUnknown(
              data['supporting_transaction_ids']!,
              _supportingTransactionIdsMeta));
    } else if (isInserting) {
      context.missing(_supportingTransactionIdsMeta);
    }
    if (data.containsKey('suggested_action')) {
      context.handle(
          _suggestedActionMeta,
          suggestedAction.isAcceptableOrUnknown(
              data['suggested_action']!, _suggestedActionMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('dismissed_at')) {
      context.handle(
          _dismissedAtMeta,
          dismissedAt.isAcceptableOrUnknown(
              data['dismissed_at']!, _dismissedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InsightRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InsightRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      severity: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}severity'])!,
      supportingTransactionIds: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}supporting_transaction_ids'])!,
      suggestedAction: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}suggested_action']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      dismissedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}dismissed_at']),
    );
  }

  @override
  $InsightRecordsTable createAlias(String alias) {
    return $InsightRecordsTable(attachedDatabase, alias);
  }
}

class InsightRecord extends DataClass implements Insertable<InsightRecord> {
  final String id;
  final String type;
  final String title;
  final String description;
  final String severity;
  final String supportingTransactionIds;
  final String? suggestedAction;
  final String status;
  final DateTime createdAt;
  final DateTime? dismissedAt;
  const InsightRecord(
      {required this.id,
      required this.type,
      required this.title,
      required this.description,
      required this.severity,
      required this.supportingTransactionIds,
      this.suggestedAction,
      required this.status,
      required this.createdAt,
      this.dismissedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['type'] = Variable<String>(type);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['severity'] = Variable<String>(severity);
    map['supporting_transaction_ids'] =
        Variable<String>(supportingTransactionIds);
    if (!nullToAbsent || suggestedAction != null) {
      map['suggested_action'] = Variable<String>(suggestedAction);
    }
    map['status'] = Variable<String>(status);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || dismissedAt != null) {
      map['dismissed_at'] = Variable<DateTime>(dismissedAt);
    }
    return map;
  }

  InsightRecordsCompanion toCompanion(bool nullToAbsent) {
    return InsightRecordsCompanion(
      id: Value(id),
      type: Value(type),
      title: Value(title),
      description: Value(description),
      severity: Value(severity),
      supportingTransactionIds: Value(supportingTransactionIds),
      suggestedAction: suggestedAction == null && nullToAbsent
          ? const Value.absent()
          : Value(suggestedAction),
      status: Value(status),
      createdAt: Value(createdAt),
      dismissedAt: dismissedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(dismissedAt),
    );
  }

  factory InsightRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InsightRecord(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      severity: serializer.fromJson<String>(json['severity']),
      supportingTransactionIds:
          serializer.fromJson<String>(json['supportingTransactionIds']),
      suggestedAction: serializer.fromJson<String?>(json['suggestedAction']),
      status: serializer.fromJson<String>(json['status']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      dismissedAt: serializer.fromJson<DateTime?>(json['dismissedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String>(type),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'severity': serializer.toJson<String>(severity),
      'supportingTransactionIds':
          serializer.toJson<String>(supportingTransactionIds),
      'suggestedAction': serializer.toJson<String?>(suggestedAction),
      'status': serializer.toJson<String>(status),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'dismissedAt': serializer.toJson<DateTime?>(dismissedAt),
    };
  }

  InsightRecord copyWith(
          {String? id,
          String? type,
          String? title,
          String? description,
          String? severity,
          String? supportingTransactionIds,
          Value<String?> suggestedAction = const Value.absent(),
          String? status,
          DateTime? createdAt,
          Value<DateTime?> dismissedAt = const Value.absent()}) =>
      InsightRecord(
        id: id ?? this.id,
        type: type ?? this.type,
        title: title ?? this.title,
        description: description ?? this.description,
        severity: severity ?? this.severity,
        supportingTransactionIds:
            supportingTransactionIds ?? this.supportingTransactionIds,
        suggestedAction: suggestedAction.present
            ? suggestedAction.value
            : this.suggestedAction,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        dismissedAt: dismissedAt.present ? dismissedAt.value : this.dismissedAt,
      );
  InsightRecord copyWithCompanion(InsightRecordsCompanion data) {
    return InsightRecord(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      severity: data.severity.present ? data.severity.value : this.severity,
      supportingTransactionIds: data.supportingTransactionIds.present
          ? data.supportingTransactionIds.value
          : this.supportingTransactionIds,
      suggestedAction: data.suggestedAction.present
          ? data.suggestedAction.value
          : this.suggestedAction,
      status: data.status.present ? data.status.value : this.status,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      dismissedAt:
          data.dismissedAt.present ? data.dismissedAt.value : this.dismissedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InsightRecord(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('severity: $severity, ')
          ..write('supportingTransactionIds: $supportingTransactionIds, ')
          ..write('suggestedAction: $suggestedAction, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('dismissedAt: $dismissedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      type,
      title,
      description,
      severity,
      supportingTransactionIds,
      suggestedAction,
      status,
      createdAt,
      dismissedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InsightRecord &&
          other.id == this.id &&
          other.type == this.type &&
          other.title == this.title &&
          other.description == this.description &&
          other.severity == this.severity &&
          other.supportingTransactionIds == this.supportingTransactionIds &&
          other.suggestedAction == this.suggestedAction &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.dismissedAt == this.dismissedAt);
}

class InsightRecordsCompanion extends UpdateCompanion<InsightRecord> {
  final Value<String> id;
  final Value<String> type;
  final Value<String> title;
  final Value<String> description;
  final Value<String> severity;
  final Value<String> supportingTransactionIds;
  final Value<String?> suggestedAction;
  final Value<String> status;
  final Value<DateTime> createdAt;
  final Value<DateTime?> dismissedAt;
  final Value<int> rowid;
  const InsightRecordsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.severity = const Value.absent(),
    this.supportingTransactionIds = const Value.absent(),
    this.suggestedAction = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.dismissedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InsightRecordsCompanion.insert({
    required String id,
    required String type,
    required String title,
    required String description,
    required String severity,
    required String supportingTransactionIds,
    this.suggestedAction = const Value.absent(),
    required String status,
    required DateTime createdAt,
    this.dismissedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        type = Value(type),
        title = Value(title),
        description = Value(description),
        severity = Value(severity),
        supportingTransactionIds = Value(supportingTransactionIds),
        status = Value(status),
        createdAt = Value(createdAt);
  static Insertable<InsightRecord> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? severity,
    Expression<String>? supportingTransactionIds,
    Expression<String>? suggestedAction,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? dismissedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (severity != null) 'severity': severity,
      if (supportingTransactionIds != null)
        'supporting_transaction_ids': supportingTransactionIds,
      if (suggestedAction != null) 'suggested_action': suggestedAction,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (dismissedAt != null) 'dismissed_at': dismissedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InsightRecordsCompanion copyWith(
      {Value<String>? id,
      Value<String>? type,
      Value<String>? title,
      Value<String>? description,
      Value<String>? severity,
      Value<String>? supportingTransactionIds,
      Value<String?>? suggestedAction,
      Value<String>? status,
      Value<DateTime>? createdAt,
      Value<DateTime?>? dismissedAt,
      Value<int>? rowid}) {
    return InsightRecordsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      severity: severity ?? this.severity,
      supportingTransactionIds:
          supportingTransactionIds ?? this.supportingTransactionIds,
      suggestedAction: suggestedAction ?? this.suggestedAction,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      dismissedAt: dismissedAt ?? this.dismissedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (severity.present) {
      map['severity'] = Variable<String>(severity.value);
    }
    if (supportingTransactionIds.present) {
      map['supporting_transaction_ids'] =
          Variable<String>(supportingTransactionIds.value);
    }
    if (suggestedAction.present) {
      map['suggested_action'] = Variable<String>(suggestedAction.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (dismissedAt.present) {
      map['dismissed_at'] = Variable<DateTime>(dismissedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InsightRecordsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('severity: $severity, ')
          ..write('supportingTransactionIds: $supportingTransactionIds, ')
          ..write('suggestedAction: $suggestedAction, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('dismissedAt: $dismissedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PreferenceRecordsTable extends PreferenceRecords
    with TableInfo<$PreferenceRecordsTable, PreferenceRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreferenceRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'preference_records';
  @override
  VerificationContext validateIntegrity(Insertable<PreferenceRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  PreferenceRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PreferenceRecord(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $PreferenceRecordsTable createAlias(String alias) {
    return $PreferenceRecordsTable(attachedDatabase, alias);
  }
}

class PreferenceRecord extends DataClass
    implements Insertable<PreferenceRecord> {
  final String key;
  final String value;
  final DateTime updatedAt;
  const PreferenceRecord(
      {required this.key, required this.value, required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PreferenceRecordsCompanion toCompanion(bool nullToAbsent) {
    return PreferenceRecordsCompanion(
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory PreferenceRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PreferenceRecord(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PreferenceRecord copyWith(
          {String? key, String? value, DateTime? updatedAt}) =>
      PreferenceRecord(
        key: key ?? this.key,
        value: value ?? this.value,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  PreferenceRecord copyWithCompanion(PreferenceRecordsCompanion data) {
    return PreferenceRecord(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PreferenceRecord(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PreferenceRecord &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class PreferenceRecordsCompanion extends UpdateCompanion<PreferenceRecord> {
  final Value<String> key;
  final Value<String> value;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PreferenceRecordsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PreferenceRecordsCompanion.insert({
    required String key,
    required String value,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : key = Value(key),
        value = Value(value),
        updatedAt = Value(updatedAt);
  static Insertable<PreferenceRecord> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PreferenceRecordsCompanion copyWith(
      {Value<String>? key,
      Value<String>? value,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return PreferenceRecordsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreferenceRecordsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TransactionRecordsTable transactionRecords =
      $TransactionRecordsTable(this);
  late final $CategoryRecordsTable categoryRecords =
      $CategoryRecordsTable(this);
  late final $BudgetRecordsTable budgetRecords = $BudgetRecordsTable(this);
  late final $CategoryBudgetRecordsTable categoryBudgetRecords =
      $CategoryBudgetRecordsTable(this);
  late final $RecurringRuleRecordsTable recurringRuleRecords =
      $RecurringRuleRecordsTable(this);
  late final $UserRuleRecordsTable userRuleRecords =
      $UserRuleRecordsTable(this);
  late final $RawCaptureRecordsTable rawCaptureRecords =
      $RawCaptureRecordsTable(this);
  late final $ReviewItemRecordsTable reviewItemRecords =
      $ReviewItemRecordsTable(this);
  late final $InsightRecordsTable insightRecords = $InsightRecordsTable(this);
  late final $PreferenceRecordsTable preferenceRecords =
      $PreferenceRecordsTable(this);
  late final TransactionDao transactionDao =
      TransactionDao(this as AppDatabase);
  late final CategoryDao categoryDao = CategoryDao(this as AppDatabase);
  late final BudgetDao budgetDao = BudgetDao(this as AppDatabase);
  late final RuleDao ruleDao = RuleDao(this as AppDatabase);
  late final CaptureDao captureDao = CaptureDao(this as AppDatabase);
  late final InsightDao insightDao = InsightDao(this as AppDatabase);
  late final PreferenceDao preferenceDao = PreferenceDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        transactionRecords,
        categoryRecords,
        budgetRecords,
        categoryBudgetRecords,
        recurringRuleRecords,
        userRuleRecords,
        rawCaptureRecords,
        reviewItemRecords,
        insightRecords,
        preferenceRecords
      ];
}

typedef $$TransactionRecordsTableCreateCompanionBuilder
    = TransactionRecordsCompanion Function({
  required String id,
  required int amountMinor,
  Value<String> currency,
  required String direction,
  required String merchantName,
  Value<String?> normalizedMerchantId,
  required String categoryId,
  required String accountId,
  required DateTime occurredAt,
  required DateTime capturedAt,
  required String sourceType,
  Value<String?> sourceApp,
  Value<String?> rawSourceId,
  required double confidence,
  required String status,
  Value<String?> notes,
  Value<bool> isRecurring,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$TransactionRecordsTableUpdateCompanionBuilder
    = TransactionRecordsCompanion Function({
  Value<String> id,
  Value<int> amountMinor,
  Value<String> currency,
  Value<String> direction,
  Value<String> merchantName,
  Value<String?> normalizedMerchantId,
  Value<String> categoryId,
  Value<String> accountId,
  Value<DateTime> occurredAt,
  Value<DateTime> capturedAt,
  Value<String> sourceType,
  Value<String?> sourceApp,
  Value<String?> rawSourceId,
  Value<double> confidence,
  Value<String> status,
  Value<String?> notes,
  Value<bool> isRecurring,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$TransactionRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $TransactionRecordsTable> {
  $$TransactionRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amountMinor => $composableBuilder(
      column: $table.amountMinor, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get direction => $composableBuilder(
      column: $table.direction, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get merchantName => $composableBuilder(
      column: $table.merchantName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get normalizedMerchantId => $composableBuilder(
      column: $table.normalizedMerchantId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get accountId => $composableBuilder(
      column: $table.accountId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get occurredAt => $composableBuilder(
      column: $table.occurredAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get capturedAt => $composableBuilder(
      column: $table.capturedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceApp => $composableBuilder(
      column: $table.sourceApp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get rawSourceId => $composableBuilder(
      column: $table.rawSourceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get confidence => $composableBuilder(
      column: $table.confidence, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRecurring => $composableBuilder(
      column: $table.isRecurring, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$TransactionRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $TransactionRecordsTable> {
  $$TransactionRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amountMinor => $composableBuilder(
      column: $table.amountMinor, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get direction => $composableBuilder(
      column: $table.direction, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get merchantName => $composableBuilder(
      column: $table.merchantName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get normalizedMerchantId => $composableBuilder(
      column: $table.normalizedMerchantId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get accountId => $composableBuilder(
      column: $table.accountId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get occurredAt => $composableBuilder(
      column: $table.occurredAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get capturedAt => $composableBuilder(
      column: $table.capturedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceApp => $composableBuilder(
      column: $table.sourceApp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rawSourceId => $composableBuilder(
      column: $table.rawSourceId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get confidence => $composableBuilder(
      column: $table.confidence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRecurring => $composableBuilder(
      column: $table.isRecurring, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$TransactionRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransactionRecordsTable> {
  $$TransactionRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get amountMinor => $composableBuilder(
      column: $table.amountMinor, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<String> get direction =>
      $composableBuilder(column: $table.direction, builder: (column) => column);

  GeneratedColumn<String> get merchantName => $composableBuilder(
      column: $table.merchantName, builder: (column) => column);

  GeneratedColumn<String> get normalizedMerchantId => $composableBuilder(
      column: $table.normalizedMerchantId, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  GeneratedColumn<String> get accountId =>
      $composableBuilder(column: $table.accountId, builder: (column) => column);

  GeneratedColumn<DateTime> get occurredAt => $composableBuilder(
      column: $table.occurredAt, builder: (column) => column);

  GeneratedColumn<DateTime> get capturedAt => $composableBuilder(
      column: $table.capturedAt, builder: (column) => column);

  GeneratedColumn<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => column);

  GeneratedColumn<String> get sourceApp =>
      $composableBuilder(column: $table.sourceApp, builder: (column) => column);

  GeneratedColumn<String> get rawSourceId => $composableBuilder(
      column: $table.rawSourceId, builder: (column) => column);

  GeneratedColumn<double> get confidence => $composableBuilder(
      column: $table.confidence, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isRecurring => $composableBuilder(
      column: $table.isRecurring, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$TransactionRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransactionRecordsTable,
    TransactionRecord,
    $$TransactionRecordsTableFilterComposer,
    $$TransactionRecordsTableOrderingComposer,
    $$TransactionRecordsTableAnnotationComposer,
    $$TransactionRecordsTableCreateCompanionBuilder,
    $$TransactionRecordsTableUpdateCompanionBuilder,
    (
      TransactionRecord,
      BaseReferences<_$AppDatabase, $TransactionRecordsTable, TransactionRecord>
    ),
    TransactionRecord,
    PrefetchHooks Function()> {
  $$TransactionRecordsTableTableManager(
      _$AppDatabase db, $TransactionRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransactionRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransactionRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransactionRecordsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<int> amountMinor = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<String> direction = const Value.absent(),
            Value<String> merchantName = const Value.absent(),
            Value<String?> normalizedMerchantId = const Value.absent(),
            Value<String> categoryId = const Value.absent(),
            Value<String> accountId = const Value.absent(),
            Value<DateTime> occurredAt = const Value.absent(),
            Value<DateTime> capturedAt = const Value.absent(),
            Value<String> sourceType = const Value.absent(),
            Value<String?> sourceApp = const Value.absent(),
            Value<String?> rawSourceId = const Value.absent(),
            Value<double> confidence = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isRecurring = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionRecordsCompanion(
            id: id,
            amountMinor: amountMinor,
            currency: currency,
            direction: direction,
            merchantName: merchantName,
            normalizedMerchantId: normalizedMerchantId,
            categoryId: categoryId,
            accountId: accountId,
            occurredAt: occurredAt,
            capturedAt: capturedAt,
            sourceType: sourceType,
            sourceApp: sourceApp,
            rawSourceId: rawSourceId,
            confidence: confidence,
            status: status,
            notes: notes,
            isRecurring: isRecurring,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required int amountMinor,
            Value<String> currency = const Value.absent(),
            required String direction,
            required String merchantName,
            Value<String?> normalizedMerchantId = const Value.absent(),
            required String categoryId,
            required String accountId,
            required DateTime occurredAt,
            required DateTime capturedAt,
            required String sourceType,
            Value<String?> sourceApp = const Value.absent(),
            Value<String?> rawSourceId = const Value.absent(),
            required double confidence,
            required String status,
            Value<String?> notes = const Value.absent(),
            Value<bool> isRecurring = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              TransactionRecordsCompanion.insert(
            id: id,
            amountMinor: amountMinor,
            currency: currency,
            direction: direction,
            merchantName: merchantName,
            normalizedMerchantId: normalizedMerchantId,
            categoryId: categoryId,
            accountId: accountId,
            occurredAt: occurredAt,
            capturedAt: capturedAt,
            sourceType: sourceType,
            sourceApp: sourceApp,
            rawSourceId: rawSourceId,
            confidence: confidence,
            status: status,
            notes: notes,
            isRecurring: isRecurring,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TransactionRecordsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TransactionRecordsTable,
    TransactionRecord,
    $$TransactionRecordsTableFilterComposer,
    $$TransactionRecordsTableOrderingComposer,
    $$TransactionRecordsTableAnnotationComposer,
    $$TransactionRecordsTableCreateCompanionBuilder,
    $$TransactionRecordsTableUpdateCompanionBuilder,
    (
      TransactionRecord,
      BaseReferences<_$AppDatabase, $TransactionRecordsTable, TransactionRecord>
    ),
    TransactionRecord,
    PrefetchHooks Function()>;
typedef $$CategoryRecordsTableCreateCompanionBuilder = CategoryRecordsCompanion
    Function({
  required String id,
  required String name,
  required int colorValue,
  required int iconCodePoint,
  Value<int> sortOrder,
  Value<bool> isArchived,
  Value<int> rowid,
});
typedef $$CategoryRecordsTableUpdateCompanionBuilder = CategoryRecordsCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<int> colorValue,
  Value<int> iconCodePoint,
  Value<int> sortOrder,
  Value<bool> isArchived,
  Value<int> rowid,
});

class $$CategoryRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryRecordsTable> {
  $$CategoryRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get colorValue => $composableBuilder(
      column: $table.colorValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get iconCodePoint => $composableBuilder(
      column: $table.iconCodePoint, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnFilters(column));
}

class $$CategoryRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryRecordsTable> {
  $$CategoryRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get colorValue => $composableBuilder(
      column: $table.colorValue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get iconCodePoint => $composableBuilder(
      column: $table.iconCodePoint,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sortOrder => $composableBuilder(
      column: $table.sortOrder, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnOrderings(column));
}

class $$CategoryRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryRecordsTable> {
  $$CategoryRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get colorValue => $composableBuilder(
      column: $table.colorValue, builder: (column) => column);

  GeneratedColumn<int> get iconCodePoint => $composableBuilder(
      column: $table.iconCodePoint, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => column);
}

class $$CategoryRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoryRecordsTable,
    CategoryRecord,
    $$CategoryRecordsTableFilterComposer,
    $$CategoryRecordsTableOrderingComposer,
    $$CategoryRecordsTableAnnotationComposer,
    $$CategoryRecordsTableCreateCompanionBuilder,
    $$CategoryRecordsTableUpdateCompanionBuilder,
    (
      CategoryRecord,
      BaseReferences<_$AppDatabase, $CategoryRecordsTable, CategoryRecord>
    ),
    CategoryRecord,
    PrefetchHooks Function()> {
  $$CategoryRecordsTableTableManager(
      _$AppDatabase db, $CategoryRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> colorValue = const Value.absent(),
            Value<int> iconCodePoint = const Value.absent(),
            Value<int> sortOrder = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoryRecordsCompanion(
            id: id,
            name: name,
            colorValue: colorValue,
            iconCodePoint: iconCodePoint,
            sortOrder: sortOrder,
            isArchived: isArchived,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required int colorValue,
            required int iconCodePoint,
            Value<int> sortOrder = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoryRecordsCompanion.insert(
            id: id,
            name: name,
            colorValue: colorValue,
            iconCodePoint: iconCodePoint,
            sortOrder: sortOrder,
            isArchived: isArchived,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoryRecordsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoryRecordsTable,
    CategoryRecord,
    $$CategoryRecordsTableFilterComposer,
    $$CategoryRecordsTableOrderingComposer,
    $$CategoryRecordsTableAnnotationComposer,
    $$CategoryRecordsTableCreateCompanionBuilder,
    $$CategoryRecordsTableUpdateCompanionBuilder,
    (
      CategoryRecord,
      BaseReferences<_$AppDatabase, $CategoryRecordsTable, CategoryRecord>
    ),
    CategoryRecord,
    PrefetchHooks Function()>;
typedef $$BudgetRecordsTableCreateCompanionBuilder = BudgetRecordsCompanion
    Function({
  required String id,
  required String mode,
  required int monthlyLimitMinor,
  required int savingsGoalMinor,
  required int cashBufferMinor,
  required int fixedBillsMinor,
  Value<String> currency,
  required DateTime periodStart,
  required DateTime periodEnd,
  Value<bool> isActive,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$BudgetRecordsTableUpdateCompanionBuilder = BudgetRecordsCompanion
    Function({
  Value<String> id,
  Value<String> mode,
  Value<int> monthlyLimitMinor,
  Value<int> savingsGoalMinor,
  Value<int> cashBufferMinor,
  Value<int> fixedBillsMinor,
  Value<String> currency,
  Value<DateTime> periodStart,
  Value<DateTime> periodEnd,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$BudgetRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $BudgetRecordsTable> {
  $$BudgetRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mode => $composableBuilder(
      column: $table.mode, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get monthlyLimitMinor => $composableBuilder(
      column: $table.monthlyLimitMinor,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get savingsGoalMinor => $composableBuilder(
      column: $table.savingsGoalMinor,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get cashBufferMinor => $composableBuilder(
      column: $table.cashBufferMinor,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get fixedBillsMinor => $composableBuilder(
      column: $table.fixedBillsMinor,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get periodStart => $composableBuilder(
      column: $table.periodStart, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get periodEnd => $composableBuilder(
      column: $table.periodEnd, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$BudgetRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $BudgetRecordsTable> {
  $$BudgetRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mode => $composableBuilder(
      column: $table.mode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get monthlyLimitMinor => $composableBuilder(
      column: $table.monthlyLimitMinor,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get savingsGoalMinor => $composableBuilder(
      column: $table.savingsGoalMinor,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get cashBufferMinor => $composableBuilder(
      column: $table.cashBufferMinor,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get fixedBillsMinor => $composableBuilder(
      column: $table.fixedBillsMinor,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get periodStart => $composableBuilder(
      column: $table.periodStart, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get periodEnd => $composableBuilder(
      column: $table.periodEnd, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$BudgetRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BudgetRecordsTable> {
  $$BudgetRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get mode =>
      $composableBuilder(column: $table.mode, builder: (column) => column);

  GeneratedColumn<int> get monthlyLimitMinor => $composableBuilder(
      column: $table.monthlyLimitMinor, builder: (column) => column);

  GeneratedColumn<int> get savingsGoalMinor => $composableBuilder(
      column: $table.savingsGoalMinor, builder: (column) => column);

  GeneratedColumn<int> get cashBufferMinor => $composableBuilder(
      column: $table.cashBufferMinor, builder: (column) => column);

  GeneratedColumn<int> get fixedBillsMinor => $composableBuilder(
      column: $table.fixedBillsMinor, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<DateTime> get periodStart => $composableBuilder(
      column: $table.periodStart, builder: (column) => column);

  GeneratedColumn<DateTime> get periodEnd =>
      $composableBuilder(column: $table.periodEnd, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$BudgetRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BudgetRecordsTable,
    BudgetRecord,
    $$BudgetRecordsTableFilterComposer,
    $$BudgetRecordsTableOrderingComposer,
    $$BudgetRecordsTableAnnotationComposer,
    $$BudgetRecordsTableCreateCompanionBuilder,
    $$BudgetRecordsTableUpdateCompanionBuilder,
    (
      BudgetRecord,
      BaseReferences<_$AppDatabase, $BudgetRecordsTable, BudgetRecord>
    ),
    BudgetRecord,
    PrefetchHooks Function()> {
  $$BudgetRecordsTableTableManager(_$AppDatabase db, $BudgetRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BudgetRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BudgetRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BudgetRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> mode = const Value.absent(),
            Value<int> monthlyLimitMinor = const Value.absent(),
            Value<int> savingsGoalMinor = const Value.absent(),
            Value<int> cashBufferMinor = const Value.absent(),
            Value<int> fixedBillsMinor = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<DateTime> periodStart = const Value.absent(),
            Value<DateTime> periodEnd = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BudgetRecordsCompanion(
            id: id,
            mode: mode,
            monthlyLimitMinor: monthlyLimitMinor,
            savingsGoalMinor: savingsGoalMinor,
            cashBufferMinor: cashBufferMinor,
            fixedBillsMinor: fixedBillsMinor,
            currency: currency,
            periodStart: periodStart,
            periodEnd: periodEnd,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String mode,
            required int monthlyLimitMinor,
            required int savingsGoalMinor,
            required int cashBufferMinor,
            required int fixedBillsMinor,
            Value<String> currency = const Value.absent(),
            required DateTime periodStart,
            required DateTime periodEnd,
            Value<bool> isActive = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              BudgetRecordsCompanion.insert(
            id: id,
            mode: mode,
            monthlyLimitMinor: monthlyLimitMinor,
            savingsGoalMinor: savingsGoalMinor,
            cashBufferMinor: cashBufferMinor,
            fixedBillsMinor: fixedBillsMinor,
            currency: currency,
            periodStart: periodStart,
            periodEnd: periodEnd,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BudgetRecordsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BudgetRecordsTable,
    BudgetRecord,
    $$BudgetRecordsTableFilterComposer,
    $$BudgetRecordsTableOrderingComposer,
    $$BudgetRecordsTableAnnotationComposer,
    $$BudgetRecordsTableCreateCompanionBuilder,
    $$BudgetRecordsTableUpdateCompanionBuilder,
    (
      BudgetRecord,
      BaseReferences<_$AppDatabase, $BudgetRecordsTable, BudgetRecord>
    ),
    BudgetRecord,
    PrefetchHooks Function()>;
typedef $$CategoryBudgetRecordsTableCreateCompanionBuilder
    = CategoryBudgetRecordsCompanion Function({
  required String budgetId,
  required String categoryId,
  required int limitMinor,
  Value<String> currency,
  Value<int> rowid,
});
typedef $$CategoryBudgetRecordsTableUpdateCompanionBuilder
    = CategoryBudgetRecordsCompanion Function({
  Value<String> budgetId,
  Value<String> categoryId,
  Value<int> limitMinor,
  Value<String> currency,
  Value<int> rowid,
});

class $$CategoryBudgetRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryBudgetRecordsTable> {
  $$CategoryBudgetRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get budgetId => $composableBuilder(
      column: $table.budgetId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get limitMinor => $composableBuilder(
      column: $table.limitMinor, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnFilters(column));
}

class $$CategoryBudgetRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryBudgetRecordsTable> {
  $$CategoryBudgetRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get budgetId => $composableBuilder(
      column: $table.budgetId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get limitMinor => $composableBuilder(
      column: $table.limitMinor, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));
}

class $$CategoryBudgetRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryBudgetRecordsTable> {
  $$CategoryBudgetRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get budgetId =>
      $composableBuilder(column: $table.budgetId, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  GeneratedColumn<int> get limitMinor => $composableBuilder(
      column: $table.limitMinor, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);
}

class $$CategoryBudgetRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoryBudgetRecordsTable,
    CategoryBudgetRecord,
    $$CategoryBudgetRecordsTableFilterComposer,
    $$CategoryBudgetRecordsTableOrderingComposer,
    $$CategoryBudgetRecordsTableAnnotationComposer,
    $$CategoryBudgetRecordsTableCreateCompanionBuilder,
    $$CategoryBudgetRecordsTableUpdateCompanionBuilder,
    (
      CategoryBudgetRecord,
      BaseReferences<_$AppDatabase, $CategoryBudgetRecordsTable,
          CategoryBudgetRecord>
    ),
    CategoryBudgetRecord,
    PrefetchHooks Function()> {
  $$CategoryBudgetRecordsTableTableManager(
      _$AppDatabase db, $CategoryBudgetRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryBudgetRecordsTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryBudgetRecordsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryBudgetRecordsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> budgetId = const Value.absent(),
            Value<String> categoryId = const Value.absent(),
            Value<int> limitMinor = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoryBudgetRecordsCompanion(
            budgetId: budgetId,
            categoryId: categoryId,
            limitMinor: limitMinor,
            currency: currency,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String budgetId,
            required String categoryId,
            required int limitMinor,
            Value<String> currency = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoryBudgetRecordsCompanion.insert(
            budgetId: budgetId,
            categoryId: categoryId,
            limitMinor: limitMinor,
            currency: currency,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoryBudgetRecordsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $CategoryBudgetRecordsTable,
        CategoryBudgetRecord,
        $$CategoryBudgetRecordsTableFilterComposer,
        $$CategoryBudgetRecordsTableOrderingComposer,
        $$CategoryBudgetRecordsTableAnnotationComposer,
        $$CategoryBudgetRecordsTableCreateCompanionBuilder,
        $$CategoryBudgetRecordsTableUpdateCompanionBuilder,
        (
          CategoryBudgetRecord,
          BaseReferences<_$AppDatabase, $CategoryBudgetRecordsTable,
              CategoryBudgetRecord>
        ),
        CategoryBudgetRecord,
        PrefetchHooks Function()>;
typedef $$RecurringRuleRecordsTableCreateCompanionBuilder
    = RecurringRuleRecordsCompanion Function({
  required String id,
  required String merchantName,
  required int amountMinor,
  Value<String> currency,
  required String categoryId,
  required String cadence,
  required DateTime nextExpectedAt,
  Value<bool> enabled,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$RecurringRuleRecordsTableUpdateCompanionBuilder
    = RecurringRuleRecordsCompanion Function({
  Value<String> id,
  Value<String> merchantName,
  Value<int> amountMinor,
  Value<String> currency,
  Value<String> categoryId,
  Value<String> cadence,
  Value<DateTime> nextExpectedAt,
  Value<bool> enabled,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$RecurringRuleRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $RecurringRuleRecordsTable> {
  $$RecurringRuleRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get merchantName => $composableBuilder(
      column: $table.merchantName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amountMinor => $composableBuilder(
      column: $table.amountMinor, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cadence => $composableBuilder(
      column: $table.cadence, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get nextExpectedAt => $composableBuilder(
      column: $table.nextExpectedAt,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get enabled => $composableBuilder(
      column: $table.enabled, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$RecurringRuleRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecurringRuleRecordsTable> {
  $$RecurringRuleRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get merchantName => $composableBuilder(
      column: $table.merchantName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amountMinor => $composableBuilder(
      column: $table.amountMinor, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cadence => $composableBuilder(
      column: $table.cadence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get nextExpectedAt => $composableBuilder(
      column: $table.nextExpectedAt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get enabled => $composableBuilder(
      column: $table.enabled, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$RecurringRuleRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecurringRuleRecordsTable> {
  $$RecurringRuleRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get merchantName => $composableBuilder(
      column: $table.merchantName, builder: (column) => column);

  GeneratedColumn<int> get amountMinor => $composableBuilder(
      column: $table.amountMinor, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  GeneratedColumn<String> get cadence =>
      $composableBuilder(column: $table.cadence, builder: (column) => column);

  GeneratedColumn<DateTime> get nextExpectedAt => $composableBuilder(
      column: $table.nextExpectedAt, builder: (column) => column);

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$RecurringRuleRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecurringRuleRecordsTable,
    RecurringRuleRecord,
    $$RecurringRuleRecordsTableFilterComposer,
    $$RecurringRuleRecordsTableOrderingComposer,
    $$RecurringRuleRecordsTableAnnotationComposer,
    $$RecurringRuleRecordsTableCreateCompanionBuilder,
    $$RecurringRuleRecordsTableUpdateCompanionBuilder,
    (
      RecurringRuleRecord,
      BaseReferences<_$AppDatabase, $RecurringRuleRecordsTable,
          RecurringRuleRecord>
    ),
    RecurringRuleRecord,
    PrefetchHooks Function()> {
  $$RecurringRuleRecordsTableTableManager(
      _$AppDatabase db, $RecurringRuleRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecurringRuleRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecurringRuleRecordsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecurringRuleRecordsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> merchantName = const Value.absent(),
            Value<int> amountMinor = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<String> categoryId = const Value.absent(),
            Value<String> cadence = const Value.absent(),
            Value<DateTime> nextExpectedAt = const Value.absent(),
            Value<bool> enabled = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecurringRuleRecordsCompanion(
            id: id,
            merchantName: merchantName,
            amountMinor: amountMinor,
            currency: currency,
            categoryId: categoryId,
            cadence: cadence,
            nextExpectedAt: nextExpectedAt,
            enabled: enabled,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String merchantName,
            required int amountMinor,
            Value<String> currency = const Value.absent(),
            required String categoryId,
            required String cadence,
            required DateTime nextExpectedAt,
            Value<bool> enabled = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              RecurringRuleRecordsCompanion.insert(
            id: id,
            merchantName: merchantName,
            amountMinor: amountMinor,
            currency: currency,
            categoryId: categoryId,
            cadence: cadence,
            nextExpectedAt: nextExpectedAt,
            enabled: enabled,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RecurringRuleRecordsTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $RecurringRuleRecordsTable,
        RecurringRuleRecord,
        $$RecurringRuleRecordsTableFilterComposer,
        $$RecurringRuleRecordsTableOrderingComposer,
        $$RecurringRuleRecordsTableAnnotationComposer,
        $$RecurringRuleRecordsTableCreateCompanionBuilder,
        $$RecurringRuleRecordsTableUpdateCompanionBuilder,
        (
          RecurringRuleRecord,
          BaseReferences<_$AppDatabase, $RecurringRuleRecordsTable,
              RecurringRuleRecord>
        ),
        RecurringRuleRecord,
        PrefetchHooks Function()>;
typedef $$UserRuleRecordsTableCreateCompanionBuilder = UserRuleRecordsCompanion
    Function({
  required String id,
  required String name,
  required int priority,
  Value<String?> merchantContains,
  Value<String?> sourceApp,
  Value<String?> textContains,
  Value<String?> categoryId,
  Value<bool> markAsTransfer,
  Value<bool> ignore,
  Value<bool> enabled,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$UserRuleRecordsTableUpdateCompanionBuilder = UserRuleRecordsCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<int> priority,
  Value<String?> merchantContains,
  Value<String?> sourceApp,
  Value<String?> textContains,
  Value<String?> categoryId,
  Value<bool> markAsTransfer,
  Value<bool> ignore,
  Value<bool> enabled,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$UserRuleRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $UserRuleRecordsTable> {
  $$UserRuleRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get merchantContains => $composableBuilder(
      column: $table.merchantContains,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceApp => $composableBuilder(
      column: $table.sourceApp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get textContains => $composableBuilder(
      column: $table.textContains, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get markAsTransfer => $composableBuilder(
      column: $table.markAsTransfer,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get ignore => $composableBuilder(
      column: $table.ignore, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get enabled => $composableBuilder(
      column: $table.enabled, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$UserRuleRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $UserRuleRecordsTable> {
  $$UserRuleRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get merchantContains => $composableBuilder(
      column: $table.merchantContains,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceApp => $composableBuilder(
      column: $table.sourceApp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get textContains => $composableBuilder(
      column: $table.textContains,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get markAsTransfer => $composableBuilder(
      column: $table.markAsTransfer,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get ignore => $composableBuilder(
      column: $table.ignore, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get enabled => $composableBuilder(
      column: $table.enabled, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$UserRuleRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserRuleRecordsTable> {
  $$UserRuleRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<String> get merchantContains => $composableBuilder(
      column: $table.merchantContains, builder: (column) => column);

  GeneratedColumn<String> get sourceApp =>
      $composableBuilder(column: $table.sourceApp, builder: (column) => column);

  GeneratedColumn<String> get textContains => $composableBuilder(
      column: $table.textContains, builder: (column) => column);

  GeneratedColumn<String> get categoryId => $composableBuilder(
      column: $table.categoryId, builder: (column) => column);

  GeneratedColumn<bool> get markAsTransfer => $composableBuilder(
      column: $table.markAsTransfer, builder: (column) => column);

  GeneratedColumn<bool> get ignore =>
      $composableBuilder(column: $table.ignore, builder: (column) => column);

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$UserRuleRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserRuleRecordsTable,
    UserRuleRecord,
    $$UserRuleRecordsTableFilterComposer,
    $$UserRuleRecordsTableOrderingComposer,
    $$UserRuleRecordsTableAnnotationComposer,
    $$UserRuleRecordsTableCreateCompanionBuilder,
    $$UserRuleRecordsTableUpdateCompanionBuilder,
    (
      UserRuleRecord,
      BaseReferences<_$AppDatabase, $UserRuleRecordsTable, UserRuleRecord>
    ),
    UserRuleRecord,
    PrefetchHooks Function()> {
  $$UserRuleRecordsTableTableManager(
      _$AppDatabase db, $UserRuleRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserRuleRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserRuleRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserRuleRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> priority = const Value.absent(),
            Value<String?> merchantContains = const Value.absent(),
            Value<String?> sourceApp = const Value.absent(),
            Value<String?> textContains = const Value.absent(),
            Value<String?> categoryId = const Value.absent(),
            Value<bool> markAsTransfer = const Value.absent(),
            Value<bool> ignore = const Value.absent(),
            Value<bool> enabled = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserRuleRecordsCompanion(
            id: id,
            name: name,
            priority: priority,
            merchantContains: merchantContains,
            sourceApp: sourceApp,
            textContains: textContains,
            categoryId: categoryId,
            markAsTransfer: markAsTransfer,
            ignore: ignore,
            enabled: enabled,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required int priority,
            Value<String?> merchantContains = const Value.absent(),
            Value<String?> sourceApp = const Value.absent(),
            Value<String?> textContains = const Value.absent(),
            Value<String?> categoryId = const Value.absent(),
            Value<bool> markAsTransfer = const Value.absent(),
            Value<bool> ignore = const Value.absent(),
            Value<bool> enabled = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserRuleRecordsCompanion.insert(
            id: id,
            name: name,
            priority: priority,
            merchantContains: merchantContains,
            sourceApp: sourceApp,
            textContains: textContains,
            categoryId: categoryId,
            markAsTransfer: markAsTransfer,
            ignore: ignore,
            enabled: enabled,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserRuleRecordsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserRuleRecordsTable,
    UserRuleRecord,
    $$UserRuleRecordsTableFilterComposer,
    $$UserRuleRecordsTableOrderingComposer,
    $$UserRuleRecordsTableAnnotationComposer,
    $$UserRuleRecordsTableCreateCompanionBuilder,
    $$UserRuleRecordsTableUpdateCompanionBuilder,
    (
      UserRuleRecord,
      BaseReferences<_$AppDatabase, $UserRuleRecordsTable, UserRuleRecord>
    ),
    UserRuleRecord,
    PrefetchHooks Function()>;
typedef $$RawCaptureRecordsTableCreateCompanionBuilder
    = RawCaptureRecordsCompanion Function({
  required String id,
  required String sourceType,
  required String sourceApp,
  required String rawText,
  required DateTime receivedAt,
  Value<int?> parsedAmountMinor,
  Value<String?> parsedMerchant,
  Value<DateTime?> parsedTimestamp,
  required String parserVersion,
  required String hash,
  required String status,
  Value<int> rowid,
});
typedef $$RawCaptureRecordsTableUpdateCompanionBuilder
    = RawCaptureRecordsCompanion Function({
  Value<String> id,
  Value<String> sourceType,
  Value<String> sourceApp,
  Value<String> rawText,
  Value<DateTime> receivedAt,
  Value<int?> parsedAmountMinor,
  Value<String?> parsedMerchant,
  Value<DateTime?> parsedTimestamp,
  Value<String> parserVersion,
  Value<String> hash,
  Value<String> status,
  Value<int> rowid,
});

class $$RawCaptureRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $RawCaptureRecordsTable> {
  $$RawCaptureRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sourceApp => $composableBuilder(
      column: $table.sourceApp, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get rawText => $composableBuilder(
      column: $table.rawText, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get receivedAt => $composableBuilder(
      column: $table.receivedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get parsedAmountMinor => $composableBuilder(
      column: $table.parsedAmountMinor,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get parsedMerchant => $composableBuilder(
      column: $table.parsedMerchant,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get parsedTimestamp => $composableBuilder(
      column: $table.parsedTimestamp,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get parserVersion => $composableBuilder(
      column: $table.parserVersion, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hash => $composableBuilder(
      column: $table.hash, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));
}

class $$RawCaptureRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $RawCaptureRecordsTable> {
  $$RawCaptureRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sourceApp => $composableBuilder(
      column: $table.sourceApp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rawText => $composableBuilder(
      column: $table.rawText, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get receivedAt => $composableBuilder(
      column: $table.receivedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get parsedAmountMinor => $composableBuilder(
      column: $table.parsedAmountMinor,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get parsedMerchant => $composableBuilder(
      column: $table.parsedMerchant,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get parsedTimestamp => $composableBuilder(
      column: $table.parsedTimestamp,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get parserVersion => $composableBuilder(
      column: $table.parserVersion,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hash => $composableBuilder(
      column: $table.hash, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));
}

class $$RawCaptureRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RawCaptureRecordsTable> {
  $$RawCaptureRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => column);

  GeneratedColumn<String> get sourceApp =>
      $composableBuilder(column: $table.sourceApp, builder: (column) => column);

  GeneratedColumn<String> get rawText =>
      $composableBuilder(column: $table.rawText, builder: (column) => column);

  GeneratedColumn<DateTime> get receivedAt => $composableBuilder(
      column: $table.receivedAt, builder: (column) => column);

  GeneratedColumn<int> get parsedAmountMinor => $composableBuilder(
      column: $table.parsedAmountMinor, builder: (column) => column);

  GeneratedColumn<String> get parsedMerchant => $composableBuilder(
      column: $table.parsedMerchant, builder: (column) => column);

  GeneratedColumn<DateTime> get parsedTimestamp => $composableBuilder(
      column: $table.parsedTimestamp, builder: (column) => column);

  GeneratedColumn<String> get parserVersion => $composableBuilder(
      column: $table.parserVersion, builder: (column) => column);

  GeneratedColumn<String> get hash =>
      $composableBuilder(column: $table.hash, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);
}

class $$RawCaptureRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RawCaptureRecordsTable,
    RawCaptureRecord,
    $$RawCaptureRecordsTableFilterComposer,
    $$RawCaptureRecordsTableOrderingComposer,
    $$RawCaptureRecordsTableAnnotationComposer,
    $$RawCaptureRecordsTableCreateCompanionBuilder,
    $$RawCaptureRecordsTableUpdateCompanionBuilder,
    (
      RawCaptureRecord,
      BaseReferences<_$AppDatabase, $RawCaptureRecordsTable, RawCaptureRecord>
    ),
    RawCaptureRecord,
    PrefetchHooks Function()> {
  $$RawCaptureRecordsTableTableManager(
      _$AppDatabase db, $RawCaptureRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RawCaptureRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RawCaptureRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RawCaptureRecordsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> sourceType = const Value.absent(),
            Value<String> sourceApp = const Value.absent(),
            Value<String> rawText = const Value.absent(),
            Value<DateTime> receivedAt = const Value.absent(),
            Value<int?> parsedAmountMinor = const Value.absent(),
            Value<String?> parsedMerchant = const Value.absent(),
            Value<DateTime?> parsedTimestamp = const Value.absent(),
            Value<String> parserVersion = const Value.absent(),
            Value<String> hash = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RawCaptureRecordsCompanion(
            id: id,
            sourceType: sourceType,
            sourceApp: sourceApp,
            rawText: rawText,
            receivedAt: receivedAt,
            parsedAmountMinor: parsedAmountMinor,
            parsedMerchant: parsedMerchant,
            parsedTimestamp: parsedTimestamp,
            parserVersion: parserVersion,
            hash: hash,
            status: status,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String sourceType,
            required String sourceApp,
            required String rawText,
            required DateTime receivedAt,
            Value<int?> parsedAmountMinor = const Value.absent(),
            Value<String?> parsedMerchant = const Value.absent(),
            Value<DateTime?> parsedTimestamp = const Value.absent(),
            required String parserVersion,
            required String hash,
            required String status,
            Value<int> rowid = const Value.absent(),
          }) =>
              RawCaptureRecordsCompanion.insert(
            id: id,
            sourceType: sourceType,
            sourceApp: sourceApp,
            rawText: rawText,
            receivedAt: receivedAt,
            parsedAmountMinor: parsedAmountMinor,
            parsedMerchant: parsedMerchant,
            parsedTimestamp: parsedTimestamp,
            parserVersion: parserVersion,
            hash: hash,
            status: status,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RawCaptureRecordsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RawCaptureRecordsTable,
    RawCaptureRecord,
    $$RawCaptureRecordsTableFilterComposer,
    $$RawCaptureRecordsTableOrderingComposer,
    $$RawCaptureRecordsTableAnnotationComposer,
    $$RawCaptureRecordsTableCreateCompanionBuilder,
    $$RawCaptureRecordsTableUpdateCompanionBuilder,
    (
      RawCaptureRecord,
      BaseReferences<_$AppDatabase, $RawCaptureRecordsTable, RawCaptureRecord>
    ),
    RawCaptureRecord,
    PrefetchHooks Function()>;
typedef $$ReviewItemRecordsTableCreateCompanionBuilder
    = ReviewItemRecordsCompanion Function({
  required String id,
  required String rawCaptureId,
  required String proposedTransactionId,
  required String reason,
  required double confidence,
  required String status,
  required DateTime createdAt,
  Value<DateTime?> resolvedAt,
  Value<int> rowid,
});
typedef $$ReviewItemRecordsTableUpdateCompanionBuilder
    = ReviewItemRecordsCompanion Function({
  Value<String> id,
  Value<String> rawCaptureId,
  Value<String> proposedTransactionId,
  Value<String> reason,
  Value<double> confidence,
  Value<String> status,
  Value<DateTime> createdAt,
  Value<DateTime?> resolvedAt,
  Value<int> rowid,
});

class $$ReviewItemRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $ReviewItemRecordsTable> {
  $$ReviewItemRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get rawCaptureId => $composableBuilder(
      column: $table.rawCaptureId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get proposedTransactionId => $composableBuilder(
      column: $table.proposedTransactionId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get confidence => $composableBuilder(
      column: $table.confidence, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get resolvedAt => $composableBuilder(
      column: $table.resolvedAt, builder: (column) => ColumnFilters(column));
}

class $$ReviewItemRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReviewItemRecordsTable> {
  $$ReviewItemRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rawCaptureId => $composableBuilder(
      column: $table.rawCaptureId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get proposedTransactionId => $composableBuilder(
      column: $table.proposedTransactionId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get confidence => $composableBuilder(
      column: $table.confidence, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get resolvedAt => $composableBuilder(
      column: $table.resolvedAt, builder: (column) => ColumnOrderings(column));
}

class $$ReviewItemRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReviewItemRecordsTable> {
  $$ReviewItemRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get rawCaptureId => $composableBuilder(
      column: $table.rawCaptureId, builder: (column) => column);

  GeneratedColumn<String> get proposedTransactionId => $composableBuilder(
      column: $table.proposedTransactionId, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<double> get confidence => $composableBuilder(
      column: $table.confidence, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get resolvedAt => $composableBuilder(
      column: $table.resolvedAt, builder: (column) => column);
}

class $$ReviewItemRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReviewItemRecordsTable,
    ReviewItemRecord,
    $$ReviewItemRecordsTableFilterComposer,
    $$ReviewItemRecordsTableOrderingComposer,
    $$ReviewItemRecordsTableAnnotationComposer,
    $$ReviewItemRecordsTableCreateCompanionBuilder,
    $$ReviewItemRecordsTableUpdateCompanionBuilder,
    (
      ReviewItemRecord,
      BaseReferences<_$AppDatabase, $ReviewItemRecordsTable, ReviewItemRecord>
    ),
    ReviewItemRecord,
    PrefetchHooks Function()> {
  $$ReviewItemRecordsTableTableManager(
      _$AppDatabase db, $ReviewItemRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReviewItemRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReviewItemRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReviewItemRecordsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> rawCaptureId = const Value.absent(),
            Value<String> proposedTransactionId = const Value.absent(),
            Value<String> reason = const Value.absent(),
            Value<double> confidence = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> resolvedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ReviewItemRecordsCompanion(
            id: id,
            rawCaptureId: rawCaptureId,
            proposedTransactionId: proposedTransactionId,
            reason: reason,
            confidence: confidence,
            status: status,
            createdAt: createdAt,
            resolvedAt: resolvedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String rawCaptureId,
            required String proposedTransactionId,
            required String reason,
            required double confidence,
            required String status,
            required DateTime createdAt,
            Value<DateTime?> resolvedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ReviewItemRecordsCompanion.insert(
            id: id,
            rawCaptureId: rawCaptureId,
            proposedTransactionId: proposedTransactionId,
            reason: reason,
            confidence: confidence,
            status: status,
            createdAt: createdAt,
            resolvedAt: resolvedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReviewItemRecordsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ReviewItemRecordsTable,
    ReviewItemRecord,
    $$ReviewItemRecordsTableFilterComposer,
    $$ReviewItemRecordsTableOrderingComposer,
    $$ReviewItemRecordsTableAnnotationComposer,
    $$ReviewItemRecordsTableCreateCompanionBuilder,
    $$ReviewItemRecordsTableUpdateCompanionBuilder,
    (
      ReviewItemRecord,
      BaseReferences<_$AppDatabase, $ReviewItemRecordsTable, ReviewItemRecord>
    ),
    ReviewItemRecord,
    PrefetchHooks Function()>;
typedef $$InsightRecordsTableCreateCompanionBuilder = InsightRecordsCompanion
    Function({
  required String id,
  required String type,
  required String title,
  required String description,
  required String severity,
  required String supportingTransactionIds,
  Value<String?> suggestedAction,
  required String status,
  required DateTime createdAt,
  Value<DateTime?> dismissedAt,
  Value<int> rowid,
});
typedef $$InsightRecordsTableUpdateCompanionBuilder = InsightRecordsCompanion
    Function({
  Value<String> id,
  Value<String> type,
  Value<String> title,
  Value<String> description,
  Value<String> severity,
  Value<String> supportingTransactionIds,
  Value<String?> suggestedAction,
  Value<String> status,
  Value<DateTime> createdAt,
  Value<DateTime?> dismissedAt,
  Value<int> rowid,
});

class $$InsightRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $InsightRecordsTable> {
  $$InsightRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get severity => $composableBuilder(
      column: $table.severity, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get supportingTransactionIds => $composableBuilder(
      column: $table.supportingTransactionIds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get suggestedAction => $composableBuilder(
      column: $table.suggestedAction,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dismissedAt => $composableBuilder(
      column: $table.dismissedAt, builder: (column) => ColumnFilters(column));
}

class $$InsightRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $InsightRecordsTable> {
  $$InsightRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get severity => $composableBuilder(
      column: $table.severity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get supportingTransactionIds => $composableBuilder(
      column: $table.supportingTransactionIds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get suggestedAction => $composableBuilder(
      column: $table.suggestedAction,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dismissedAt => $composableBuilder(
      column: $table.dismissedAt, builder: (column) => ColumnOrderings(column));
}

class $$InsightRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $InsightRecordsTable> {
  $$InsightRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get severity =>
      $composableBuilder(column: $table.severity, builder: (column) => column);

  GeneratedColumn<String> get supportingTransactionIds => $composableBuilder(
      column: $table.supportingTransactionIds, builder: (column) => column);

  GeneratedColumn<String> get suggestedAction => $composableBuilder(
      column: $table.suggestedAction, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get dismissedAt => $composableBuilder(
      column: $table.dismissedAt, builder: (column) => column);
}

class $$InsightRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $InsightRecordsTable,
    InsightRecord,
    $$InsightRecordsTableFilterComposer,
    $$InsightRecordsTableOrderingComposer,
    $$InsightRecordsTableAnnotationComposer,
    $$InsightRecordsTableCreateCompanionBuilder,
    $$InsightRecordsTableUpdateCompanionBuilder,
    (
      InsightRecord,
      BaseReferences<_$AppDatabase, $InsightRecordsTable, InsightRecord>
    ),
    InsightRecord,
    PrefetchHooks Function()> {
  $$InsightRecordsTableTableManager(
      _$AppDatabase db, $InsightRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InsightRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InsightRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InsightRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> severity = const Value.absent(),
            Value<String> supportingTransactionIds = const Value.absent(),
            Value<String?> suggestedAction = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> dismissedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InsightRecordsCompanion(
            id: id,
            type: type,
            title: title,
            description: description,
            severity: severity,
            supportingTransactionIds: supportingTransactionIds,
            suggestedAction: suggestedAction,
            status: status,
            createdAt: createdAt,
            dismissedAt: dismissedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String type,
            required String title,
            required String description,
            required String severity,
            required String supportingTransactionIds,
            Value<String?> suggestedAction = const Value.absent(),
            required String status,
            required DateTime createdAt,
            Value<DateTime?> dismissedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              InsightRecordsCompanion.insert(
            id: id,
            type: type,
            title: title,
            description: description,
            severity: severity,
            supportingTransactionIds: supportingTransactionIds,
            suggestedAction: suggestedAction,
            status: status,
            createdAt: createdAt,
            dismissedAt: dismissedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$InsightRecordsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $InsightRecordsTable,
    InsightRecord,
    $$InsightRecordsTableFilterComposer,
    $$InsightRecordsTableOrderingComposer,
    $$InsightRecordsTableAnnotationComposer,
    $$InsightRecordsTableCreateCompanionBuilder,
    $$InsightRecordsTableUpdateCompanionBuilder,
    (
      InsightRecord,
      BaseReferences<_$AppDatabase, $InsightRecordsTable, InsightRecord>
    ),
    InsightRecord,
    PrefetchHooks Function()>;
typedef $$PreferenceRecordsTableCreateCompanionBuilder
    = PreferenceRecordsCompanion Function({
  required String key,
  required String value,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$PreferenceRecordsTableUpdateCompanionBuilder
    = PreferenceRecordsCompanion Function({
  Value<String> key,
  Value<String> value,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$PreferenceRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $PreferenceRecordsTable> {
  $$PreferenceRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$PreferenceRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $PreferenceRecordsTable> {
  $$PreferenceRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$PreferenceRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PreferenceRecordsTable> {
  $$PreferenceRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PreferenceRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PreferenceRecordsTable,
    PreferenceRecord,
    $$PreferenceRecordsTableFilterComposer,
    $$PreferenceRecordsTableOrderingComposer,
    $$PreferenceRecordsTableAnnotationComposer,
    $$PreferenceRecordsTableCreateCompanionBuilder,
    $$PreferenceRecordsTableUpdateCompanionBuilder,
    (
      PreferenceRecord,
      BaseReferences<_$AppDatabase, $PreferenceRecordsTable, PreferenceRecord>
    ),
    PreferenceRecord,
    PrefetchHooks Function()> {
  $$PreferenceRecordsTableTableManager(
      _$AppDatabase db, $PreferenceRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PreferenceRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PreferenceRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PreferenceRecordsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PreferenceRecordsCompanion(
            key: key,
            value: value,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            required String value,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              PreferenceRecordsCompanion.insert(
            key: key,
            value: value,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PreferenceRecordsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PreferenceRecordsTable,
    PreferenceRecord,
    $$PreferenceRecordsTableFilterComposer,
    $$PreferenceRecordsTableOrderingComposer,
    $$PreferenceRecordsTableAnnotationComposer,
    $$PreferenceRecordsTableCreateCompanionBuilder,
    $$PreferenceRecordsTableUpdateCompanionBuilder,
    (
      PreferenceRecord,
      BaseReferences<_$AppDatabase, $PreferenceRecordsTable, PreferenceRecord>
    ),
    PreferenceRecord,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TransactionRecordsTableTableManager get transactionRecords =>
      $$TransactionRecordsTableTableManager(_db, _db.transactionRecords);
  $$CategoryRecordsTableTableManager get categoryRecords =>
      $$CategoryRecordsTableTableManager(_db, _db.categoryRecords);
  $$BudgetRecordsTableTableManager get budgetRecords =>
      $$BudgetRecordsTableTableManager(_db, _db.budgetRecords);
  $$CategoryBudgetRecordsTableTableManager get categoryBudgetRecords =>
      $$CategoryBudgetRecordsTableTableManager(_db, _db.categoryBudgetRecords);
  $$RecurringRuleRecordsTableTableManager get recurringRuleRecords =>
      $$RecurringRuleRecordsTableTableManager(_db, _db.recurringRuleRecords);
  $$UserRuleRecordsTableTableManager get userRuleRecords =>
      $$UserRuleRecordsTableTableManager(_db, _db.userRuleRecords);
  $$RawCaptureRecordsTableTableManager get rawCaptureRecords =>
      $$RawCaptureRecordsTableTableManager(_db, _db.rawCaptureRecords);
  $$ReviewItemRecordsTableTableManager get reviewItemRecords =>
      $$ReviewItemRecordsTableTableManager(_db, _db.reviewItemRecords);
  $$InsightRecordsTableTableManager get insightRecords =>
      $$InsightRecordsTableTableManager(_db, _db.insightRecords);
  $$PreferenceRecordsTableTableManager get preferenceRecords =>
      $$PreferenceRecordsTableTableManager(_db, _db.preferenceRecords);
}

mixin _$TransactionDaoMixin on DatabaseAccessor<AppDatabase> {
  $TransactionRecordsTable get transactionRecords =>
      attachedDatabase.transactionRecords;
}
mixin _$CategoryDaoMixin on DatabaseAccessor<AppDatabase> {
  $CategoryRecordsTable get categoryRecords => attachedDatabase.categoryRecords;
}
mixin _$BudgetDaoMixin on DatabaseAccessor<AppDatabase> {
  $BudgetRecordsTable get budgetRecords => attachedDatabase.budgetRecords;
  $CategoryBudgetRecordsTable get categoryBudgetRecords =>
      attachedDatabase.categoryBudgetRecords;
}
mixin _$RuleDaoMixin on DatabaseAccessor<AppDatabase> {
  $UserRuleRecordsTable get userRuleRecords => attachedDatabase.userRuleRecords;
  $RecurringRuleRecordsTable get recurringRuleRecords =>
      attachedDatabase.recurringRuleRecords;
}
mixin _$CaptureDaoMixin on DatabaseAccessor<AppDatabase> {
  $RawCaptureRecordsTable get rawCaptureRecords =>
      attachedDatabase.rawCaptureRecords;
  $ReviewItemRecordsTable get reviewItemRecords =>
      attachedDatabase.reviewItemRecords;
}
mixin _$InsightDaoMixin on DatabaseAccessor<AppDatabase> {
  $InsightRecordsTable get insightRecords => attachedDatabase.insightRecords;
}
mixin _$PreferenceDaoMixin on DatabaseAccessor<AppDatabase> {
  $PreferenceRecordsTable get preferenceRecords =>
      attachedDatabase.preferenceRecords;
}
