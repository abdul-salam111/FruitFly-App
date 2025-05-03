import 'package:flutter/material.dart';
import 'package:fruitfly/app/data/postmodel/siginPostModel.dart';
import 'package:fruitfly/app/repositories/authRepository.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  var isObsecure = true.obs;
  var isRemembered = false.obs;

  void toggleRememberMe() {
    isRemembered.value = !isRemembered.value;
  }

  AuthRepository authRepository = AuthRepository();

  Future<void> signInUser() async {
    await authRepository.signInUser(SignInModel(
      email: emailController.value.text.toString(),
      password: passwordController.value.text.toString(),
    ));
  }

   
}
