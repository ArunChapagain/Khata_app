import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khata_app/models/expense.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(path.join(dbPath, 'khata.db'), version: 1);
  // db.execute(
  //     'CREATE TABLE expenses (id TEXT PRIMARY KEY, uid TEXT,desc Text ,amount REAL,dateTime TEXT);');
  return db;
}

class ExpenseNotifier extends StateNotifier<List<Expense>> {
  ExpenseNotifier() : super(const []);

  Future<void> addExpense(Expense fund) async {
    final db = await _getDatabase();
    db.insert('expenses', {
      'id': fund.id,
      'uid': fund.uid,
      'desc': fund.description,
      'amount': fund.amount,
      'dateTime': DateTime.now().toIso8601String(),
    });
  }

  Future<void> loadExpense() async {
    final db = await _getDatabase();
    final data = await db.query('expenses');
    final expenses = data.map((row) {
      return Expense(
          id: row['id'] as String,
          uid: row['uid'] as String,
          description: row['desc'] as String,
          amount: row['amount'] as double,
          dateTime: DateTime.parse(row['dateTime'] as String));
    }).toList();
    state = expenses;
  }
}

final expenseProvider = StateNotifierProvider<ExpenseNotifier, List<Expense>>(
    (ref) => ExpenseNotifier());
