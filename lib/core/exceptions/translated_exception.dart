class TranslatedException implements Exception {
  final String message;

  TranslatedException(this.message);

  @override
  String toString() => "$runtimeType: $message";
}
