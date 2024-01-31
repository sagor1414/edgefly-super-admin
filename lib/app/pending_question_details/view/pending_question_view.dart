import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controller/pending_to_add_reject.dart';

// ignore: must_be_immutable
class PendingQuestionDetails extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var questionData;
  PendingQuestionDetails({super.key, this.questionData});

  @override
  Widget build(BuildContext context) {
    QuestionReviewController controller = Get.put(QuestionReviewController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 204, 217, 253),
        elevation: 1,
        title: const Text('Question details'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: context.screenWidth,
                padding: EdgeInsets.all(context.screenHeight * .05),
                decoration: BoxDecoration(
                  color: const Color(0xff4bb050),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(context.screenHeight * .02),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Chapter: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Expanded(
                            child: Text(
                              "${questionData['chapter']}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(context.screenHeight * .02),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Question: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Expanded(
                            child: Text(
                              "${questionData['question']}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(context.screenHeight * .02),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Option 1: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Expanded(
                            child: Text(
                              "${questionData['option1']}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(context.screenHeight * .02),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Option 2: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Expanded(
                            child: Text(
                              "${questionData['option2']}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(context.screenHeight * .02),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Option 3: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Expanded(
                            child: Text(
                              "${questionData['option3']}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(context.screenHeight * .02),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Option 4: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Expanded(
                            child: Text(
                              "${questionData['option4']}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.heightBox,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(context.screenHeight * .02),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Correct answer: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Expanded(
                            child: Text(
                              "${questionData['answer']}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: context.screenWidth * .3,
                          height: context.screenHeight * .06,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () async {
                              await controller.rejectQuestion(
                                  context, questionData);
                              Get.back();
                            },
                            child: Obx(
                              () => controller.isloadings.value
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : const Text(
                                      "Reject",
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.screenWidth * .3,
                          height: context.screenHeight * .06,
                          child: ElevatedButton(
                            onPressed: () async {
                              await controller.acceptQuestio(
                                  context, questionData);
                              Get.back();
                            },
                            child: Obx(
                              () => controller.isloading.value
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : const Text("Accept"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
