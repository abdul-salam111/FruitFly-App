import 'package:flutter/widgets.dart';
import 'package:fruitfly/app/repositories/authRepository.dart';
import 'package:get/get.dart';

class ResetpasswordController extends GetxController {
  var isObsecure = true.obs;
  var isRemembered = false.obs;

  void toggleRememberMe() {
    isRemembered.value = !isRemembered.value;
  }

  final passwordController = TextEditingController().obs;
  final confirmpasswordController = TextEditingController().obs;

  AuthRepository authRepository = AuthRepository();

  Future resetPassword() async {
    await authRepository.resetPassword(passwordController.value.text.toString(),
        confirmpasswordController.value.text.toString());
  }
}
