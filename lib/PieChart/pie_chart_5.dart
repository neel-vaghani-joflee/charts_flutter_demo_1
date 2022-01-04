import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class GaugeChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool? animate;

  GaugeChart(this.seriesList, {this.animate = false});

  factory GaugeChart.withSampleData() {
    return GaugeChart(
      _createSampleData(),
      animate: false,
    );
  }

  factory GaugeChart.withRandomData() {
    return GaugeChart(_createRandomData());
  }

  static List<charts.Series<GaugeSegment, String>> _createRandomData() {
    final random = Random();

    final data = [
      GaugeSegment('Low', random.nextInt(100)),
      GaugeSegment('Acceptable', random.nextInt(100)),
      GaugeSegment('High', random.nextInt(100)),
      GaugeSegment('Highly Unusual', random.nextInt(100)),
    ];

    return [
      charts.Series<GaugeSegment, String>(
        id: 'Segments',
        domainFn: (GaugeSegment segment, _) => segment.segment,
        measureFn: (GaugeSegment segment, _) => segment.size,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: charts.PieChart<String>(seriesList,
          animate: animate,
          defaultRenderer: charts.ArcRendererConfig(
              arcWidth: 30, startAngle: 4 / 5 * pi, arcLength: 7 / 5 * pi)),
    );
  }

  static List<charts.Series<GaugeSegment, String>> _createSampleData() {
    final data = [
      GaugeSegment('Low', 75),
      GaugeSegment('Acceptable', 100),
      GaugeSegment('High', 50),
      GaugeSegment('Highly Unusual', 5),
    ];

    return [
      charts.Series<GaugeSegment, String>(
        id: 'Segments',
        domainFn: (GaugeSegment segment, _) => segment.segment,
        measureFn: (GaugeSegment segment, _) => segment.size,
        data: data,
      )
    ];
  }
}

class GaugeSegment {
  final String segment;
  final int size;

  GaugeSegment(this.segment, this.size);
}
