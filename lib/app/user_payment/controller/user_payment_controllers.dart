import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserPaymentControllers extends GetxController {
  var uid = FirebaseAuth.instance.currentUser!.uid;
  var loadingMore = false.obs;
  RxList<QueryDocumentSnapshot<Map<String, dynamic>>> questionlist =
      <QueryDocumentSnapshot<Map<String, dynamic>>>[].obs;

  DocumentSnapshot<Map<String, dynamic>>? lastDocument;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {
    FirebaseFirestore.instance
        .collection('userwithdraw')
        .orderBy('timestamp', descending: true)
        .limit(15)
        .snapshots()
        .listen((snapshot) {
      questionlist.assignAll(snapshot.docs);
      if (snapshot.docs.isNotEmpty) {
        lastDocument = snapshot.docs.last;

        log(questionlist.length.toString());
      }
    }, onError: (e) {
      log("Error fetching data: $e");
    });
  }

  void fetchMoreData() {
    if (!loadingMore.value && lastDocument != null) {
      loadingMore(true); // Set loadingMore to true to prevent multiple calls
      FirebaseFirestore.instance
          .collection('userwithdraw')
          .orderBy('timestamp', descending: true)
          .startAfterDocument(lastDocument!)
          .limit(15)
          .get()
          .then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          // Append the new documents to the existing list
          questionlist.addAll(snapshot.docs);
          // Update the lastDocument for the next pagination
          lastDocument = snapshot.docs.last;
          log("New lastDocument ID: ${lastDocument!.id}");
          log("Updated transactionList length: ${questionlist.length}");
          log("fetching more data");
        }
      }).catchError((e) {
        log("Error fetching more data: $e");
      }).whenComplete(() {
        loadingMore(false);
      });
    }
  }
}
