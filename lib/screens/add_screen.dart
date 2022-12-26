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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                  controller: null,
                    decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Name",
                      enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3, color: Colors.pink,
                      ),
                        borderRadius : BorderRadius.all(Radius.circular(30.0)),
                    ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    controller: null,
                    decoration: InputDecoration(
                      labelText: "Amount",
                      hintText: "Amount",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3, color: Colors.pink,
                        ),
                        borderRadius : BorderRadius.all(Radius.circular(30.0)),
                      ),
                    ),
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
          ),
        ],
      ),
    );
  }
}

