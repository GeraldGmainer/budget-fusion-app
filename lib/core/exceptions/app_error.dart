class AppError {
  final String translationKey;

  const AppError._(this.translationKey);

  /// Factories for each error case:
  static const AppError unknown = AppError._('error.default');
  static const AppError internet = AppError._('error.internet');
  static const AppError incorrectCredentials = AppError._('error.incorrect_credentials');
  static const AppError postgrestError = AppError._('error.postgrestError');
  static const AppError authError = AppError._('error.authError');
  static const AppError logout = AppError._('error.logout');
  static const AppError unauthenticated = AppError._('error.unauthenticated');

  @override
  String toString() => 'AppError($translationKey)';
}
