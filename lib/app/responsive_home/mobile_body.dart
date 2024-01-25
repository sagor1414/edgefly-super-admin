import 'package:edgefly_super_admin/app/widgets/drower.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'component/bar_chart.dart';
import 'component/line_chart.dart';
import 'component/pei_chart.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({Key? key}) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8effa),
      appBar: AppBar(
        title: "Dashboard".text.make(),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: EdgeInsets.all(context.screenWidth * .048),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    "User Progess".text.overflow(TextOverflow.ellipsis).make(),
                    5.heightBox,
                    SizedBox(
                      height: context.screenHeight * .35,
                      width: context.screenWidth * .90,
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: BarChartSample(),
                      ),
                    ),
                  ],
                ),
              ),
              20.heightBox,
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
                      height: context.screenHeight * .35,
                      width: context.screenWidth * .90,
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: PieChartSample(),
                      ),
                    ),
                  ],
                ),
              ),
              20.heightBox,
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    "Admin Progess".text.overflow(TextOverflow.ellipsis).make(),
                    5.heightBox,
                    SizedBox(
                      height: context.screenHeight * .35,
                      width: context.screenWidth * .90,
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: BarChartSample(),
                      ),
                    ),
                  ],
                ),
              ),
              20.heightBox,
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    "Overall Progess"
                        .text
                        .overflow(TextOverflow.ellipsis)
                        .make(),
                    5.heightBox,
                    SizedBox(
                      height: context.screenHeight * .35,
                      width: context.screenWidth * .90,
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: LineChartSample(),
                      ),
                    ),
                  ],
                ),
              ),
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
