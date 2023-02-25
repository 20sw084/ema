import 'package:cloud_firestore/cloud_firestore.dart';

Future getIncome() async {
  late int _income = 0;
  CollectionReference fireStore =
  FirebaseFirestore.instance.collection("budgetTree");
  await fireStore.get().then(
        (res) {
      res.docChanges.forEach((change) {
        (int.parse(change.doc['amount']) < 0)
            ? _income += 0
            : _income += int.parse(change.doc['amount']);
      },);
    },
    onError: (e) => print("Error completing: $e"),
  );
  return _income;
}
