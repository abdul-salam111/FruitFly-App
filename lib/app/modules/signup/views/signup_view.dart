import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitfly/app/customWidgets/customTextField.dart';
import 'package:fruitfly/app/resources/alignments.dart';
import 'package:fruitfly/app/resources/colors.dart';
import 'package:fruitfly/app/resources/paddings.dart';
import 'package:fruitfly/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
        body: Padding(
      padding: pad14,
      child: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 15.sp,
                ),
                const Text(
                  'Back',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          const Center(
            child: Text(
              'Register',
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
              'Create your new account',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          30.verticalSpace,
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: crosstart,
              children: [
                customTextField(
                    formFieldValidator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }

                      return null;
                    },
                    textEditingController: controller.nameController.value,
                    hintText: "Abcxyz",
                    label: "Full Name",
                    icon: Icons.person_outline),
                20.verticalSpace,
                customTextField(
                    textEditingController: controller.emailController.value,
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
                    hintText: "example@gmail.com",
                    label: "Enter Email",
                    icon: Icons.email_outlined),
                20.verticalSpace,
                const Text(
                  "Enter Password",
                  style: TextStyle(
                    color: Color(0xFF8B8B8B),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                5.verticalSpace,
                Obx(
                  () => TextFormField(
                    controller: controller.passwordController.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null;
                    },
                    style: const TextStyle(
                      color: Color(0xFF8B8B8B),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    obscureText: controller.isObsecure.value,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: greyColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: greyColor),
                        ),
                        hintText: "**************",
                        hintStyle: const TextStyle(
                          color: Color(0xFF8B8B8B),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: greyColor, width: 2),
                        ),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              controller.isObsecure.value =
                                  !controller.isObsecure.value;
                            },
                            child: Icon(controller.isObsecure.value
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        contentPadding: const EdgeInsets.only(left: 10)),
                  ),
                ),
              ],
            ),
          ),
          20.verticalSpace,
          SizedBox(width: 342, child: Image.asset("assets/icons/terms.png")),
          40.verticalSpace,
          GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  controller.registerUser();
                } else {}
              },
              child: Image.asset("assets/icons/registerbutton.png")),
          (MediaQuery.sizeOf(context).height / 12).verticalSpace,
          40.verticalSpace,
          GestureDetector(
              onTap: () {
                Get.toNamed(Routes.SIGNIN);
              },
              child: Center(
                  child: Image.asset(
                "assets/icons/signinnow.png",
                width: 150.w,
              )))
        ],
      ),
    ));
  }
}
