import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TopicController extends GetxController {
  var topicData = RxMap<String, dynamic>();
  var documents = RxList<DocumentSnapshot>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    readData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> readData() async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('quiz_topic');

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    for (int i = 0; i < allData.length; i++) {
      topicData[i.toString()] = allData[i];
    }
  }

  void increment() => count.value++;
}
