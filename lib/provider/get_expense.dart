import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';

Future getExpense() async {
  late int _expense = 0;
  CollectionReference fireStore =
  FirebaseFirestore.instance.collection("budgetTree");
  await fireStore.get().then(
        (res) {
      res.docChanges.forEach((change) {
        (int.parse(change.doc['amount']) > 0)
            ? _expense += 0
            : _expense += int.parse(change.doc['amount']);
      },);
    },
    onError: (e) => print("Error completing: $e"),
  );
  return _expense;
}
