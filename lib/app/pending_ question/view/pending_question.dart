import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../pending_question_list/view/pending_question_physics.dart';

class PendingQuestions extends StatelessWidget {
  const PendingQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff3778c8),
          elevation: 2,
          title: "Pending Question".text.white.bold.make(),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff3777c8),
                Color.fromARGB(255, 89, 215, 247),
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "Select an subject".text.size(20).white.make(),
                20.heightBox,
                SizedBox(
                  height: 80,
                  width: context.screenWidth * .4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[200]),
                    onPressed: () {
                      Get.to(
                        () => PendingQuestionPhysics(
                          subject: "Physics",
                        ),
                      );
                    },
                    child: "Physics".text.white.make(),
                  ),
                ),
                20.heightBox,
                SizedBox(
                  height: 80,
                  width: context.screenWidth * .4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[200]),
                    onPressed: () {
                      Get.to(
                        () => PendingQuestionPhysics(
                          subject: "Chemistry",
                        ),
                      );
                    },
                    child: "Chemistry".text.white.make(),
                  ),
                ),
                20.heightBox,
                SizedBox(
                  height: 80,
                  width: context.screenWidth * .4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[200]),
                    onPressed: () {
                      Get.to(
                        () => PendingQuestionPhysics(
                          subject: "Biology",
                        ),
                      );
                    },
                    child: "Biology".text.white.make(),
                  ),
                ),
                20.heightBox,
                SizedBox(
                  height: 80,
                  width: context.screenWidth * .4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple[200]),
                    onPressed: () {
                      Get.to(
                        () => PendingQuestionPhysics(
                          subject: "Hiremath",
                        ),
                      );
                    },
                    child: "Hiremath".text.white.make(),
                  ),
                ),
                20.heightBox,
              ],
            ),
          ),
        ));
  }
}
