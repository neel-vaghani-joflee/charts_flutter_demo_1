import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class PieChart1 extends StatelessWidget {
  //  final List<charts.Series> seriesList;
  final List<charts.Series<LinearSales, int>> seriesList;
  //  final bool? animate;
  final bool? animate;

  PieChart1(this.seriesList, {this.animate});

  factory PieChart1.withSampleData() {
    return PieChart1(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pie Chart 1'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 200,
            height: 600,
            // child: charts.PieChart(
            child: charts.PieChart<int>(
              seriesList,
              animate: animate,
              defaultRenderer: charts.ArcRendererConfig(arcWidth: 60),
            ),
          ),
        ],
      ),
    );
  }

  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      LinearSales(0, 100),
      LinearSales(1, 75),
      LinearSales(2, 25),
      LinearSales(3, 5),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
