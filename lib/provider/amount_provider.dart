import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class AmountProvider extends ChangeNotifier{
  int _income = 0;
  int _expense = 0;
  int get expense => _expense;
  int get income => _income;

  int getExpense (){
    // _expense = 0;
    CollectionReference fireStore =
    FirebaseFirestore.instance.collection("budgetTree");
    fireStore.snapshots().listen((querySnapshot) {
      querySnapshot.docChanges.forEach((change) {
        (int.parse(change.doc['amount']) > 0)
            ? _expense += 0
            : _expense += int.parse(change.doc['amount']);
      });
    });
    return expense;
  }

  int getIncome() {
    // _income = 0;
    CollectionReference fireStore =
    FirebaseFirestore.instance.collection("budgetTree");
    fireStore.snapshots().listen((querySnapshot) async {
      querySnapshot.docChanges.forEach((change) {
        (int.parse(change.doc['amount']) < 0)
            ? _income += 0
            : _income += int.parse(change.doc['amount']);
      });
    });
    return _income;
  }

}