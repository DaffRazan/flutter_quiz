import 'package:flutter/material.dart';
import 'package:flutter_quiz/app/modules/result/views/result_view.dart';
import 'package:flutter_quiz/app/shared/const.dart';
import 'package:flutter_quiz/app/shared/widgets/choice_widget.dart';
import 'package:flutter_quiz/app/shared/widgets/custom_dialog.dart';
import 'package:get/get.dart';
import 'package:linear_timer/linear_timer.dart';
import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  final String docId;

  static const routeName = '/quiz';

  const QuizView(this.docId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuizController(docId));

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
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            LinearTimer(
              duration: const Duration(seconds: quizTimer),
              controller: controller.timerController,
              color: Colors.orange[400],
              forward: false,
              onTimerEnd: () {
                // set user answer for each quiz
                controller.setUserAnswer(
                  answer: "No answer",
                  correctAnswer: controller.quizData['data']
                      [controller.quizIndex.value.toString()]['answer'],
                );

                // quiz not yet showed all
                if (controller.quizIndex.value != controller.quizLength.value) {
                  controller.increaseQuizIndex();

                  controller.resetTimer();
                } else {
                  // quiz already showed all
                  Get.dialog(
                    customDialog(
                      message: 'All quiz done. Getting your score...',
                      onPressed: () => Get.offAll(ResultView(
                        controller.userAnswerList,
                        controller.quizData,
                        controller.correctedAnswer.value,
                      )),
                    ),
                  );
                }
              },
            ),
            (controller.quizData.isEmpty)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildQuestionWidget(controller),
                        const SizedBox(
                          height: 30,
                        ),
                        _buildChoicesWidget(controller)
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionWidget(QuizController controller) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        controller.quizData['data'][controller.quizIndex.value.toString()]
                ['question'] ??
            '',
        style: const TextStyle(
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildChoicesWidget(QuizController controller) {
    return SizedBox(
      height: Get.height * 0.3,
      child: ListView.builder(
        itemBuilder: (c, i) {
          // set quiz length to keep track
          controller.setQuizLength(controller
              .quizData['data'][controller.quizIndex.value.toString()]
                  ['choices']
              .length);

          return ChoiceWidget(
            title: controller.quizData['data']
                    [controller.quizIndex.value.toString()]['choices'][i] ??
                '',
            onPressed: () {
              // set user answer for each quiz
              controller.setUserAnswer(
                answer: controller.quizData['data']
                    [controller.quizIndex.value.toString()]['choices'][i],
                correctAnswer: controller.quizData['data']
                    [controller.quizIndex.value.toString()]['answer'],
              );

              if (controller.quizIndex.value != controller.quizLength.value) {
                controller.increaseQuizIndex();

                controller.resetTimer();
              } else {
                // quiz already showed all
                Get.dialog(
                  customDialog(
                    message: 'All quiz done. Getting your score...',
                    onPressed: () => Get.offAll(
                      () => ResultView(
                        controller.userAnswerList,
                        controller.quizData,
                        controller.correctedAnswer.value,
                      ),
                    ),
                  ),
                );
              }
            },
          );
        },
        itemCount: controller
            .quizData['data'][controller.quizIndex.value.toString()]['choices']
            .length,
      ),
    );
  }
}
