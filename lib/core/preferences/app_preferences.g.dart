// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppPreferencesImpl _$$AppPreferencesImplFromJson(Map<String, dynamic> json) =>
    _$AppPreferencesImpl(
      currency: json['currency'] as String? ?? 'SGD',
      onboardingComplete: json['onboardingComplete'] as bool? ?? false,
      notificationCaptureEnabled:
          json['notificationCaptureEnabled'] as bool? ?? false,
      emailScanningEnabled: json['emailScanningEnabled'] as bool? ?? false,
      appLockEnabled: json['appLockEnabled'] as bool? ?? false,
      cloudSyncEnabled: json['cloudSyncEnabled'] as bool? ?? false,
      rawEmailStorageEnabled: json['rawEmailStorageEnabled'] as bool? ?? false,
      trackingStyle:
          $enumDecodeNullable(_$TrackingStyleEnumMap, json['trackingStyle']) ??
              TrackingStyle.balanced,
    );

Map<String, dynamic> _$$AppPreferencesImplToJson(
        _$AppPreferencesImpl instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'onboardingComplete': instance.onboardingComplete,
      'notificationCaptureEnabled': instance.notificationCaptureEnabled,
      'emailScanningEnabled': instance.emailScanningEnabled,
      'appLockEnabled': instance.appLockEnabled,
      'cloudSyncEnabled': instance.cloudSyncEnabled,
      'rawEmailStorageEnabled': instance.rawEmailStorageEnabled,
      'trackingStyle': _$TrackingStyleEnumMap[instance.trackingStyle]!,
    };

const _$TrackingStyleEnumMap = {
  TrackingStyle.relaxed: 'relaxed',
  TrackingStyle.balanced: 'balanced',
  TrackingStyle.strict: 'strict',
};
