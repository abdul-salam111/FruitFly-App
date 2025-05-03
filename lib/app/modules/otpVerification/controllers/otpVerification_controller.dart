import 'package:flutter/material.dart';
import 'package:fruitfly/app/repositories/authRepository.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  var isObsecure = true.obs;
  var isRemembered = false.obs;
  final List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());

  void toggleRememberMe() {
    isRemembered.value = !isRemembered.value;
  }

  final otpController = TextEditingController().obs;

  AuthRepository authRepository = AuthRepository();

  Future matchOtp() async {
    var otp = "";
    for (int i = 0; i < controllers.length; i++) {
      otp = otp + controllers[i].text;
    }

    await authRepository.verifyOtp(otp);
  }
}
