import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../enums/entity_type.dart';

@lazySingleton
class SyncCursorRepo {
  static const String nullDate = "1970-01-01T00:00:00Z";
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
    map.forEach((k, v) {
      data[k.name] = v != null ? v.toIso8601String() : nullDate;
    });
    await prefs.setString(_key, jsonEncode(data));
  }

  Future<void> clear() async {
    await prefs.remove(_key);
  }

  Map<String, String> _read() {
    final raw = prefs.getString(_key);
    if (raw == null) {
      return Map.fromEntries(
        EntityType.values.map((e) => MapEntry(e.name, nullDate)),
      );
    }
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    return decoded.map((k, v) => MapEntry(k, v ?? nullDate));
  }
}
