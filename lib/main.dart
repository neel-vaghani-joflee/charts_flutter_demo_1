import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'BarCharts/bar_chart_1.dart';
import 'BarCharts/grouped_bar_chart_1.dart';
import 'CommonWidget/main_page_list_tile.dart';
import 'LineChart/line_chart_1.dart';
import 'PieChart/pie_chart_1.dart';
import 'PieChart/pie_chart_2.dart';
import 'PieChart/pie_chart_3.dart';
import 'PieChart/pie_chart_4.dart';
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
                      builder: (context) => GroupedBarChart.withSampleData()),
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
