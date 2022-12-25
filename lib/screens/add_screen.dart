import 'dart:developer';

import 'package:flutter/material.dart';

enum AmountType { income, expense }

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  AmountType _type = AmountType.expense;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add"),),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                    controller: null,
                      decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "Name",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      controller: null,
                      decoration: InputDecoration(
                        labelText: "Amount",
                        hintText: "Amount",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ListTile(
                  title: const Text('Income'),
                  leading: Radio(
                    value: AmountType.income,
                    groupValue: _type,
                    onChanged: (value) {
                      setState(() {
                        _type = value!;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                title: const Text('Expense'),
                leading: Radio(
                  value: AmountType.expense,
                  groupValue: _type,
                  onChanged: (value) {
                    setState(() {
                      _type = value!;
                    });
                  },
                ),
              ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

