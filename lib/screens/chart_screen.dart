import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../utils/utils.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 15, Colors.pinkAccent),
      ChartData('Steve', 8, Colors.purple),
      ChartData('Jack', 14, Colors.green),
      ChartData('Others', 2, Colors.grey)
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
              child: Text("Income",style: Utils.ts1(context),),
            ),
            Row(
              children: [
                Container(
                  child: SfCircularChart(
                    series: <CircularSeries>[
                      // Render pie chart
                      PieSeries<ChartData, String>(
                          dataSource: chartData,
                          pointColorMapper: (ChartData data, _) => data.color,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y),
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
              child: Text("Expense",style: Utils.ts1(context),),
            ),
            Container(
              child: SfCircularChart(
                series: <CircularSeries>[
                  // Render pie chart
                  PieSeries<ChartData, String>(
                      dataSource: chartData,
                      pointColorMapper: (ChartData data, _) => data.color,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}
