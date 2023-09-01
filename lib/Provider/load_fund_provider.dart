import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khata_app/models/loadfund.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(path.join(dbPath, 'khata.db'),
      onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE loaded_fund (id TEXT PRIMARY KEY, uid TEXT, amount REAL,dateTime TEXT); CREATE TABLE expenses (id TEXT PRIMARY KEY, uid TEXT,desc Text ,amount REAL,dateTime TEXT);');
    //   return db.execute(
    //       'CREATE TABLE loaded_fund (id TEXT PRIMARY KEY, uid TEXT, amount REAL,dateTime TEXT);');
  }, version: 1);
  return db;
}

class LoadedFundNotifier extends StateNotifier<List<LoadedFund>> {
  LoadedFundNotifier() : super(const []);

  double totalLoaded = 0;

  Future<void> addFund(LoadedFund fund) async {
    final db = await _getDatabase();
    db.insert('loaded_fund', {
      'id': fund.id,
      'uid': fund.uid,
      'amount': fund.amount,
      'dateTime': DateTime.now().toIso8601String(),
    });
    totalLoadedFund();
  }

  Future<void> loadFunds() async {
    final db = await _getDatabase();
    final data = await db.query('loaded_fund');
    final fund = data.map((row) {
      return LoadedFund(
          id: row['id'] as String,
          uid: row['uid'] as String,
          amount: row['amount'] as double,
          dateTime: DateTime.parse(row['dateTime'] as String));
    }).toList();
    state = fund;
  }

  void totalLoadedFund() {
    for (LoadedFund fund in state) {
      totalLoaded = totalLoaded + fund.amount;
    }
  }

  double get getLoadedamount {
    return totalLoaded;
  }
}

final loadedFundProvider =
    StateNotifierProvider<LoadedFundNotifier, List<LoadedFund>>(
        (ref) => LoadedFundNotifier());





// clas