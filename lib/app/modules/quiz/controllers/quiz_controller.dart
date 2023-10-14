import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:linear_timer/linear_timer.dart';

class QuizController extends GetxController with GetTickerProviderStateMixin {
  final String docId;

  QuizController(this.docId);

  var isLoading = false.obs;

  // all quiz data
  var quizData = RxMap<String, dynamic>();

  // track quiz index
  var quizIndex = 0.obs;

  // quiz length
  var quizLength = 0.obs;

  // user answer
  var userAnswer = "".obs;
  var userAnswerList = <String>[].obs;

  // total of corrected answer user
  var correctedAnswer = 0.obs;

  late LinearTimerController timerController = LinearTimerController(this);

  @override
  void onInit() async {
    super.onInit();

    await readData(docId);
  }

  @override
  void onReady() {
    super.onReady();
    timerController.start();
  }

  @override
  void onClose() {
    timerController.dispose();

    super.dispose();
  }

  Future<void> readData(String id) async {
    isLoading(true);

    try {
      final DocumentSnapshot document = await FirebaseFirestore.instance
          .collection('quiz_topic')
          .doc(id)
          .get();

      if (document.exists) {
        quizData.assignAll(document.data() as Map<String, dynamic>);
      } else {
        quizData.clear();
      }
    } catch (e) {
      Get.dialog(Text('Error fetching data: $e'));
    }

    isLoading(false);
  }

  void resetTimer() {
    timerController.reset();
    timerController.start();
  }

  void increaseQuizIndex() {
    quizIndex++;
  }

  void setQuizLength(int length) {
    quizLength(length);
  }

  void setUserAnswer({String answer = "", required String correctAnswer}) {
    try {
      userAnswer(answer);
      userAnswerList.add(answer);
      debugPrint(userAnswer.value);
      debugPrint(userAnswerList.toString());

      final String answerStatus;
      final Color bgColorToast;

      if (answer == correctAnswer) {
        answerStatus = 'benar';
        bgColorToast = const Color(0xFF4CAF50);
        correctedAnswer++;
        debugPrint('total correct answer: $correctedAnswer');
      } else {
        answerStatus = 'salah';
        bgColorToast = const Color(0xFFF44336);
      }

      Fluttertoast.showToast(
        msg: 'Jawaban $answerStatus!',
        backgroundColor: bgColorToast,
        textColor: const Color(0xFFFFFFFF),
        fontSize: 16,
      );
    } catch (e) {
      debugPrint("there is some error: $e");
    } finally {
      userAnswer("");
    }
  }
}
