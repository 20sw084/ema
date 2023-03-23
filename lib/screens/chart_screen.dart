import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/expense.dart';
import '../models/income.dart';
import '../utils/utils.dart';
import 'dart:math' as math;
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

// Expense Chart Works
// TODO: Exception caught when users less than 4

class _ChartScreenState extends State<ChartScreen> {
  // late List<Chart> _expense = [];
  List<Color> colorList = [
    Colors.blue,
    Colors.greenAccent,
    Colors.purple,
    Colors.red,
    Colors.grey,
    Colors.green,
    Colors.pinkAccent,
    Colors.yellow,
    Colors.brown,
    Colors.deepOrangeAccent,
    Colors.teal,
    Colors.lime,
    Colors.black
  ];
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
            // Row(
            //   children: [
            //     Container(
            //       child: SfCircularChart(
            //         series: <CircularSeries>[
            //           // Render pie chart
            //           PieSeries<Expense, String>(
            //               dataSource: expenseChartData,
            //               pointColorMapper: (Expense data, _) => data.color,
            //               xValueMapper: (Expense data, _) => data.username,
            //               yValueMapper: (Expense data, _) => data.amount),
            //         ],
            //       ),
            //     ),
            //     Column(
            //       children: [
            //         Row(
            //           children: [
            //             Container(
            //               height: 20,
            //               width: 20,
            //               color: Colors.pink,
            //             ),
            //             SizedBox(
            //               width: 10,
            //             ),
            //             Text("Pink"),
            //           ],
            //         ),
            //         SizedBox(
            //           height: 10.0,
            //         ),
            //         Row(
            //           children: [
            //             Container(
            //               height: 20,
            //               width: 20,
            //               color: Colors.green,
            //             ),
            //             SizedBox(
            //               width: 10,
            //             ),
            //             Text("Green"),
            //           ],
            //         ),
            //         SizedBox(
            //           height: 10.0,
            //         ),
            //         Row(
            //           children: [
            //             Container(
            //               height: 20,
            //               width: 20,
            //               color: Colors.purple,
            //             ),
            //             SizedBox(
            //               width: 10,
            //             ),
            //             Text("Purple"),
            //           ],
            //         ),
            //         SizedBox(
            //           height: 10.0,
            //         ),
            //         Row(
            //           children: [
            //             Container(
            //               height: 20,
            //               width: 20,
            //               color: Colors.grey,
            //             ),
            //             SizedBox(
            //               width: 10,
            //             ),
            //             Text("Grey"),
            //           ],
            //         ),
            //         SizedBox(
            //           height: 10.0,
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            FutureBuilder(
                future: getIncomeList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Row(
                      children: [
                        Container(
                          child: SfCircularChart(
                            series: <CircularSeries>[
                              // Render pie chart
                              PieSeries<Income, String>(
                                // dataSource: expenseChartData,
                                  dataSource: snapshot.data,
                                  pointColorMapper: (Income data, _) =>
                                  data.color,
                                  xValueMapper: (Income data, _) =>
                                  data.username,
                                  yValueMapper: (Income data, _) =>
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
                                  color: snapshot.data[0].color,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(snapshot.data[0].username),
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
                                  color: snapshot.data[1].color,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(snapshot.data[1].username),
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
                                  color: snapshot.data[2].color,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(snapshot.data[2].username),
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
                                  color: snapshot.data[3].color,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(snapshot.data[3].username),
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
                                  color: snapshot.data[0].color,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(snapshot.data[0].username),
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
                                  color: snapshot.data[1].color,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(snapshot.data[1].username),
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
                                  color: snapshot.data[2].color,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(snapshot.data[2].username),
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
                                  color: snapshot.data[3].color,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(snapshot.data[3].username),
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
                  Colors.pink,
                ),
              );
              users.add(change.doc["userName"]);
            }
          },
        );
      },
      onError: (e) => print("Error completing: $e"),
    );

    users.forEach((element) {
      _expenseChrt.add(Expense(
        element,
        0,
        colorList.elementAt(
          (math.Random().nextInt(colorList.length)),
        ),
      ));
    });

    for (var exp in _expense) {
      for (var expCh in _expenseChrt) {
        if (exp.username == expCh.username) {
          expCh.amount += exp.amount;
        }
      }
    }

    _expenseChrt.sortReversed((a, b) => b.amount.compareTo(a.amount));

    _expense = [];
    if (_expenseChrt.length > 3) {
      for (var i = 0; i < _expenseChrt.length; i++) {
        if (i > 3) {
          _expenseChrt.elementAt(3).amount += _expenseChrt.elementAt(i).amount;
          _expenseChrt.elementAt(3).username = 'Others';
          if(i == (_expenseChrt.length-1))
            _expense.insert(3, _expenseChrt.elementAt(3));
        } else {
          _expense.add(_expenseChrt.elementAt(i));
        }
      }
    }
    _expenseChrt = [];
    return _expense;
  }

  Future getIncomeList() async {
    late List<Income> _income = [];
    late List<Income> _incomeChrt = [];
    Set<String> users = Set();
    CollectionReference fireStore =
        FirebaseFirestore.instance.collection("budgetTree");
    await fireStore.get().then(
      (res) {
        res.docChanges.forEach(
          (change) {
            if (int.parse(change.doc['amount']) > 0) {
              _income.add(
                Income(
                  change.doc["userName"],
                  double.parse(change.doc["amount"]),
                  Colors.pink,
                ),
              );
              users.add(change.doc["userName"]);
            }
          },
        );
      },
      onError: (e) => print("Error completing: $e"),
    );

    users.forEach((element) {
      _incomeChrt.add(Income(
        element,
        0,
        colorList.elementAt(
          (math.Random().nextInt(colorList.length)),
        ),
      ));
    });

    for (var inc in _income) {
      for (var incCh in _incomeChrt) {
        if (inc.username == incCh.username) {
          incCh.amount += inc.amount;
        }
      }
    }

    _incomeChrt.sort((a, b) => b.amount.compareTo(a.amount));

// FOr Income
    // if(_expenseChrt.length > 3){
    //   for(var i = 0; i < _expenseChrt.length; i++){
    //     if (i > 3){
    //       _expenseChrt.elementAt(3).amount += _expenseChrt.elementAt(i).amount;
    //       _expenseChrt.elementAt(3).username = 'Others';
    //       _expenseChrt.insert(i, new Expense("", 0, Colors.pinkAccent));
    //     }
    //   }
    // }

    _income = [];
    if (_incomeChrt.length > 3) {
      for (var i = 0; i < _incomeChrt.length; i++) {
        if (i > 3) {
          _incomeChrt.elementAt(3).amount += _incomeChrt.elementAt(i).amount;
          _incomeChrt.elementAt(3).username = 'Others';
          if(i == (_incomeChrt.length-1))
            _income.insert(3, _incomeChrt.elementAt(3));
        } else {
          _income.add(_incomeChrt.elementAt(i));
        }
      }
    }
    _incomeChrt = [];
    return _income;
  }
}
