import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuestionReviewController extends GetxController {
  var isloading = false.obs;

  acceptQuestio(context, var questiondata) async {
    try {
      isloading(true);
      Map<String, dynamic> acceptquestion = {
        'category': questiondata['category'],
        'subject': questiondata['subject'],
        'chapter': questiondata['chapter'],
        'question': questiondata['question'],
        'option1': questiondata['option1'],
        'option2': questiondata['option2'],
        'option3': questiondata['option3'],
        'option4': questiondata['option4'],
        'answer': questiondata['answer'],
        'status': 'accepted',
        'qsUid': questiondata['qsUid'],
        'submitTime': questiondata['submitTime'],
        'timestamp': questiondata['timestamp'],
      };

      await FirebaseFirestore.instance
          .collection('question')
          .doc(questiondata['category'])
          .collection(questiondata['subject'])
          .doc(questiondata['timestamp'])
          .set(acceptquestion)
          .then((value) async {
        await FirebaseFirestore.instance
            .collection('questionsetter')
            .doc(questiondata['qsUid'])
            .collection('question')
            .doc(questiondata['timestamp'])
            .update({'status': 'accepted'}).then((value) async {
          await FirebaseFirestore.instance
              .collection('PendingQestions')
              .doc(questiondata['timestamp'])
              .delete();
        });

        Get.snackbar(
          "sucessfull",
          "Question Accepted Sucessfully",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.grey[400],
          borderRadius: 20,
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          colorText: Colors.black,
          duration: const Duration(seconds: 3),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          forwardAnimationCurve: Curves.easeOutBack,
        );
        Get.back();
      });

      log('Accept Sucessfull');
      isloading(false);
    } catch (e) {
      log('Error is : $e');
      isloading(false);
    }
  }
}