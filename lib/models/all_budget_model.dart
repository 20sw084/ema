import 'package:flutter/material.dart';

class AllBudgetModel extends ChangeNotifier {
  String name;
  String amount;
  String description;

  AllBudgetModel({required key,required this.name, required this.amount, required this.description});
}
