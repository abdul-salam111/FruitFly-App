import 'package:get/get.dart';

import '../controllers/otpVerification_controller.dart';

class OtpverificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OtpVerificationController>(
      OtpVerificationController(),
    );
  }
}
