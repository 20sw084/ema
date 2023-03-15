import 'package:flutter/material.dart';

class Expense {
  Expense(this.username, this.amount, this.color);
  final String username;
  final double amount;
  // final DateTime date;
  final Color color;
}