enum QueueTaskType {
  upsert,
  delete;

  static QueueTaskType fromString(String value) {
    final core = value.trim().split('.').last;
    final norm = core.replaceAll(RegExp(r'[^a-zA-Z]'), '').toLowerCase();
    return QueueTaskType.values.firstWhere(
      (e) => e.name.toLowerCase() == norm,
      orElse: () => throw Exception("Invalid queue task type: $value"),
    );
  }

  static QueueTaskType? tryParse(String value) {
    final core = value.trim().split('.').last;
    final norm = core.replaceAll(RegExp(r'[^a-zA-Z]'), '').toLowerCase();
    for (final e in QueueTaskType.values) {
      if (e.name.toLowerCase() == norm) return e;
    }
    return null;
  }
}
