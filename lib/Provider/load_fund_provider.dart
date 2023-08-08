import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class LoadedFund {
  final String id;
  final String uid;
  final double amount;
  late DateTime dateTime;

  LoadedFund(
      {required this.id,
      required this.uid,
      required this.amount,
      required this.dateTime});
}

class LoadedFundProvider with ChangeNotifier {
  final List<LoadedFund> _statement = [
    LoadedFund(id: 'dfdf', uid: 'suman', amount: 100, dateTime: DateTime.now()),
    LoadedFund(id: 'dfdf', uid: 'suman', amount: 100, dateTime: DateTime.now()),
    LoadedFund(id: 'dfdf', uid: 'suman', amount: 100, dateTime: DateTime.now()),
    LoadedFund(id: 'dfdf', uid: 'suman', amount: 100, dateTime: DateTime.now()),
    LoadedFund(id: 'dfdf', uid: 'suman', amount: 100, dateTime: DateTime.now()),
    LoadedFund(id: 'dfdf', uid: 'suman', amount: 100, dateTime: DateTime.now()),
    LoadedFund(id: 'dfdf', uid: 'suman', amount: 100, dateTime: DateTime.now()),
    LoadedFund(id: 'dfdf', uid: 'suman', amount: 100, dateTime: DateTime.now()),
    LoadedFund(id: 'dfdf', uid: 'suman', amount: 100, dateTime: DateTime.now()),
    LoadedFund(id: 'dfdf', uid: 'suman', amount: 100, dateTime: DateTime.now()),
  ];

  List<LoadedFund> get getloadedStatement {
    return [..._statement];
  }
}
