import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class AmountProvider extends ChangeNotifier {
  int _income = 0;
  // int _expense = 0;
  int expense = 0;
  // int get expense => _expense;

  int get income => _income;

  Future getExpense() async {
    // _expense = 0;
    CollectionReference fireStore = await
    FirebaseFirestore.instance.collection("budgetTree");
    fireStore.snapshots().listen((querySnapshot) {
      querySnapshot.docChanges.forEach((change) {
        (int.parse(change.doc['amount']) > 0)
            ? expense += 0
            : expense += int.parse(change.doc['amount']);
      });
    });
    notifyListeners();
    return expense;
  }

  // int getExpense() {
  //   // _expense = 0;
  //   CollectionReference fireStore =
  //       FirebaseFirestore.instance.collection("budgetTree");
  //   fireStore.snapshots().listen((querySnapshot) {
  //     querySnapshot.docChanges.forEach((change) {
  //       (int.parse(change.doc['amount']) > 0)
  //           ? _expense += 0
  //           : _expense += int.parse(change.doc['amount']);
  //     });
  //   });
  //   // notifyListeners();
  //   return _expense;
  // }

  // void setExpense() {
  //   // _expense = 0;
  //   CollectionReference fireStore =
  //   FirebaseFirestore.instance.collection("budgetTree");
  //   fireStore.snapshots().listen((querySnapshot) {
  //     querySnapshot.docChanges.forEach((change) {
  //       (int.parse(change.doc['amount']) > 0)
  //           ? _expense += 0
  //           : _expense += int.parse(change.doc['amount']);
  //     });
  //   });
  //   // notifyListeners();
  // }
  // void setExpense() async{
  //   // _expense = 0;
  //   CollectionReference fireStore =
  //   FirebaseFirestore.instance.collection("budgetTree");
  //   await fireStore.snapshots().listen((querySnapshot) {
  //     querySnapshot.docChanges.forEach((change) {
  //       (int.parse(change.doc['amount']) > 0)
  //           ? _expense += 0
  //           : _expense += int.parse(change.doc['amount']);
  //     });
  //   });
  //   // notifyListeners();
  // }


  Future<int> getIncome() async{
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

    // notifyListeners();
    return _income;
  }
}
