import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khata_app/models/current_balance.dart';
import 'package:khata_app/models/expense.dart';
import 'package:khata_app/models/get_database.dart';

// Future<Database> _getDatabase() async {
//   final dbPath = await sql.getDatabasesPath();
//   final db = await sql.openDatabase(path.join(dbPath, 'khata.db'), version: 1);
//   // db.execute(
//   //     'CREATE TABLE expenses (id TEXT PRIMARY KEY, uid TEXT,desc Text ,amount REAL,dateTime TEXT);');
//   return db;
// }

class ExpenseNotifier extends StateNotifier<List<Expense>> {
  ExpenseNotifier() : super(const []);

  Future<void> addExpense(Expense fund) async {
    try {
      if (CurrentBalance.balanceAmount! < fund.amount) {
        throw ("Insufficient Fund");
      }
      final db = await GetDataBase.getDatabase();
      db.insert('expenses', {
        'id': fund.id,
        'uid': fund.uid,
        'desc': fund.description,
        'amount': fund.amount,
        'dateTime': DateTime.now().toIso8601String(),
      });
      // CurrentBalance.afterWithdrawal(fund.amount);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> loadExpense() async {
    final db = await GetDataBase.getDatabase();
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

final expenseProvider =
    StateNotifierProvider<ExpenseNotifier, List<Expense>>((ref) {
  // ref.read(currentBalanceProvider.notifier).balanceAmount;
  return ExpenseNotifier();
});
