import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PendingQuestionController extends GetxController {
  var loadingMore = false.obs;
  final CollectionReference questionSetterCollection =
      FirebaseFirestore.instance.collection('questionsetter');

  RxList<QueryDocumentSnapshot<Map<String, dynamic>>> transactionList =
      <QueryDocumentSnapshot<Map<String, dynamic>>>[].obs;

  DocumentSnapshot<Map<String, dynamic>>? lastDocument;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {
    questionSetterCollection.snapshots().listen((questionSetterSnapshot) {
      // Loop through each document in the 'questionsetter' collection
      questionSetterSnapshot.docs.forEach((questionSetterDocument) {
        String questionSetterDocumentId = questionSetterDocument.id;

        // Access the 'question' subcollection for the current document
        questionSetterCollection
            .doc(questionSetterDocumentId)
            .collection('question')
            .orderBy('timestamp', descending: true)
            .where('status', isEqualTo: 'pending')
            .limit(15)
            .snapshots()
            .listen((snapshot) {
          // Process the data from the 'question' subcollection for each document
          transactionList.assignAll(snapshot.docs);
          if (snapshot.docs.isNotEmpty) {
            lastDocument = snapshot.docs.last;
            log(transactionList.length.toString());
          }
        }, onError: (e) {
          log("Error fetching data: $e");
        });
      });
    }, onError: (e) {
      log("Error fetching data: $e");
    });
  }

  void fetchMoreData() {
    if (!loadingMore.value && lastDocument != null) {
      loadingMore(true); // Set loadingMore to true to prevent multiple calls
      questionSetterCollection
          .doc()
          .collection('question')
          .orderBy('timestamp', descending: true)
          .where('status', isEqualTo: 'pending')
          .startAfterDocument(lastDocument!)
          .limit(15)
          .get()
          .then((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          // Append the new documents to the existing list
          transactionList.addAll(snapshot.docs);
          // Update the lastDocument for the next pagination
          lastDocument = snapshot.docs.last;
          log("New lastDocument ID: ${lastDocument!.id}");
          log("Updated transactionList length: ${transactionList.length}");
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
