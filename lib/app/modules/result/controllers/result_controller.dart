import 'package:get/get.dart';

class ResultController extends GetxController {
  final List<String> userAnswers;
  final Map<String, dynamic> quizData;
  final int totalCorrectedAnswer;

  ResultController(this.userAnswers, this.quizData, this.totalCorrectedAnswer);

  var userScore = 0.obs;
  var userScorePercent = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    calculateUserScore(totalCorrectedAnswer);
  }

  void calculateUserScore(int score) {
    userScore(score * 20);
    userScorePercent(userScore.value / 100);
  }
}
