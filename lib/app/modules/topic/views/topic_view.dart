import 'package:flutter/material.dart';
import 'package:flutter_quiz/app/modules/quiz/views/quiz_view.dart';
import 'package:flutter_quiz/app/shared/widgets/topic_item.dart';

import 'package:get/get.dart';

import '../controllers/topic_controller.dart';

class TopicView extends GetView<TopicController> {
  static const routeName = '/topic';

  @override
  final TopicController controller = Get.put(TopicController());

  TopicView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topics'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Obx(
        () =>
            ((controller.topicData.isEmpty && controller.documentIds.isEmpty) ||
                    controller.isLoading.value)
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: controller.topicData.length,
                    itemBuilder: (context, index) {
                      final key = controller.topicData.keys.elementAt(index);
                      final value = controller.topicData[key]['topic'];

                      final docID = controller.documentIds[index];

                      return TopicItem(
                        title: value.toString(),
                        onPressed: () {
                          Get.off(() => QuizView(docID));
                        },
                      );
                    },
                  ),
      ),
    );
  }
}
