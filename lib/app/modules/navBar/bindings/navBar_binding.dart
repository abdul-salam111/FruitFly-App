import 'package:get/get.dart';

import '../controllers/navBar_controller.dart';

class 
NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(
      () => NavBarController(),
    );
  }
}
