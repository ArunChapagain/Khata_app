import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:khata_app/models/current_balance.dart';
import 'package:khata_app/models/get_database.dart';
import 'package:khata_app/models/loadfund.dart';

class LoadedFundNotifier extends StateNotifier<List<LoadedFund>> {
  LoadedFundNotifier() : super(const []);

  Future<void> addFund(LoadedFund fund) async {
    try {
      final db = await GetDataBase.getDatabase();
      db.insert('loaded_fund', {
        'id': fund.id,
        'uid': fund.uid,
        'amount': fund.amount,
        'dateTime': DateTime.now().toIso8601String(),
      });
      // totalLoadedFund();
    } catch (error) {
      rethrow;
    }
    CurrentBalance.afterFundLoaded(fund.amount);
  }

  Future<void> loadFunds() async {
    final db = await GetDataBase.getDatabase();
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
}
//   void totalLoadedFund() {
//     for (LoadedFund fund in state) {
//       totalLoaded = totalLoaded + fund.amount;
//     }
//   }

//   double get getLoadedamount {
//     return totalLoaded;
//   }
// }

final loadedFundProvider =
    StateNotifierProvider<LoadedFundNotifier, List<LoadedFund>>(
        (ref) => LoadedFundNotifier());





// 