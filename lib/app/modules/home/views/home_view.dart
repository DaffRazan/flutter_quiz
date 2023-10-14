import 'package:flutter/material.dart';
import 'package:flutter_quiz/app/modules/quiz/views/quiz_view.dart';
import 'package:flutter_quiz/app/modules/topic/views/topic_view.dart';
import 'package:flutter_quiz/app/shared/const.dart';
import 'package:flutter_quiz/app/shared/widgets/global_functions.dart';
import 'package:flutter_quiz/app/shared/widgets/rounded_button.dart';

import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  static const routeName = '/home';

  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  'assets/lamp.jpg',
                  height: 50,
                  width: 50,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Flutter Quiz App',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Learn • Take Quiz • Repeat',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const SizedBox(
                height: 50,
              ),
              Obx(
                () => (controller.documentIds.isEmpty)
                    ? const SizedBox()
                    : RoundedButton(
                        title: 'PLAY',
                        onPressed: () {
                          // get a random doc id from idDocs list
                          controller.randomizeDocId();

                          Get.to(() => QuizView(controller.randomDocId.value));
                        },
                      ),
              ),
              RoundedButton(
                title: 'TOPICS',
                onPressed: () {
                  Get.toNamed(TopicView.routeName);
                },
                isOutlinedColor: true,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Share.share('Let\'s Play this flutter quiz game!');
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.share),
                          SizedBox(width: 2),
                          Text(
                            'Share',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        launch(dummyPlaystoreLink);
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(width: 2),
                          Text(
                            'Rate Us',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
