import 'package:flutter/material.dart';
import 'package:fruitfly/app/repositories/authRepository.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  var isObsecure = true.obs;
  var isRemembered = false.obs;

  void toggleRememberMe() {
    isRemembered.value = !isRemembered.value;
  }

  final emailController = TextEditingController().obs;

  AuthRepository authRepository = AuthRepository();
  Future sendOtp() async {
    await authRepository.forgotPassword(emailController.value.text);
  }
}
