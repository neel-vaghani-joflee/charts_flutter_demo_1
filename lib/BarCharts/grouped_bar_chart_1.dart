import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GroupedBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;

  GroupedBarChart({required this.seriesList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grouped Chart'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: SizedBox(
                height: 300,
                child: charts.BarChart(
                  seriesList,
                  animate: false,
                  barGroupingType: charts.BarGroupingType.grouped,
                  animationDuration: Duration.zero,
                  domainAxis: charts.OrdinalAxisSpec(
                      viewport: charts.OrdinalViewport('2018', 4)),
                  behaviors: [
                    charts.SlidingViewport(),
                    charts.PanAndZoomBehavior(),
                  ],
                ),
              ),
            ),
            Container(
              height: 300,
              width: 100,
              color: Colors.yellow,
            )
          ],
        ),
      ),
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final startingBalance = [
      OrdinalSales('BOB', -10000),
      OrdinalSales('Kotak', 25),
      OrdinalSales('SBI', 500),
      OrdinalSales('JANA', 75),
      OrdinalSales('Varachha', 350),
      OrdinalSales('Cash', 20),
    ];

    final credit = [
      OrdinalSales('BOB', 150),
      OrdinalSales('Kotak', 300),
      OrdinalSales('SBI', 400),
      OrdinalSales('JANA', 20),
      OrdinalSales('Varachha', 500),
      OrdinalSales('Cash', 300),
    ];

    final debit = [
      OrdinalSales('BOB', 30),
      OrdinalSales('Kotak', 15),
      OrdinalSales('SBI', 50),
      OrdinalSales('JANA', 45),
      OrdinalSales('Varachha', 200),
      OrdinalSales('Cash', 100),
    ];
    final endingBalance = [
      OrdinalSales('BOB', 10),
      OrdinalSales('Kotak', 15),
      OrdinalSales('SBI', 50),
      OrdinalSales('JANA', 45),
      OrdinalSales('Varachha', 20),
      OrdinalSales('Cash', 100),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Starting Balance',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: startingBalance,
        fillColorFn: (datum, index) =>
            charts.ColorUtil.fromDartColor(Colors.red),
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Credit',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: credit,
        fillColorFn: (datum, index) => charts.Color.black,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Debit',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: debit,
        fillColorFn: (datum, index) => const charts.Color(b: 255, g: 100, r: 1),
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Ending Balance',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: endingBalance,
        fillColorFn: (datum, index) => const charts.Color(b: 255, g: 100, r: 1),
      ),
    ];
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
