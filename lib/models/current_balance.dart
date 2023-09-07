import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CurrentBalance {
  static double _balance = 0;

  static double? get balanceAmount {
    return _balance;
  }

  static void loadFromDevice() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    double? balance = prefs.getDouble('balance');
    // balance ??= 0; //if null assign
    print(balance);
    _balance = balance!;
  }

  static void afterFundLoaded(double amount) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _balance = _balance + amount;
    await prefs.setDouble('balance', _balance);
  }

  static void afterWithdrawal(double amount) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _balance = _balance - amount;
    await prefs.setDouble('balance', _balance);
    double? balance = prefs.getDouble('balance');
    print(balance);
  }
}

// class CurrentBalanceNotifier extends StateNotifier {
// final balanceProvider = Provider((ref) => CurrentBalance.balanceAmount);
//   CurrentBalanceNotifier() : super([]);

//   double _balance = 0;

//   double get balanceAmount {
//     return _balance;
//   }

//   void afterFundLoaded(double amount) {
//     _balance = _balance + amount;
//   }

//   void afterWithdrawal(double amount) {
//     _balance = _balance - amount;

// class CurrentBalance {
//   static double _balance = 0;




//   static double? get balanceAmount {
//     return _balance;
//   }

//   static void loadFromDevice() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     double? balance = prefs.getDouble('balance');
//     // balance ??= 0; //if null assign
//     print(balance);
//     _balance = balance!;
//   }

//   static void afterFundLoaded(double amount) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     _balance = _balance + amount;
//     await prefs.setDouble('balance', _balance);
//   }

//   static void afterWithdrawal(double amount) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     _balance = _balance - amount;
//     await prefs.setDouble('balance', _balance);
//     double? balance = prefs.getDouble('balance');
//     print(balance);
//   }
// }
//   }
// }

// final currentBalanceProvider =
//     StateNotifierProvider((ref) => CurrentBalanceNotifier());
