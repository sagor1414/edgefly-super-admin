import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controller/pending_question_controller.dart';

class PendingQuestions extends StatelessWidget {
  const PendingQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    PendingQuestionController controller = Get.put(PendingQuestionController());
    return Scaffold(
      backgroundColor: const Color(0xff4db6e7),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 160, 206),
        elevation: 2,
        title: "Pending Question".text.white.bold.make(),
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
              !controller.loadingMore.value) {
            // Fetch more data when the user reaches the end of the list
            controller.fetchMoreData();
            log("fetching more data");
          }
          return false;
        },
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            20.heightBox,
            Obx(
              () => controller.transactionList.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            60.heightBox,
                            Text(
                              "Don't have any Pending Question",
                              style: TextStyle(
                                  fontSize: context.screenWidth * .06,
                                  fontWeight: FontWeight.w500),
                            ),
                            Image.asset(
                              'assets/images/empty.png',
                              width: context.screenWidth * .7,
                            )
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.transactionList.length,
                      itemBuilder: (context, index) {
                        var questionData =
                            controller.transactionList[index].data();
                        return Container(
                          padding: const EdgeInsets.all(8),
                          margin: EdgeInsets.only(
                            left: context.screenWidth * .05,
                            right: context.screenWidth * .05,
                            bottom: context.screenWidth * .04,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2,
                                offset: Offset(2, 2),
                              )
                            ],
                          ),
                          child: ListTile(
                            onTap: () {},
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Category: ",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: context.screenWidth * .012,
                                      ),
                                      Text(
                                        "${questionData['category']}",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            title: Row(
                              children: [
                                const Text(
                                  "Subject:  ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${questionData['subject']}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Obx(
              () => Center(
                child: controller.loadingMore.value
                    ? const CircularProgressIndicator()
                    : null,
              ),
            ),
            20.heightBox,
          ],
        ),
      ),
    );
  }
}
