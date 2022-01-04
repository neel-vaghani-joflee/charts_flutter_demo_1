import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';

class PieChart2 extends StatelessWidget {
  final List<charts.Series<LinearSales, int>> seriesList;
  final bool? animate;

  PieChart2(this.seriesList, {this.animate = false});

  factory PieChart2.withSampleData() {
    return PieChart2(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pie Chart 2'),
      ),
      body: Center(
        child: SizedBox(
          height: 400,
          child: charts.PieChart<int>(
            seriesList,
            animate: true,
            behaviors: [
              charts.InitialSelection(selectedDataConfig: [
                charts.SeriesDatumConfig<int>('Sales', 200)
              ]),
              charts.DomainHighlighter(),
            ],
            defaultRenderer: charts.ArcRendererConfig(
              strokeWidthPx: .01,
              arcRendererDecorators: [],
            ),
          ),
        ),
      ),
    );
  }

  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      LinearSales(0, 6),
      LinearSales(1, 5),
      LinearSales(2, 3),
      LinearSales(3, 4),
      LinearSales(4, 8),
      LinearSales(5, 8),
      LinearSales(6, 8),
      LinearSales(7, 7),
      LinearSales(8, 6),
      LinearSales(9, 1),
      LinearSales(10, 2),
      LinearSales(11, 3),
      LinearSales(12, 7),
      LinearSales(13, 4),
      LinearSales(14, 7),
      LinearSales(15, 7),
      LinearSales(16, 5),
      LinearSales(17, 2),
      LinearSales(18, 3),
      LinearSales(19, 6),
      LinearSales(20, 2),
      LinearSales(21, 8),
      LinearSales(22, 5),
      LinearSales(23, 2),
      LinearSales(24, 5),
      LinearSales(25, 5),
      LinearSales(26, 2),
      LinearSales(27, 5),
      LinearSales(28, 3),
      LinearSales(29, 3),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,

        labelAccessorFn: (LinearSales row, _) => '${row.year}',
        // areaColorFn: (datum, index) =>
        //     charts.ColorUtil.fromDartColor(Colors.red),
        // colorFn: (datum, index) => charts.ColorUtil.fromDartColor(
        //     index == 2 ? Colors.red : Colors.green),
      ),
    ];
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
