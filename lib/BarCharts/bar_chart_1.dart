import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class InitialHintAnimation extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  InitialHintAnimation(this.seriesList, {this.animate = false});

  factory InitialHintAnimation.withSampleData() {
    return InitialHintAnimation(
      _createSampleData(),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar Chart 1'),
      ),
      body: Container(
        padding: const EdgeInsets.all(6),
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
        margin: EdgeInsets.all(30),
        height: 300,
        width: 380,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints.expand(height: 50.0),
                child: charts.BarChart(
                  seriesList,
                  animate: true,
                  barRendererDecorator: charts.BarLabelDecorator<String>(
                      labelPosition: charts.BarLabelPosition.outside),
                  domainAxis: const charts.OrdinalAxisSpec(),
                  primaryMeasureAxis: const charts.NumericAxisSpec(
                      renderSpec: charts.NoneRenderSpec(), showAxisLine: false),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      OrdinalSales('Start Balance', 500),
      OrdinalSales('End Balance', 30),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
        labelAccessorFn: (OrdinalSales sales, _) =>
            '\₹${sales.sales.toString()}',
        fillColorFn: (OrdinalSales mileage, _) =>
            charts.ColorUtil.fromDartColor(Colors.red),
      )
    ];
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
