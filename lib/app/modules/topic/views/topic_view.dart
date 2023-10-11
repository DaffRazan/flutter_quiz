import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/topic_controller.dart';

class TopicView extends GetView<TopicController> {
  static const routeName = '/topic';

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
        () => (controller.topicData.isEmpty)
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.topicData.length,
                itemBuilder: (context, index) {
                  final key = controller.topicData.keys.elementAt(index);
                  final value = controller.topicData[key]['topic'];

                  return TopicItem(
                    title: value.toString(),
                    onPressed: () {},
                  );
                },
              ),
      ),
    );
  }
}

class TopicItem extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const TopicItem({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xff193267),
          ),
          child: ListTile(
            leading: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_right,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
