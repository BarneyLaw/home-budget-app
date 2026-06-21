package com.example.home_budget_app

import android.app.Notification
import android.os.Handler
import android.os.Looper
import android.service.notification.NotificationListenerService
import android.service.notification.StatusBarNotification
import io.flutter.plugin.common.EventChannel

class NotificationCaptureService : NotificationListenerService() {
    override fun onNotificationPosted(sbn: StatusBarNotification) {
        val notification = sbn.notification ?: return
        val extras = notification.extras
        val title = extras.getCharSequence(Notification.EXTRA_TITLE)?.toString().orEmpty()
        val text = extras.getCharSequence(Notification.EXTRA_TEXT)?.toString().orEmpty()
        val bigText = extras.getCharSequence(Notification.EXTRA_BIG_TEXT)?.toString().orEmpty()
        val body = if (bigText.isNotBlank()) bigText else text

        if (title.isBlank() && body.isBlank()) {
            return
        }

        val payload = mapOf(
            "sourceApp" to sbn.packageName,
            "title" to title,
            "body" to body,
            "receivedAtMillis" to sbn.postTime
        )

        mainHandler.post {
            eventSink?.success(payload)
        }
    }

    companion object {
        private val mainHandler = Handler(Looper.getMainLooper())
        var eventSink: EventChannel.EventSink? = null
    }
}
