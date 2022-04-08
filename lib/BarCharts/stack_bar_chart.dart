/// Bar chart example
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class StackedBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;

  StackedBarChart({required this.seriesList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300,
          child: charts.BarChart(
            seriesList,
            defaultInteractions: true,
            behaviors: [
              charts.SlidingViewport(),
              charts.SelectNearest(), charts.DomainHighlighter(),
              charts.ChartTitle('Response Time',
                  behaviorPosition: charts.BehaviorPosition.top,
                  titleOutsideJustification: charts.OutsideJustification.start,
                  innerPadding: 18),
              charts.ChartTitle('Time →',
                  behaviorPosition: charts.BehaviorPosition.bottom,
                  titleOutsideJustification:
                      charts.OutsideJustification.middleDrawArea),
              charts.ChartTitle('Aggregate →',
                  behaviorPosition: charts.BehaviorPosition.start,
                  titleOutsideJustification:
                      charts.OutsideJustification.middleDrawArea),
              charts.SeriesLegend(),
              // charts.PanBehavior()
              charts.PanAndZoomBehavior(),
            ],
            barGroupingType: charts.BarGroupingType.stacked,
          ),
        ),
      ),
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      OrdinalSales('FF', 5),
      OrdinalSales('RR', 25),
      OrdinalSales('TT', 10),
      OrdinalSales('UU', 10),
    ];

    final tableSalesData = [
      OrdinalSales('FF', 25),
      OrdinalSales('RR', 20),
      OrdinalSales('TT', 10),
      OrdinalSales('UU', 20),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
