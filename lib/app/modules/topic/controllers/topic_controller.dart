import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TopicController extends GetxController {
  var isLoading = false.obs;
  var topicData = RxMap<String, dynamic>();
  var documents = RxList<DocumentSnapshot>();
  var documentIds = <String>[].obs;

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

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    for (int i = 0; i < allData.length; i++) {
      topicData[i.toString()] = allData[i];
    }

    isLoading(false);
  }
}
