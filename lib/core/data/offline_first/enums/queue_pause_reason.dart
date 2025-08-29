enum QueuePauseReason {
  offline,
  attemptsExhausted;

  static QueuePauseReason? fromString(String? value) {
    if (value == null) return null;
    final core = value.trim().split('.').last;
    final norm = core.replaceAll(RegExp(r'[^a-zA-Z]'), '').toLowerCase();
    for (final e in QueuePauseReason.values) {
      if (e.name.toLowerCase() == norm) return e;
    }
    return null;
  }
}
