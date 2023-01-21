import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../widgets/horizontal_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final fireStore = FirebaseFirestore.instance.collection("budgetTree").snapshots();

  @override
  void initState() {
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
              child: StreamBuilder(
                stream: fireStore,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }
                  if(snapshot.hasError){
                    return Text("Something Went Wrong");
                  }
                  return ListView.builder(
                    itemCount: snapshot.data.docs.length,
                        itemBuilder: (context,index) {
                          return ListTile(
                              leading: Text((index + 1).toString()),
                              trailing: Text(
                                "${snapshot.data.docs[index]["amount"]} PKR",
                                style: const TextStyle(color: Colors.green, fontSize: 15),
                              ),
                              title: Text(snapshot.data.docs[index]["name"])
                          );
                        },
                  );
                },
              ),
              // FirebaseAnimatedList(
              //   shrinkWrap: true,
              //     defaultChild: const Center(child: CircularProgressIndicator()),
              //     query: databaseRef,
              //     itemBuilder: (BuildContext context, DataSnapshot snapshot,
              //         Animation<double> animation, int index) {
              //       Map _budget = snapshot.value as Map;
              //       _budget['key'] = snapshot.key;
              //       return ListTile(
              //           leading: Text((index + 1).toString()),
              //           trailing: Text(
              //             "${_budget["amount"]} PKR",
              //             style: const TextStyle(color: Colors.green, fontSize: 15),
              //           ),
              //           title: Text(_budget["name"])
              //       );
              //     },
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
