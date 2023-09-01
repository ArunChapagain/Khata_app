import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Expense {
  final String id;
  final String uid;
  final String description;
  final double amount;
  final DateTime? dateTime;

  Expense(
      {String? id,
      required this.uid,
      required this.description,
      required this.amount,
      this.dateTime})
      : id = id ?? uuid.v4();
}
