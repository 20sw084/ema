import 'dart:developer';

import 'package:flutter/material.dart';

enum AmountType { income, expense }

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String name = '', amount = '';
  AmountType _type = AmountType.expense;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Add"),),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      onChanged: (val){
                        name = val;
                      },
                      decoration: const InputDecoration(
                        labelText: "Name*",
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      onChanged: (val){
                        if(_type == AmountType.expense){
                          int? val1 = int.parse(val);
                          val1 = (val1 - 2*(val1));
                          name = val1.toString();
                        }
                        else {name = val;}
                      },
                      decoration: const InputDecoration(
                        labelText: "Amount*",
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
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      controller: null,
                      decoration: InputDecoration(
                        labelText: "Description",
                        hintText: "Description(optional)",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3, color: Colors.pink,
                          ),
                          borderRadius : BorderRadius.all(Radius.circular(30.0)),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: const BorderSide(color: Colors.pink)
                        ),
                      ),
                    ),
                    child: const Text(
                        "Add",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

