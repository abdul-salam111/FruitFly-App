import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitfly/app/customWidgets/customTextField.dart';
import 'package:fruitfly/app/resources/alignments.dart';
import 'package:fruitfly/app/resources/colors.dart';
import 'package:fruitfly/app/resources/paddings.dart';
import 'package:fruitfly/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({Key? key}) : super(key: key);

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
              'Welcome back',
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
              'Login to your account',
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
          Column(
            crossAxisAlignment: crosstart,
            children: [
              10.verticalSpace,
              Row(
                children: [
                  Obx(() {
                    return Checkbox(
                      activeColor: const Color(0xFFF11E68),
                      value: controller.isRemembered.value,
                      onChanged: (value) {
                        controller.toggleRememberMe();
                      },
                    );
                  }),
                  const Text(
                    'Remember me',
                    style: TextStyle(
                      color: Color(0xFF949090),
                      fontSize: 11,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.FORGOT_PASSWORD);
                      },
                      child: Image.asset(
                        "assets/icons/forgetpassword.png",
                        width: 100,
                      )),
                ],
              ),
            ],
          ),
          40.verticalSpace,
          GestureDetector(
              onTap: () {
                // Get.to(() => const NavbarView());
                if (formKey.currentState!.validate()) {
                  controller.signInUser();
                } else {}
              },
              child: Image.asset("assets/icons/signin.png")),
          (MediaQuery.sizeOf(context).height / 4.5).verticalSpace,
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.SIGNUP);
            },
            child: Center(
                child: Image.asset(
              "assets/icons/createaccount.png",
              width: 220.w,
            )),
          ),
          40.verticalSpace,
        ],
      ),
    ));
  }
}
