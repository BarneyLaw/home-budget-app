enum RawCaptureStatus { parsed, needsReview, duplicate, ignored }

class RawCapture {
  const RawCapture({
    required this.id,
    required this.sourceType,
    required this.sourceApp,
    required this.rawText,
    required this.receivedAt,
    required this.parserVersion,
    required this.hash,
    required this.status,
  });

  final String id;
  final String sourceType;
  final String sourceApp;
  final String rawText;
  final DateTime receivedAt;
  final String parserVersion;
  final String hash;
  final RawCaptureStatus status;
}

class ReviewItem {
  const ReviewItem({
    required this.id,
    required this.rawCaptureId,
    required this.proposedTransactionId,
    required this.reason,
    required this.confidence,
    required this.status,
    required this.createdAt,
    this.resolvedAt,
  });

  final String id;
  final String rawCaptureId;
  final String proposedTransactionId;
  final String reason;
  final double confidence;
  final String status;
  final DateTime createdAt;
  final DateTime? resolvedAt;
}
