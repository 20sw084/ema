import 'package:flutter/material.dart';

class Expense {
  Expense(this.username, this.amount, this.color);
  late String username;
  late double amount;
  // final DateTime date;
  final Color color;
}