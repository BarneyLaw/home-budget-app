import 'dart:async';

import 'package:flutter/services.dart';

class NotificationCaptureEvent {
  const NotificationCaptureEvent({
    required this.sourceApp,
    required this.title,
    required this.body,
    required this.receivedAt,
  });

  final String sourceApp;
  final String title;
  final String body;
  final DateTime receivedAt;

  String get rawText => [title, body].where((part) => part.isNotEmpty).join(' ');

  factory NotificationCaptureEvent.fromMap(Map<dynamic, dynamic> value) {
    return NotificationCaptureEvent(
      sourceApp: value['sourceApp'] as String? ?? 'unknown',
      title: value['title'] as String? ?? '',
      body: value['body'] as String? ?? '',
      receivedAt: DateTime.fromMillisecondsSinceEpoch(
        value['receivedAtMillis'] as int? ??
            DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }
}

class NotificationCaptureChannel {
  NotificationCaptureChannel({
    MethodChannel? methodChannel,
    EventChannel? eventChannel,
  })  : _methodChannel = methodChannel ??
            const MethodChannel('pocket_pulse/notification_permissions'),
        _eventChannel =
            eventChannel ?? const EventChannel('pocket_pulse/notifications');

  final MethodChannel _methodChannel;
  final EventChannel _eventChannel;

  Future<bool> isNotificationAccessEnabled() async {
    return await _methodChannel.invokeMethod<bool>('isEnabled') ?? false;
  }

  Future<void> openNotificationAccessSettings() {
    return _methodChannel.invokeMethod<void>('openSettings');
  }

  Stream<NotificationCaptureEvent> watchEvents() {
    return _eventChannel.receiveBroadcastStream().map((event) {
      if (event is Map<dynamic, dynamic>) {
        return NotificationCaptureEvent.fromMap(event);
      }
      throw StateError('Unexpected notification event payload: $event');
    });
  }
}
