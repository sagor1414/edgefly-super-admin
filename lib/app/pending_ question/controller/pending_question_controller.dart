import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PendingQuestionController extends GetxController {
  var loadingMore = false.obs;
  DocumentSnapshot<Map<String, dynamic>>? lastDocument;
  @override
  void onInit() {
    super.onInit();
    fetchQuestions();
  }

  RxList<QueryDocumentSnapshot<Map<String, dynamic>>> questions =
      <QueryDocumentSnapshot<Map<String, dynamic>>>[].obs;

  Future<void> fetchQuestions() async {
    try {
      QuerySnapshot<Map<String, dynamic>> questionSetterSnapshot =
          await FirebaseFirestore.instance.collection('questionsetter').get();

      for (var questionSetterDoc in questionSetterSnapshot.docs) {
        String documentID = questionSetterDoc.id;
        QuerySnapshot<Map<String, dynamic>> questionSnapshot =
            await FirebaseFirestore.instance
                .collection('questionsetter')
                .doc(documentID)
                .collection('question')
                .where('status', isEqualTo: 'pending')
                .get();

        questions.addAll(questionSnapshot.docs);
      }
    } catch (e) {
      // ignore: avoid_print
      print("Error fetching questions: $e");
    }
  }
}
