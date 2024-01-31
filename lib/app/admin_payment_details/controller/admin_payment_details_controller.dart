import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AdminPaymentDetailsController extends GetxController {
  var isloading = false.obs;
  var isloadings = false.obs;

  acceptPayment(context, var questiondata) async {
    try {
      isloading(true);
      Map<String, dynamic> acceptpayment = {
        'amount': questiondata['amount'],
        'number': questiondata['number'],
        'status': 'accepted',
        'uid': questiondata['uid'],
        'time': questiondata['time'],
        'timestamp': questiondata['timestamp'],
      };

      await FirebaseFirestore.instance
          .collection('acceptedPayment')
          .doc(questiondata['timestamp'])
          .set(acceptpayment)
          .then((value) async {
        await FirebaseFirestore.instance
            .collection('questionsetter')
            .doc(questiondata['uid'])
            .collection('transaction')
            .doc(questiondata['timestamp'])
            .update({'status': 'accepted'}).then((value) async {
          await FirebaseFirestore.instance
              .collection('adminPayment')
              .doc(questiondata['timestamp'])
              .delete();
        });

        Get.snackbar(
          "sucessfull",
          "Payment Accepted Sucessfully",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
          borderRadius: 20,
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          colorText: Colors.black,
          duration: const Duration(seconds: 3),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          forwardAnimationCurve: Curves.easeOutBack,
        );
      });

      log('Accept Sucessfull');
      isloading(false);
    } catch (e) {
      log('Error is : $e');
      isloading(false);
    }
  }

  rejectPayment(context, var questiondata) async {
    try {
      isloadings.value = true;
      await FirebaseFirestore.instance
          .collection('questionsetter')
          .doc(questiondata['uid'])
          .collection('transaction')
          .doc(questiondata['timestamp'])
          .update({'status': 'rejected'}).then((value) async {
        await FirebaseFirestore.instance
            .collection('adminPayment')
            .doc(questiondata['timestamp'])
            .delete();
        isloadings.value = false;
      });
    } catch (e) {
      isloadings.value = false;
      VxToast.show(context, msg: "Try after some time");
    }
  }
}
