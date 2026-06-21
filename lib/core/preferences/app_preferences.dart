import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_preferences.freezed.dart';
part 'app_preferences.g.dart';

enum TrackingStyle { relaxed, balanced, strict }

@freezed
class AppPreferences with _$AppPreferences {
  const factory AppPreferences({
    @Default('SGD') String currency,
    @Default(false) bool onboardingComplete,
    @Default(false) bool notificationCaptureEnabled,
    @Default(false) bool emailScanningEnabled,
    @Default(false) bool appLockEnabled,
    @Default(false) bool cloudSyncEnabled,
    @Default(false) bool rawEmailStorageEnabled,
    @Default(TrackingStyle.balanced) TrackingStyle trackingStyle,
  }) = _AppPreferences;

  factory AppPreferences.fromJson(Map<String, dynamic> json) =>
      _$AppPreferencesFromJson(json);
}
