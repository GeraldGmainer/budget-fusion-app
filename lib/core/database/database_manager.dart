import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static const _databaseName = "app_database.db";
  static const _databaseVersion = 1;

  static Future<Database> initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, _databaseName);

    return openDatabase(
      path,
      version: _databaseVersion,
      onCreate: (db, version) async {
        await _executeMigration(db, 1);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        for (int i = oldVersion + 1; i <= newVersion; i++) {
          await _executeMigration(db, i);
        }
      },
    );
  }

  static Future<void> _executeMigration(Database db, int version) async {
    final migrationFile = 'assets/migrations/migration_v$version.sql';
    final migrationSQL = await rootBundle.loadString(migrationFile);
    final commands = migrationSQL.split(';');

    for (final command in commands) {
      if (command.trim().isNotEmpty) {
        await db.execute(command.trim());
      }
    }
  }
}
