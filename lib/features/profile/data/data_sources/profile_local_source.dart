import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../dtos/profile_local_dto.dart';

@lazySingleton
class ProfileLocalSource {
  final Database db;

  ProfileLocalSource(this.db);

  Future<List<ProfileLocalDto>> fetchAllProfiles() async {
    final rows = await db.query("profiles");
    return rows.map(ProfileLocalDto.fromMap).toList();
  }

  Future<ProfileLocalDto?> fetchProfileById(String profileId) async {
    final rows = await db.query("profiles", where: 'id = ?', whereArgs: [profileId], limit: 1);
    if (rows.isEmpty) return null;
    return ProfileLocalDto.fromMap(rows.first);
  }

  Future<void> saveProfile(ProfileLocalDto dto) async {
    await db.insert("profiles", dto.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> saveProfiles(List<ProfileLocalDto> dtos) async {
    final batch = db.batch();
    for (final dto in dtos) {
      batch.insert("profiles", dto.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit();
  }
}
