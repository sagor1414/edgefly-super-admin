import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartSample extends StatelessWidget {
  const PieChartSample({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sectionsSpace: 5,
        centerSpaceRadius: 40,
        startDegreeOffset: 180,
        sections: [
          PieChartSectionData(
            color: Colors.blue,
            value: 30,
            title: '30%',
            radius: 50,
            titleStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff)),
          ),
          PieChartSectionData(
            color: Colors.green,
            value: 40,
            title: '40%',
            radius: 50,
            titleStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff)),
          ),
          PieChartSectionData(
            color: Colors.orange,
            value: 15,
            title: '15%',
            radius: 50,
            titleStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff)),
          ),
          PieChartSectionData(
            color: Colors.red,
            value: 15,
            title: '15%',
            radius: 50,
            titleStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff)),
          ),
        ],
        borderData: FlBorderData(
          show: false,
        ),
      ),
    );
  }
}
