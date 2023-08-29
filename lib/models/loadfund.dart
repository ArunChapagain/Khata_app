import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';

const uuid = Uuid();

class LoadedFund {
  final String id;
  final String uid;
  final double amount;
  DateTime? dateTime;

  LoadedFund({
    String? id,
    required this.uid,
    required this.amount,
    this.dateTime,
  }) : id = id ?? uuid.v4();
}
