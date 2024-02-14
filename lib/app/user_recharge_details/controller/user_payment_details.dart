// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPaymentDetailsController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var balance = 0.obs;
  var isloading = false.obs;
  var isloadings = false.obs;

  getuserinfo(var paymentdatas) async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot userDocSnapshot =
          await _firestore.collection('users').doc(paymentdatas['uid']).get();

      String balanceString = userDocSnapshot['balance'].toString();
      int balanceInt = int.parse(balanceString);
      balance.value = balanceInt;
      print("Current balance: \$${balance.value}");
    }
  }

  acceptPayment(context, var paymentdatas) async {
    try {
      isloading(true);

      int rechargeAmount = paymentdatas['rechargeAmount'] is double
          ? (paymentdatas['rechargeAmount'] as double).toInt()
          : int.parse(paymentdatas['rechargeAmount'].toString());

      int updatedBalance = balance.value + rechargeAmount;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(paymentdatas['uid'])
          .update({'balance': updatedBalance.toString()});

      balance.value = updatedBalance;

      Map<String, dynamic> acceptpayment = {
        'amount': paymentdatas['rechargeAmount'],
        'number': paymentdatas['transactionNumber'],
        'status': 'accepted',
        'uid': paymentdatas['uid'],
        'time': paymentdatas['time'],
        'timestamp': paymentdatas['timestamp'],
      };

      await FirebaseFirestore.instance
          .collection('alltransaction')
          .doc(paymentdatas['timestamp'])
          .set(acceptpayment)
          .then((value) async {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(paymentdatas['uid'])
            .collection('transaction')
            .doc(paymentdatas['timestamp'])
            .update({'status': 'accepted'}).then((value) async {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(paymentdatas['uid'])
              .update({'balance': updatedBalance.toString()});
        });
        print("Updateballance : $updatedBalance");
        await FirebaseFirestore.instance
            .collection('userWallet')
            .doc(paymentdatas['timestamp'])
            .delete();

        Get.snackbar(
          "Success",
          "Payment Accepted Successfully",
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

      print('Accept Successful');
      isloading(false);
    } catch (e) {
      print('Error: $e');
      isloading(false);
    }
  }

  rejectPayment(context, var paymentdatas) async {
    try {
      isloadings(true);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(paymentdatas['uid'])
          .collection('transaction')
          .doc(paymentdatas['timestamp'])
          .update({'status': 'rejected'}).then((value) async {
        await FirebaseFirestore.instance
            .collection('userWallet')
            .doc(paymentdatas['timestamp'])
            .delete();
        isloadings(false);
      });
    } catch (e) {
      print('Error: $e');
      isloadings(false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Try after some time"),
        ),
      );
    }
  }
}
