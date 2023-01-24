import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/utils.dart';

enum AmountType { income, expense }

class AddScreen extends StatefulWidget {
  AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  final fireStore = FirebaseFirestore.instance.collection("budgetTree");

  String name = '', amount = '', description = '';
  AmountType _type = AmountType.expense;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    TextEditingController desController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: nameController,
                      onChanged: (val) {
                        name = val;
                      },
                      decoration: const InputDecoration(
                        labelText: "Name*",
                        hintText: "Name",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: Colors.pink,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: amountController,
                      onChanged: (val) {
                        if (_type == AmountType.expense) {
                          int? val1 = int.parse(val);
                          val1 = (val1 - 2 * (val1));
                          amount = val1.toString();
                        } else {
                          amount = val;
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: "Amount*",
                        hintText: "Amount",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: Colors.pink,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: desController,
                      onChanged: (val) {
                        description = val;
                      },
                      decoration: const InputDecoration(
                        labelText: "Description",
                        hintText: "Description(optional)",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: Colors.pink,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String id = DateTime.now().millisecondsSinceEpoch.toString();
                      SharedPreferences sp = await SharedPreferences.getInstance();
                      fireStore
                          .doc(id)
                          .set({
                            "id" : id,
                            "userName" : sp.getString("name"),
                            "name" : name,
                            "amount" : amount,
                            "description" : description,
                          })
                          .then((value) => Utils().toastMessage("Data Written Successfully."))
                          .onError(
                              (error, stackTrace) {
                                return Utils().toastMessage(error.toString());
                                // return showToast();
                              },
                          );
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.pink),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: const BorderSide(color: Colors.pink)),
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
