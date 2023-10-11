import 'package:flutter/material.dart';
import 'package:flutter_quiz/app/modules/result/views/result_view.dart';
import 'package:flutter_quiz/app/shared/widgets/choice_widget.dart';

import 'package:get/get.dart';

import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  static const routeName = '/quiz';

  @override
  final controller = Get.put(QuizController());

  QuizView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Page'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Exit',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // LinearTimer(
          //   forward: false,
          //   duration: const Duration(seconds: 5),
          //   onTimerEnd: () {
          //     Get.dialog(const Text('Timer habis!'));
          //     widget.controller.timerRunning.value = false;
          //   },
          //   controller: timerController,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Which month of the year has the least number of the day?',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ChoiceWidget(
                  title: 'January',
                  onPressed: () {
                    Get.offNamed(ResultView.routeName);
                  },
                ),
                ChoiceWidget(
                  title: 'February',
                  onPressed: () {},
                ),
                ChoiceWidget(
                  title: 'March',
                  onPressed: () {},
                ),
                ChoiceWidget(
                  title: 'June',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
