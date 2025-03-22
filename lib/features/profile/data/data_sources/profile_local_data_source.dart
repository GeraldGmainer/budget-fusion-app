import 'package:budget_fusion_app/core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../dtos/profile_dto.dart';

@lazySingleton
class ProfileLocalDataSource implements OfflineFirstLocalDataSource<ProfileDto> {
  final Database _db;

  ProfileLocalDataSource(this._db);

  @override
  Future<List<ProfileDto>> fetchAll({Map<String, dynamic>? filters}) async {
    final rows = await _db.query("profiles");
    return rows.map(ProfileDto.fromDB).toList();
  }

  @override
  Future<ProfileDto?> fetchById(String id) async {
    final rows = await _db.query("profiles", where: 'id = ?', whereArgs: [id], limit: 1);
    if (rows.isEmpty) return null;
    return ProfileDto.fromDB(rows.first);
  }

  @override
  Future<void> save(ProfileDto dto) async {
    await _db.insert("profiles", dto.toDB(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<void> saveAll(List<ProfileDto> dtos) async {
    final batch = _db.batch();
    for (final dto in dtos) {
      batch.insert("profiles", dto.toDB(), conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(noResult: true);
  }

  @override
  Future<void> markAsSynced(String id, DateTime updated) async {
    await _db.update('profiles', {'updated_at': updated.toIso8601String()}, where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<DateTime?> fetchMaxUpdatedAt() async {
    final result = await _db.rawQuery('SELECT MAX(updated_at) AS maxDate FROM profiles');
    if (result.isEmpty || result.first['maxDate'] == null) {
      return null;
    }
    return DateTime.parse(result.first['maxDate'] as String);
  }
}
