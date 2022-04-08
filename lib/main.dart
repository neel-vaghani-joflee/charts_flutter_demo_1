import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'BarCharts/bar_chart_1.dart';
import 'BarCharts/grouped_bar_chart_1.dart';
import 'BarCharts/stack_bar_chart.dart';
import 'CommonWidget/main_page_list_tile.dart';
import 'LineChart/line_chart_1.dart';
import 'PieChart/pie_chart_1.dart';
import 'PieChart/pie_chart_2.dart';
import 'PieChart/pie_chart_3.dart';
import 'PieChart/pie_chart_4.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'PieChart/pie_chart_5.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // ignore: prefer_const_constructors
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color.fromRGBO(0, 137, 116, 1),
        ),
      ),
      home: const MyHomePage(title: 'Chart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<charts.Series<AccountChartData, String>> createSampleData() {
    final startingBalance = [
      AccountChartData('BOB', -10000, -2000000),
      AccountChartData('Kotak', 25, 4),
      AccountChartData('SBI', 500, 4),
      AccountChartData('JANA', 75, 4),
      AccountChartData('Varachha', 350, 4),
      AccountChartData('Cash', 20, 4),
    ];

    final credit = [
      AccountChartData('BOB', 150, 4),
      AccountChartData('Kotak', 300, 4),
      AccountChartData('SBI', 400, 4),
      AccountChartData('JANA', 20, 4),
      AccountChartData('Varachha', 500, 4),
      AccountChartData('Cash', 300, 4),
    ];

    final debit = [
      AccountChartData('BOB', 30, 4),
      AccountChartData('Kotak', 15, 4),
      AccountChartData('SBI', 50, 4),
      AccountChartData('JANA', 45, 4),
      AccountChartData('Varachha', 200, 4),
      AccountChartData('Cash', 100, 4),
    ];
    final endingBalance = [
      AccountChartData('BOB', 10, 4),
      AccountChartData('Kotak', 15, 4),
      AccountChartData('SBI', 50, 4),
      AccountChartData('JANA', 45, 4),
      AccountChartData('Varachha', 20, 4),
      AccountChartData('Cash', 100, 4),
    ];

    return [
      charts.Series<AccountChartData, String>(
        id: 'Starting Balance',
        domainFn: (AccountChartData sales, _) => sales.accountName,
        measureFn: (AccountChartData sales, _) => sales.amount,
        data: startingBalance,
        fillColorFn: (datum, index) =>
            charts.ColorUtil.fromDartColor(Colors.red),
      ),
      charts.Series<AccountChartData, String>(
        id: 'Credit',
        domainFn: (AccountChartData sales, _) => sales.accountName,
        measureFn: (AccountChartData sales, _) => sales.amount,
        data: credit,
        fillColorFn: (datum, index) => charts.Color.black,
      ),
      charts.Series<AccountChartData, String>(
        id: 'Debit',
        domainFn: (AccountChartData sales, _) => sales.accountName,
        measureFn: (AccountChartData sales, _) => sales.amount,
        data: debit,
        fillColorFn: (datum, index) => const charts.Color(b: 255, g: 100, r: 1),
      ),
      charts.Series<AccountChartData, String>(
        id: 'Ending Balance',
        domainFn: (AccountChartData sales, _) => sales.accountName,
        measureFn: (AccountChartData sales, _) => sales.amount,
        data: endingBalance,
        fillColorFn: (datum, index) => const charts.Color(b: 255, g: 100, r: 1),
      ),
    ];
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      OrdinalSales('2015', 5),
      OrdinalSales('2016', 25),
      OrdinalSales('2017', 20),
      OrdinalSales('2018', 75),
      OrdinalSales('2019', 75),
      OrdinalSales('2020', 75),
      OrdinalSales('2021', 75),
      OrdinalSales('2022', 75),
      OrdinalSales('2023', 75),
      OrdinalSales('2024', 75),
      OrdinalSales('2025', 75),
      OrdinalSales('2026', 75),
      OrdinalSales('2027', 75),
    ];

    final tableSalesData = [
      OrdinalSales('2015', 5),
      OrdinalSales('2016', 25),
      OrdinalSales('2017', 20),
      OrdinalSales('2018', 75),
      OrdinalSales('2019', 75),
      OrdinalSales('2020', 75),
      OrdinalSales('2021', 75),
      OrdinalSales('2022', 75),
      OrdinalSales('2023', 75),
      OrdinalSales('2024', 75),
      OrdinalSales('2025', 75),
      OrdinalSales('2026', 75),
      OrdinalSales('2027', 75),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            // StackedBarChart
            MainPageListTile(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => StackedBarChart(
                            seriesList: _createSampleData(),
                          )),
                );
              },
              text: 'Stack Bar Chart',
            ),
            const SizedBox(
              height: 16,
            ),

            MainPageListTile(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) =>
                          InitialHintAnimation.withSampleData()),
                );
              },
              text: 'Bar Chart 1',
            ),
            const SizedBox(
              height: 16,
            ),
            MainPageListTile(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => GroupedBarChart(
                            seriesList: createSampleData(),
                          )),
                );
              },
              text: 'Grouped ar Chart 1',
            ),
            const SizedBox(
              height: 16,
            ),
            MainPageListTile(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => PieChart1.withSampleData()),
                );
              },
              text: 'PieChart 1',
            ),
            const SizedBox(
              height: 16,
            ),
            MainPageListTile(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => PieChart2.withSampleData()),
                );
              },
              text: 'PieChart 2',
            ),
            const SizedBox(
              height: 16,
            ),
            MainPageListTile(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => PieChart3.withSampleData()),
                );
              },
              text: 'PieChart 3',
            ),
            const SizedBox(
              height: 16,
            ),
            MainPageListTile(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => PieChart4.withSampleData()),
                );
              },
              text: 'PieChart 4',
            ),
            const SizedBox(
              height: 16,
            ),
            MainPageListTile(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => SimpleLineChart.withSampleData()),
                );
              },
              text: 'Line Chart',
            ),
            const SizedBox(
              height: 16,
            ),

            // MainPageListTile(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       CupertinoPageRoute(builder: (context) => MyUi()),
            //     );
            //   },
            //   text: 'UI',
            // ),
            // const SizedBox(
            //   height: 16,
            // ),
          ],
        ),
      ),
    );
  }
}

class AccountChartData {
  final String accountName;
  final int amount;
  final int endingBalance;

  AccountChartData(this.accountName, this.amount, this.endingBalance);
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
