// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

Widget BarChartShow() {
  return BarChart(
    BarChartData(
      alignment: BarChartAlignment.spaceAround,
      maxY: 6,
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.blueAccent,
        ),
        touchCallback: (barTouchResponse) {
          // Handle touch interactions here
        },
      ),
      titlesData: FlTitlesData(
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (BuildContext, double) {
            return const TextStyle(color: Colors.black);
          },
          margin: 8,
          reservedSize: 30,
        ),
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (BuildContext, double) {
            return const TextStyle(color: Colors.black);
          },
          margin: 8,
          getTitles: (double value) {
            // You can customize the bottom titles here
            switch (value.toInt()) {
              case 0:
                return 'Jan';
              case 1:
                return 'Feb';
              case 2:
                return 'Mar';
              case 3:
                return 'Apr';
              case 4:
                return 'May';
              case 5:
                return 'Jun';
              default:
                return '';
            }
          },
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 1),
      ),
      barGroups: [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              y: 3,
              colors: [Colors.blueAccent],
            ),
          ],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              y: 2.5,
              colors: [Colors.blueAccent],
            ),
          ],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              y: 4,
              colors: [Colors.blueAccent],
            ),
          ],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              y: 5,
              colors: [Colors.blueAccent],
            ),
          ],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              y: 1,
              colors: [Colors.blueAccent],
            ),
          ],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              y: 2,
              colors: [Colors.blueAccent],
            ),
          ],
        ),
      ],
    ),
  );
}
