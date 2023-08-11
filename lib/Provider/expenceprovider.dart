import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Expense {
  final String id;
  final String uid;
  final String description;
  final double amount;
  late DateTime dateTime;

  Expense(
      {required this.id,
      required this.uid,
      required this.description,
      required this.amount,
      required this.dateTime});
}

class ExpenseProvider with ChangeNotifier {
  final List<Expense> _statement = [
    Expense(
        id: 'dfdf',
        uid: 'suman',
        description: '1 kg mushroom',
        amount: 100,
        dateTime: DateTime.now()),
    Expense(
        id: 'dfdf',
        uid: 'suman',
        description: '1 kg mushroom',
        amount: 100,
        dateTime: DateTime.now()),
    Expense(
        id: 'dfdf',
        uid: 'suman',
        description: '1 kg mushroom',
        amount: 100,
        dateTime: DateTime.now()),
  ];

  List<Expense> get expenseStatement {
    return [..._statement];
  }
}
