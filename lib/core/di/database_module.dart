import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../core.dart';

@module
abstract class DatabaseModule {
  @preResolve
  Future<Database> provideDatabase() async {
    return await DatabaseManager.initDatabase();
  }
}
