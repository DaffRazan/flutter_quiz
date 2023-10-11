import 'package:get/get.dart';

class QuizController extends GetxController {
  final count = 0.obs;
  var timerRunning = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
