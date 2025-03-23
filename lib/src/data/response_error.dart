class ResponseError {
  const ResponseError({
    required this.message,
    this.statusCode,
    this.error,
    this.stackTrace,
  });

  final String message;
  final int? statusCode;
  final Object? error;
  final StackTrace? stackTrace;
}
