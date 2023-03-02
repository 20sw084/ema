import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../utils/utils.dart';


class AddScreen extends StatefulWidget {
  bool isIncome = false;
  AddScreen({Key? key, required this.isIncome}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  final fireStore = FirebaseFirestore.instance.collection("budgetTree");

  String name = '', amount = '', description = '';
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
                        amount = val;
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      minLines: 3,
                      maxLines: 5,
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
                      String id =
                          DateTime.now().millisecondsSinceEpoch.toString();
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      if (!widget.isIncome) {
                        int? val1 = int.parse(amount);
                        val1 = (val1 - 2 * (val1));
                        amount = val1.toString();
                      }
                      DateTime now = DateTime.now();
                      String formattedDate = DateFormat('MM-dd-yyyy HH:mm:ss').format(now);
                      print(formattedDate);
                      fireStore
                          .doc(id)
                          .set(
                            {
                              "id": id,
                              "userName": sp.getString("name"),
                              "name": name,
                              "amount": amount,
                              "description": description,
                              "date": formattedDate,
                            },
                          )
                          .then(
                            (value) => Utils()
                                .toastMessage("Data Written Successfully."),
                          )
                          .onError(
                            (error, stackTrace) {
                              return Utils().toastMessage(
                                error.toString(),
                              );
                              // return showToast();
                            },
                          );
                      setState(() {
                        Navigator.pop(context);
                      });
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
