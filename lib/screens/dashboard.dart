import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../widgets/horizontal_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // int income = 0, expense = 0;
  Query databaseRef = FirebaseDatabase.instance.ref().child('budgetTree');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Expense Dashboard"),
        ),
        body: Column(
          children: <Widget>[
            HorizontalCard(),
            Flexible(
              child: FirebaseAnimatedList(
                shrinkWrap: true,
                  defaultChild: Center(child: CircularProgressIndicator()),
                  query: databaseRef,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    Map _budget = snapshot.value as Map;
                    _budget['key'] = snapshot.key;
                      // if(int.parse(_budget["amount"]) > 0){
                      //   income += int.parse(_budget["amount"]);
                      // }
                      // else{
                      //   expense += int.parse(_budget["amount"]);
                      // }
                    return ListTile(
                        leading: Text((index + 1).toString()),
                        trailing: Text(
                          "${_budget["amount"]} PKR",
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        ),
                        title: Text(_budget["name"])
                    );
                  },
                // child: ListView.builder(
                //   scrollDirection: Axis.vertical,
                //   shrinkWrap: true,
                //   itemCount: 22,//dataa["index"].length,
                //   itemBuilder: (BuildContext context, int index) {
                //     return ListTile(
                //         leading: Text((index + 1).toString()),
                //         trailing: Text(
                //           "9999 PKR",
                //           style: TextStyle(color: Colors.green, fontSize: 15),
                //         ),
                //         title: Text("name aega"));
                //   },
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
