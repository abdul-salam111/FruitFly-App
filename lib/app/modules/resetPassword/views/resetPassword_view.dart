import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitfly/app/resources/colors.dart';
import 'package:fruitfly/app/resources/paddings.dart';
import 'package:fruitfly/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../resources/alignments.dart';
import '../controllers/resetPassword_controller.dart';

class ResetpasswordView extends GetView<ResetpasswordController> {
  const ResetpasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
        body: Padding(
            padding: pad14,
            child: ListView(children: [
              SizedBox(
                height: 30.h,
              ),
              const Center(
                child: Text(
                  'Password',
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
                  'Please set your password',
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
                child: Column(
                  crossAxisAlignment: crosstart,
                  children: [
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
                        controller: controller.confirmpasswordController.value,
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
                    20.verticalSpace,
                    Column(
                      crossAxisAlignment: crosstart,
                      children: [
                        const Text(
                          "Confirm Password",
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
                                return 'Please enter confirm password';
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
                                  borderSide:
                                      const BorderSide(color: greyColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: greyColor),
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
                                  borderSide: const BorderSide(
                                      color: greyColor, width: 2),
                                ),
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      controller.isObsecure.value =
                                          !controller.isObsecure.value;
                                    },
                                    child: Icon(controller.isObsecure.value
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                contentPadding:
                                    const EdgeInsets.only(left: 10)),
                          ),
                        ),
                        10.verticalSpace,
                      ],
                    ),
                    40.verticalSpace,
                    GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            controller.resetPassword();
                          }
                        },
                        child: Image.asset("assets/icons/continuebutton.png")),
                  ],
                ),
              ),
              (MediaQuery.sizeOf(context).height / 4).verticalSpace,
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
            ])));
  }
}
