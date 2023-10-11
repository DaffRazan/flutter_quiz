import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/result_controller.dart';

class ResultView extends GetView<ResultController> {
  static const routeName = '/result';

  const ResultView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Score',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CircularPercentIndicator(
            radius: 70.0,
            animation: true,
            animationDuration: 1200,
            lineWidth: 15.0,
            percent: 0.4,
            center: Text(
              '4/5',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: Colors.green,
            progressColor: Colors.red,
          ),
          SizedBox(
            height: 20,
          ),
          ShareButton(),
          SizedBox(
            height: 10,
          ),
          Text(
            'Your Report',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ResultInfoWidget(
            question: 'Who is first president of Indonesia?',
            correctAnswer: 'Soekarno',
            userAnswer: 'Soekarno',
          ),
          ResultInfoWidget(
            question: 'Which is king of jungle?',
            correctAnswer: 'Lion',
            userAnswer: 'Elephant',
          ),
        ],
      ),
    );
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton({
    super.key,
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
        Share.share('Check out my flutter quiz score: 90!');
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

class ResultInfoWidget extends StatelessWidget {
  final String question;
  final String correctAnswer;
  final String userAnswer;

  const ResultInfoWidget({
    super.key,
    required this.question,
    required this.correctAnswer,
    required this.userAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
        right: 30,
        left: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              if (correctAnswer != userAnswer) ...[
                const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
                Text(
                  userAnswer,
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
              const Icon(
                Icons.check,
                color: Colors.green,
              ),
              Text(
                correctAnswer,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
