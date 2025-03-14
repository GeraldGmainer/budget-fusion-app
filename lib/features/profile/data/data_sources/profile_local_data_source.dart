import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/core.dart';
import '../dtos/profile_local_dto.dart';

@lazySingleton
class ProfileLocalDataSource implements OfflineFirstLocalDataSource<Profile, ProfileLocalDto> {
  final Database _db;

  ProfileLocalDataSource(this._db);

  @override
  Future<List<ProfileLocalDto>> fetchAll() async {
    final rows = await _db.query("profiles");
    return rows.map(ProfileLocalDto.fromMap).toList();
  }

  @override
  Future<ProfileLocalDto?> fetchById(String id) async {
    final rows = await _db.query("profiles", where: 'id = ?', whereArgs: [id], limit: 1);
    if (rows.isEmpty) return null;
    return ProfileLocalDto.fromMap(rows.first);
  }

  @override
  Future<void> save(ProfileLocalDto dto) async {
    await _db.insert("profiles", dto.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<void> saveAll(List<ProfileLocalDto> dtos) async {
    final batch = _db.batch();
    for (final dto in dtos) {
      batch.insert("profiles", dto.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
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
