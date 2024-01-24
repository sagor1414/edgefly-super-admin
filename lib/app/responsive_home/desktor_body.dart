import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/drower.dart';
import 'component/bar_chart.dart';
import 'component/line_chart.dart';
import 'component/pei_chart.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({Key? key}) : super(key: key);

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // open drawer
          const MyDrawer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        "User Progess previous 6 month"
                            .text
                            .overflow(TextOverflow.ellipsis)
                            .make(),
                        5.heightBox,
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: context.screenHeight * .4,
                          width: context.screenWidth * .3,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: BarChartShow(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: context.screenWidth * .03,
                    ),
                    Column(
                      children: [
                        "User Progess current month"
                            .text
                            .overflow(TextOverflow.ellipsis)
                            .make(),
                        5.heightBox,
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: context.screenHeight * .4,
                          width: context.screenWidth * .3,
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: PieChartSample(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        "Admin Progess previous 6 month"
                            .text
                            .overflow(TextOverflow.ellipsis)
                            .make(),
                        5.heightBox,
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: context.screenHeight * .4,
                          width: context.screenWidth * .3,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: BarChartShow(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: context.screenWidth * .03,
                    ),
                    Column(
                      children: [
                        "Overall Progess previous 6 month"
                            .text
                            .overflow(TextOverflow.ellipsis)
                            .make(),
                        5.heightBox,
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: context.screenHeight * .4,
                          width: context.screenWidth * .3,
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: LineChartSample(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
