import 'package:flutter/material.dart';
import 'package:flutter_quiz/app/modules/home/views/home_view.dart';
import 'package:flutter_quiz/app/shared/widgets/result_info_widget.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/result_controller.dart';

class ResultView extends GetView<ResultController> {
  final List<String> userAnswer;
  final int correctedAnswer;
  final Map<String, dynamic> quizData;

  static const routeName = '/result';

  const ResultView(this.userAnswer, this.quizData, this.correctedAnswer,
      {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ResultController(userAnswer, quizData, correctedAnswer));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Score',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.off(() => const HomeView());
          },
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CircularPercentIndicator(
            radius: 70.0,
            animation: true,
            animationDuration: 1200,
            lineWidth: 15.0,
            percent: controller.userScorePercent.value,
            center: Text(
              '${correctedAnswer.toString()}/${controller.quizData['data'].length.toString()}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: const Color(0xFFF44336),
            progressColor: const Color(0xFF4CAF50),
          ),
          const SizedBox(
            height: 20,
          ),
          ShareButton(controller: controller),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Your Report',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildResultInfoWidget(controller, userAnswer),
        ],
      ),
    );
  }
}

Widget _buildResultInfoWidget(
    ResultController controller, List<String> userAnswer) {
  return SizedBox(
    height: Get.height * 0.5,
    child: ListView.builder(
      itemBuilder: (c, i) {
        return ResultInfoWidget(
          question: controller.quizData['data'][i.toString()]['question'],
          correctAnswer: controller.quizData['data'][i.toString()]['answer'],
          userAnswer: userAnswer[i],
        );
      },
      itemCount: controller.quizData['data'].length,
    ),
  );
}

class ShareButton extends StatelessWidget {
  final ResultController controller;

  const ShareButton({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color(
            0xff23A8CB,
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            color: Color(0xff23A8CB),
            width: 2,
          ),
        ),
      ),
      onPressed: () {
        Share.share(
            'Check out my flutter quiz score: ${controller.userScore}!');
      },
      child: const Text(
        'Share your score',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
