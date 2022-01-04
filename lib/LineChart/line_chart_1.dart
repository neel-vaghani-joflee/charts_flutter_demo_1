import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleLineChart extends StatelessWidget {
  final List<charts.Series<dynamic, num>> seriesList;
  final bool animate;

  SimpleLineChart(this.seriesList, {this.animate = false});

  factory SimpleLineChart.withSampleData() {
    return SimpleLineChart(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(30, 30),
                blurRadius: 30,
                color: Colors.grey.shade400,
              ),
            ],
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          height: 300,
          width: 300,
          child: charts.LineChart(seriesList, animate: true),
        ),
      ),
    );
  }

  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      LinearSales(0, 5),
      LinearSales(1, 600),
      LinearSales(2, 100),
      LinearSales(3, 75),
    ];
    final data2 = [
      LinearSales(0, 800),
      LinearSales(1, 200),
      LinearSales(2, 900),
      LinearSales(3, 50),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      ),
      charts.Series<LinearSales, int>(
        id: 'Sale',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data2,
      ),
    ];
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
