// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartSample extends StatelessWidget {
  const BarChartSample({super.key});

  @override
  Widget build(BuildContext context) {
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
            getTextStyles: (context, value) =>
                const TextStyle(color: Colors.black),
            margin: 8,
            reservedSize: 30,
          ),
          bottomTitles: SideTitles(
            showTitles: true,
            getTextStyles: (context, value) => const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
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
          border: Border.all(color: Colors.grey, width: 1),
        ),
        gridData: FlGridData(
          show: true,
          horizontalInterval: 1.0,
          drawHorizontalLine: true,
          checkToShowHorizontalLine: (value) => value % 1 == 0,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey,
              strokeWidth: 0.5,
            );
          },
        ),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                y: 3,
                colors: [Colors.blueAccent],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                y: 2.5,
                colors: [Colors.blueAccent],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                y: 4,
                colors: [Colors.blueAccent],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                y: 5,
                colors: [Colors.blueAccent],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(
                y: 1,
                colors: [Colors.blueAccent],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
              ),
            ],
          ),
          BarChartGroupData(
            x: 5,
            barRods: [
              BarChartRodData(
                y: 2,
                colors: [Colors.blueAccent],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
