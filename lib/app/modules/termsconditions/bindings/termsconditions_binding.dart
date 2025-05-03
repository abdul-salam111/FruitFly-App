import 'package:get/get.dart';

import '../controllers/termsconditions_controller.dart';

class TermsconditionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermsconditionsController>(
      () => TermsconditionsController(),
    );
  }
}
