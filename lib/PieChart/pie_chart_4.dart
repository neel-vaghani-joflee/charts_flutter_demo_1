import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class PieChart4 extends StatelessWidget {
  final List<charts.Series<LinearSales, int>> seriesList;
  final bool? animate;

  PieChart4(this.seriesList, {this.animate = false});

  factory PieChart4.withSampleData() {
    return PieChart4(
      _createSampleData(),
      animate: false,
    );
  }

  factory PieChart4.withRandomData() {
    return PieChart4(_createRandomData());
  }

  static List<charts.Series<LinearSales, int>> _createRandomData() {
    final random = Random();

    final data = [
      LinearSales(0, random.nextInt(100)),
      LinearSales(1, random.nextInt(100)),
      LinearSales(2, random.nextInt(100)),
      LinearSales(3, random.nextInt(100)),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pie Chart 4'),
      ),
      body: SizedBox(
        height: 150,
        child: charts.PieChart<int>(
          seriesList,
          animate: animate,
          defaultRenderer: charts.ArcRendererConfig(
            arcWidth: 6,
          ),
        ),
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
        labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
      )
    ];
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
