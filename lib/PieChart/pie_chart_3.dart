import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class PieChart3 extends StatelessWidget {
  final List<charts.Series<LinearSales, int>> seriesList;
  final bool? animate;

  // ignore: use_key_in_widget_constructors
  const PieChart3(this.seriesList, {this.animate = false});

  factory PieChart3.withSampleData() {
    return PieChart3(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pie Chart 3'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: charts.PieChart<int>(seriesList,
                  animate: true,
                  animationDuration: Duration(seconds: 1),
                  defaultRenderer: charts.ArcRendererConfig(
                    arcWidth: 100, //Uncomment for a donut pie chart
                    arcRendererDecorators: [
                      charts.ArcLabelDecorator(
                          outsideLabelStyleSpec:
                              const charts.TextStyleSpec(fontSize: 2),
                          labelPadding: 0,
                          showLeaderLines: false,
                          labelPosition: charts.ArcLabelPosition.outside)
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }

  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      LinearSales(0, 20000),
      LinearSales(1, 6000),
      LinearSales(2, 3000),
      LinearSales(3, 60000),
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
