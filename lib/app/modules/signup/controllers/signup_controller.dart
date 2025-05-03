import 'package:flutter/material.dart';
import 'package:fruitfly/app/data/getmodels/registerUserModel.dart';
import 'package:fruitfly/app/repositories/authRepository.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var isObsecure=true.obs;
  final nameController=TextEditingController().obs;
  final emailController=TextEditingController().obs;
  final passwordController=TextEditingController().obs;

    AuthRepository authRepository = AuthRepository();
    Future registerUser()async{
      await authRepository.registerUser(RegisterUserModel(
        email: emailController.value.text.toString(),
        name: nameController.value.text.toString(),
        password: passwordController.value.text.toString(),
      ));
    }
}
