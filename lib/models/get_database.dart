import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class GetDataBase {
  static Future<Database> getDatabase() async {
    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(path.join(dbPath, 'khata.db'),
        onCreate: (db, version) {
      db.execute(
          'CREATE TABLE loaded_fund (id TEXT PRIMARY KEY, uid TEXT, amount REAL,dateTime TEXT);');
      db.execute(
          'CREATE TABLE expenses (id TEXT PRIMARY KEY, uid TEXT,desc Text ,amount REAL,dateTime TEXT);');
    }, version: 1);
    return db;
  }
}
