import 'package:get/get.dart';

import '../controllers/onboardig_controller.dart';

class OnboardigBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardigController>(
      () => OnboardigController(),
    );
  }
}
