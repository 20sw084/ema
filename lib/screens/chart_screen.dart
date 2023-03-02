import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 1205, Colors.pinkAccent),
      ChartData('Steve', 8, Colors.purple),
      ChartData('Jack', 1204, Colors.green),
      ChartData('Others', 2, Colors.grey)
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Charts"),
        ),
        body: Container(
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
