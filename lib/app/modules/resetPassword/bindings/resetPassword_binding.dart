import 'package:get/get.dart';

import '../controllers/resetPassword_controller.dart';

class  ResetpasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put< ResetpasswordController>(
       ResetpasswordController(),
    );
  }
}
