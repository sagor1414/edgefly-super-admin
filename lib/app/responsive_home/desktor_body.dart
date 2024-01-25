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
      backgroundColor: const Color(0xffe8effa),
      body: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // open drawer
          const MyDrawer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          "User Progess previous 6 month"
                              .text
                              .overflow(TextOverflow.ellipsis)
                              .make(),
                          5.heightBox,
                          SizedBox(
                            height: context.screenHeight * .4,
                            width: context.screenWidth * .344,
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: BarChartSample(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: context.screenWidth * .025,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          "User Progess current month"
                              .text
                              .overflow(TextOverflow.ellipsis)
                              .make(),
                          5.heightBox,
                          SizedBox(
                            height: context.screenHeight * .4,
                            width: context.screenWidth * .344,
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: PieChartSample(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          "Admin Progess previous 6 month"
                              .text
                              .overflow(TextOverflow.ellipsis)
                              .make(),
                          5.heightBox,
                          SizedBox(
                            height: context.screenHeight * .4,
                            width: context.screenWidth * .344,
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: BarChartSample(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: context.screenWidth * .025,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          "Overall Progess previous 6 month"
                              .text
                              .overflow(TextOverflow.ellipsis)
                              .make(),
                          5.heightBox,
                          SizedBox(
                            height: context.screenHeight * .4,
                            width: context.screenWidth * .344,
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: LineChartSample(),
                            ),
                          ),
                        ],
                      ),
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
