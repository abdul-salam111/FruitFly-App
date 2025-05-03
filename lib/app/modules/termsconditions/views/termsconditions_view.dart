import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitfly/app/resources/colors.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/termsconditions_controller.dart';

class TermsconditionsView extends GetView<TermsconditionsController> {
  const TermsconditionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: whitecolor,
          ),
        ),
        leadingWidth: 70.w,
        backgroundColor: const Color(0xFFFFA726),
        title: const Text(
          'Terms and Conditions',
          style: TextStyle(color: whitecolor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Text(
              "Terms and Conditions",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: blackcolor,
                  letterSpacing: 0.5,
                  fontSize: 18.sp),
            ),
            10.heightBox,
            Text(
              "Effective Date: 20 June 2024",
              style: TextStyle(
                  color: textfieldgrey, letterSpacing: 0.5, fontSize: 14.sp),
            ),
            10.heightBox,
            Text(
              "1. Introduction",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: blackcolor,
                  letterSpacing: 0.5,
                  fontSize: 18.sp),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "These Terms and Conditions ('Terms', 'Terms and Conditions') govern your relationship with Cerapp ('us', 'we', or 'our') and your use of our mobile application (the 'Service') to analyze and quantify the population of Medfly through photos.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: textfieldgrey,
                  fontSize: 14.sp,
                ),
              ),
            ),
            10.heightBox,
            Text(
              "2. Acceptance of Terms",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: blackcolor,
                  letterSpacing: 0.5,
                  fontSize: 18.sp),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "By downloading, accessing, or using Cerapp, you agree to be bound by these Terms. If you do not agree with any part of these Terms, you must not use our app.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: textfieldgrey,
                  fontSize: 14.sp,
                ),
              ),
            ),
            10.heightBox,
            Text(
              "3. Eligibility",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: blackcolor,
                  letterSpacing: 0.5,
                  fontSize: 18.sp),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "The proposed application aims to offer a highly functional and user-friendly platform for the quantification and identification of Ceratitis fruit flies using advanced image analysis technologies. Designed primarily for agriculturalists, researchers, and pest control professionals, the app will facilitate the upload and analysis of images to accurately identify various fruit fly species, with a particular focus on the Ceratitis genus. This tool will not only aid in pest identification but also provide valuable data visualizations that compare and contrast different species based on the analysis, thereby contributing to more effective pest management strategies.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: textfieldgrey,
                  fontSize: 14.sp,
                ),
              ),
            ),
            10.heightBox,
            Text(
              "2)Header Section",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: blackcolor,
                  letterSpacing: 0.5,
                  fontSize: 18.sp),
            ),
            5.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "✦ Display the distinctive logo of the app.\n\n✦ Prominently feature the name of the app.\n\n✦ Easy navigation links for home, about, settings, and help.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: textfieldgrey,
                  fontSize: 14.sp,
                  wordSpacing: 1,
                ),
              ),
            ),
            10.heightBox,
            Text(
              "3)Banner Section",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: blackcolor,
                  letterSpacing: 0.5,
                  fontSize: 18.sp),
            ),
            5.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "✦ Use a dynamic image, such as a target over a fruit fly, to grab attention.\n\n✦ A brief statement describing the app’s core functionality.\n\n✦ Easy navigation links for home, about, settings, and help.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: textfieldgrey,
                  fontSize: 14.sp,
                  wordSpacing: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
