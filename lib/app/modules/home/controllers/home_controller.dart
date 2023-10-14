import 'dart:math';

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var quizData = RxMap<String, dynamic>();
  var documentIds = <String>[].obs;

  var randomDocId = "".obs;

  @override
  void onInit() {
    super.onInit();
    readData();
  }

  Future<void> readData() async {
    isLoading(true);

    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('quiz_topic');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await collectionRef.get();

    for (var doc in querySnapshot.docs) {
      documentIds.add(doc.id);
    }

    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    for (int i = 0; i < allData.length; i++) {
      quizData[i.toString()] = allData[i];
    }

    isLoading(false);
  }

  void randomizeDocId() {
    Random random = Random();

    int randomIndex = random.nextInt(documentIds.length);
    randomDocId.value = documentIds[randomIndex];
  }
}
