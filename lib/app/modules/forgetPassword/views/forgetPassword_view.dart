import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitfly/app/customWidgets/customTextField.dart';
import 'package:fruitfly/app/resources/paddings.dart';
import 'package:fruitfly/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/forgetPassword_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
        body: Padding(
      padding: pad14,
      child: ListView(
        children: [
          SizedBox(
            height: 30.h,
          ),
          const Center(
            child: Text(
              'Recover account',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          const Center(
            child: Text(
              'Enter your email for recovering\nthe account',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          50.verticalSpace,
          Form(
            key: formKey,
            child: customTextField(
                textEditingController: controller.emailController.value,
                hintText: "example@gmail.com",
                formFieldValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  // Regex for validating email
                  final RegExp emailRegex = RegExp(
                    r'^[^@]+@[^@]+\.[^@]+',
                  );
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                label: "Enter Email",
                icon: Icons.email_outlined),
          ),
          40.verticalSpace,
          GestureDetector(
              onTap: () {
               if(formKey.currentState!.validate()){
                controller.sendOtp();
               }
              },
              child: Image.asset("assets/icons/continuebutton.png")),
          (MediaQuery.sizeOf(context).height / 3).verticalSpace,
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.SIGNUP);
            },
            child: Center(
                child: Image.asset(
              "assets/icons/createaccount.png",
              width: 200.w,
            )),
          ),
          40.verticalSpace,
        ],
      ),
    ));
  }
}
