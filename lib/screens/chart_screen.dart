import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/chart.dart';
import '../utils/utils.dart';
import 'dart:math' as math;
import 'dart:developer';

class ChartScreen extends StatefulWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}
// Expense Chart Works
// TODO: Only show statistics of top 3 else others.
// TODO: Color Should be matched with color identification section.

class _ChartScreenState extends State<ChartScreen> {
  // late List<Chart> _expense = [];

  @override
  Widget build(BuildContext context) {
    final List<Expense> expenseChartData = [
      Expense('Jos Buttler', 15, Colors.pinkAccent),
      Expense('Ben Stokes', 8, Colors.purple),
      Expense('Joe Root', 14, Colors.green),
      Expense('Others', 2, Colors.grey)
    ];
    final List<Expense> incomeChartData = [
      Expense('Tim David', 15, Colors.pinkAccent),
      Expense('Rilee Roussow', 8, Colors.purple),
      Expense('Will Jacks', 14, Colors.green),
      Expense('Others', 2, Colors.grey)
    ];
    // List<Color> colorList = [
    //   Color.fromRGBO(82, 98, 255, 1),
    //   Color.fromRGBO(46, 198, 255, 1),
    //   Color.fromRGBO(123, 201, 82, 1),
    //   Color.fromRGBO(255, 171, 67, 1),
    //   Color.fromRGBO(252, 91, 57, 1),
    //   Color.fromRGBO(139, 135, 130, 1),
    // ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Charts"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Income",
                style: Utils.ts1(context),
              ),
            ),
            Row(
              children: [
                Container(
                  child: SfCircularChart(
                    series: <CircularSeries>[
                      // Render pie chart
                      PieSeries<Expense, String>(
                          dataSource: expenseChartData,
                          pointColorMapper: (Expense data, _) => data.color,
                          xValueMapper: (Expense data, _) => data.username,
                          yValueMapper: (Expense data, _) => data.amount),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          color: Colors.pink,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Pink"),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Green"),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          color: Colors.purple,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Purple"),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Grey"),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Expense",
                style: Utils.ts1(context),
              ),
            ),
            FutureBuilder(
                future: getExpenseList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Row(
                      children: [
                        Container(
                          child: SfCircularChart(
                            series: <CircularSeries>[
                              // Render pie chart
                              PieSeries<Expense, String>(
                                  // dataSource: expenseChartData,
                                  dataSource: snapshot.data,
                                  pointColorMapper: (Expense data, _) =>
                                      data.color,
                                  xValueMapper: (Expense data, _) =>
                                      data.username,
                                  yValueMapper: (Expense data, _) =>
                                      data.amount),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  color: Colors.pink,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Pink"),
                                // Text(snapshot.data["userName"]),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Green"),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  color: Colors.purple,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Purple"),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Grey"),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                  if (snapshot.hasError) {
                    return Text("Some Error going on.");
                  }
                  return CircularProgressIndicator();
                }),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text("Expense", style: Utils.ts1(context),),
            // ),
            // Container(
            //   child: SfCircularChart(
            //     series: <CircularSeries>[
            //       // Render pie chart
            //       PieSeries<Chart, String>(
            //           dataSource: incomeChartData,
            //           pointColorMapper: (Chart data, _) => data.color,
            //           xValueMapper: (Chart data, _) => data.username,
            //           yValueMapper: (Chart data, _) => data.amount),
            //     ],
            //   ),
            // ),
            // FutureBuilder(
            //     future: getExpenseList(),
            //   builder: (context, snapshot) {
            //     List<Widget> children = [];
            //     if (snapshot.hasData) {
            //       log(snapshot.toString());
            //     } else if(snapshot.hasError){
            //       children = const <Widget>[
            //         SizedBox(
            //           width: 60,
            //           height: 60,
            //           child: CircularProgressIndicator(),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.only(top: 16),
            //           child: Text('Error in result...'),
            //         ),
            //       ];
            //     }
            //     else {
            //       children = const <Widget>[
            //         SizedBox(
            //           width: 60,
            //           height: 60,
            //           child: CircularProgressIndicator(),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.only(top: 16),
            //           child: Text('Awaiting result...'),
            //         ),
            //       ];
            //     }
            //     return Center(
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: children,
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  Future getExpenseList() async {
    late List<Expense> _expense = [];
    late List<Expense> _expenseChrt = [];
    Set<String> users = Set();
    CollectionReference fireStore =
        FirebaseFirestore.instance.collection("budgetTree");
    await fireStore.get().then(
      (res) {
        res.docChanges.forEach(
          (change) {
            if (int.parse(change.doc['amount']) < 0) {
              _expense.add(
                Expense(
                  change.doc["userName"],
                  double.parse(change.doc["amount"]),
                  Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0),
                ),
              );
              users.add(change.doc["userName"]);
            }
            // (int.parse(change.doc['amount']) > 0)
            //     ? null
            //     : _expense.add(
            //   Expense(
            //     change.doc["userName"],
            //     double.parse(change.doc["amount"]),
            //     Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            //         .withOpacity(1.0),
            //   ),
            // );
          },
        );
      },
      onError: (e) => print("Error completing: $e"),
    );

    users.forEach((element) {
      _expenseChrt.add(Expense(
        element,
        0,
        Color(
          (math.Random().nextDouble() * 0xFFFFFF).toInt(),
        ).withOpacity(1.0),
      ));
    });


    for(var exp in _expense){
      for(var expCh in _expenseChrt){
        if(exp.username == expCh.username){
          expCh.amount += exp.amount;
        }
      }
    }

    return _expenseChrt;
  }

// Map<String, String> getUserData() {
//   Map<String, String> catMap = {};
//   for (var item in _expense) {
//     print(item.username);
//     if (catMap.containsKey(item.username) == false) {
//       catMap[item.username] = 1;
//     } else {
//       catMap.update(item.username, (int) => catMap[item.username]! + 1);
//       // test[item.category] = test[item.category]! + 1;
//     }
//     print(catMap);
//   }
//   return catMap;
// }
}
