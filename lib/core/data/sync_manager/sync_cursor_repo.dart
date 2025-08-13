import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../enums/entity_type.dart';

@lazySingleton
class SyncCursorRepo {
  static const _key = 'sync_cursors';
  final SharedPreferences prefs;

  SyncCursorRepo(this.prefs);

  Future<DateTime?> getLastSyncedAt(EntityType entity) async {
    final data = _read();
    final value = data[entity.name];
    return value == null ? null : DateTime.parse(value);
  }

  Future<void> setLastSyncedAt(EntityType entity, DateTime timestamp) async {
    final data = _read();
    data[entity.name] = timestamp.toIso8601String();
    await prefs.setString(_key, jsonEncode(data));
  }

  Future<Map<String, String>> getAll() async {
    return _read();
  }

  Future<void> setAll(Map<EntityType, DateTime?> map) async {
    final data = _read();
    for (final e in map.entries) {
      final key = e.key.name;
      final ts = e.value;
      if (ts == null) {
        data.remove(key); // omit key to signal bootstrap for that entity
      } else {
        data[key] = ts.toIso8601String();
      }
    }
    await prefs.setString(_key, jsonEncode(data));
  }

  Future<void> clear() async {
    await prefs.remove(_key);
  }

  Map<String, String> _read() {
    final raw = prefs.getString(_key);
    if (raw == null) return {};
    final decoded = (jsonDecode(raw) as Map<String, dynamic>);
    final cursors = <String, String>{};
    decoded.forEach((k, v) {
      if (v is String && v.isNotEmpty) {
        cursors[k] = v;
      }
    });
    return cursors;
  }
}
