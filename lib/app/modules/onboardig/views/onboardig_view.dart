import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitfly/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/onboardig_controller.dart';

class OnboardigView extends GetView<OnboardigController> {
  const OnboardigView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      // decoration: const BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage("assets/icons/onboarding.png"))),
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/careapp.png"))),
                ),
              ),
              // SizedBox(
              //   height: 40.h,
              // ),
              // Center(
              //     child: Image.asset(
              //   "assets/icons/white.png",
              //   height: 50.h,
              //   width: 200.w,
              // )),
              // const Spacer(),
              const SizedBox(
                width: 390,
                child: Text(
                  'Welcome to Cerapp!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const SizedBox(
                width: 390,
                child: Text(
                  'Easily monitor Mediterranean fruit fly populations by creating an account and uploading or taking live photos of your crops. Our advanced tech analyzes the images, giving you accurate, actionable insights. Protect your crops with ease!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width - 80,
                child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.SIGNIN);
                    },
                    child: Image.asset("assets/icons/registerbutton.png")),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
