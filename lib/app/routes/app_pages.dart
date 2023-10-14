import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/quiz/bindings/quiz_binding.dart';
import '../modules/quiz/views/quiz_view.dart';
import '../modules/result/bindings/result_binding.dart';
import '../modules/result/views/result_view.dart';
import '../modules/topic/bindings/topic_binding.dart';
import '../modules/topic/views/topic_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.RESULT,
      page: () => const ResultView([], {}, 0),
      binding: ResultBinding(),
    ),
    GetPage(
      name: _Paths.QUIZ,
      page: () => const QuizView(""),
      binding: QuizBinding(),
    ),
    GetPage(
      name: _Paths.TOPIC,
      page: () => TopicView(),
      binding: TopicBinding(),
    ),
  ];
}
