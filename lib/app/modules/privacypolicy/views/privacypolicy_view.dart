import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitfly/app/resources/alignments.dart';
import 'package:fruitfly/app/resources/colors.dart';
import 'package:fruitfly/app/resources/paddings.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/privacypolicy_controller.dart';

class PrivacypolicyView extends GetView<PrivacypolicyController> {
  const PrivacypolicyView({Key? key}) : super(key: key);
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
          'Privacy Policy',
          style: TextStyle(color: whitecolor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Text(
                style: TextStyle(
                    color: blackcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
                "Privacy Policy"),
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
            5.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Welcome to Cerapp ('we', 'our', 'us'). We are committed to protecting your privacy and ensuring you have a positive experience on our app. This Privacy Policy outlines our practices regarding the collection, use, and disclosure of your information when you use our service to analyze and quantify the population of Medfly through photos you upload or take live within the app.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: textfieldgrey,
                  fontSize: 14.sp,
                ),
              ),
            ),
            10.heightBox,
            Text(
              "2. Information We Collect",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: blackcolor,
                  letterSpacing: 0.5,
                  fontSize: 18.sp),
            ),
            5.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: crosstart,
                children: [
                  Text(
                    "✦ Personal Information",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: blackcolor,
                        fontSize: 14.sp,
                        wordSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "We may collect personal information that can identify you, such as your name, email address, and payment information, when you:",
                          style: TextStyle(
                            color: textfieldgrey,
                            fontSize: 14.sp,
                            wordSpacing: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: crosstart,
                            children: [
                              Text(
                                '◉	Register or create an account on Cerapp',
                                style: TextStyle(
                                  color: textfieldgrey,
                                  fontSize: 14.sp,
                                  wordSpacing: 1,
                                ),
                              ),
                              5.heightBox,
                              Text(
                                '◉	Subscribe to our packages',
                                style: TextStyle(
                                  color: textfieldgrey,
                                  fontSize: 14.sp,
                                  wordSpacing: 1,
                                ),
                              ),
                              5.heightBox,
                              Text(
                                '◉	Contact us for support or inquiries',
                                style: TextStyle(
                                  color: textfieldgrey,
                                  fontSize: 14.sp,
                                  wordSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "✦ Non-Personal Information",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: blackcolor,
                        fontSize: 14.sp,
                        wordSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "We may collect non-personal information about your usage of our app, such as:",
                          style: TextStyle(
                            color: textfieldgrey,
                            fontSize: 14.sp,
                            wordSpacing: 1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: crosstart,
                            children: [
                              Text(
                                '◉	Device information (e.g., device type, operating system)',
                                style: TextStyle(
                                  color: textfieldgrey,
                                  fontSize: 14.sp,
                                  wordSpacing: 1,
                                ),
                              ),
                              5.heightBox,
                              Text(
                                '◉	Usage data (e.g., pages visited, time spent on the app)',
                                style: TextStyle(
                                  color: textfieldgrey,
                                  fontSize: 14.sp,
                                  wordSpacing: 1,
                                ),
                              ),
                              5.heightBox,
                              Text(
                                '◉	Location data (if location services are enabled)',
                                style: TextStyle(
                                  color: textfieldgrey,
                                  fontSize: 14.sp,
                                  wordSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: crosstart,
                children: [
                  Text(
                    "✦ Photo Information",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        color: blackcolor,
                        fontSize: 14.sp,
                        wordSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: crosstart,
                      children: [
                        Text(
                          "We collect and process photos you upload or take live within the app to analyze and quantify the population of Medfly. These photos are used solely for the purpose of providing you with the analysis results.",
                          style: TextStyle(
                            color: textfieldgrey,
                            fontSize: 14.sp,
                            wordSpacing: 1,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "3. How We Use Your Information",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: blackcolor,
                  letterSpacing: 0.5,
                  fontSize: 18.sp),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: crosstart,
                children: [
                  Text(
                    "We use the collected information to:",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: textfieldgrey,
                      fontSize: 14.sp,
                      wordSpacing: 1,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: textfieldgrey),
                        "★	Provide and maintain our service\n★	Improve, personalize, and expand our service \n★	Understand and analyze how you use our app \n★	Develop new products, services, features, and functionality \n★	Communicate with you, either directly or through one of our partners, for customer service, to provide updates, and for marketing and promotional purposes"),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: crosstart,
              children: [
                Text(
                  "4. How We Share Your Information",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: blackcolor,
                      letterSpacing: 0.5,
                      fontSize: 18.sp),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        "We do not sell, trade, or otherwise transfer your personal information to outside parties except as described in this Privacy Policy. We may share your information with:",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: textfieldgrey,
                          fontSize: 14.sp,
                          wordSpacing: 1,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: crosstart,
                          children: [
                            Text(
                              "◉	Service providers who perform services on our behalf",
                              style: TextStyle(color: textfieldgrey),
                            ),
                            Text(
                              "◉	Legal authorities if required by law",
                              style: TextStyle(color: textfieldgrey),
                            ),
                            Text(
                              "◉	Business partners and affiliates in accordance with this Privacy Policy",
                              style: TextStyle(color: textfieldgrey),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: crosstart,
                  children: [
                    Text(
                      "5. Data Security",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: blackcolor,
                          letterSpacing: 0.5,
                          fontSize: 18.sp),
                    ),
                    Padding(
                      padding: pad16,
                      child: Text(
                        "We implement a variety of security measures to maintain the safety of your personal information. However, please be aware that no method of internet transmission or electronic storage is 100% secure, and we cannot guarantee absolute security.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: textfieldgrey,
                          fontSize: 14.sp,
                          wordSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: crosstart,
                  children: [
                    Text(
                      "6. Your Privacy Rights",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: blackcolor,
                          letterSpacing: 0.5,
                          fontSize: 18.sp),
                    ),
                    Padding(
                      padding: pad16,
                      child: Column(
                        children: [
                          Text(
                            "Under the General Data Protection Regulation (GDPR), you have the following rights regarding your personal information:",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: textfieldgrey,
                              fontSize: 14.sp,
                              wordSpacing: 1,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: crosstart,
                              children: [
                                Text(
                                  "◉	The right to access and receive a copy of your personal data.",
                                  style: TextStyle(color: textfieldgrey),
                                ),
                                Text(
                                  "◉	The right to rectify any inaccurate or incomplete personal data.",
                                  style: TextStyle(color: textfieldgrey),
                                ),
                                Text(
                                  "◉	The right to request the deletion of your personal data.",
                                  style: TextStyle(color: textfieldgrey),
                                ),
                                Text(
                                  "◉	The right to restrict or object to the processing of your personal data.",
                                  style: TextStyle(color: textfieldgrey),
                                ),
                                Text(
                                  "◉	The right to data portability.",
                                  style: TextStyle(color: textfieldgrey),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "To exercise these rights, please contact us at info@cerapp.com.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: textfieldgrey,
                              fontSize: 14.sp,
                              wordSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: crosstart,
                  children: [
                    Text(
                      "7. Changes to This Privacy Policy",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: blackcolor,
                          letterSpacing: 0.5,
                          fontSize: 18.sp),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "Under the General Data Protection Regulation (GDPR), you have the following rights regarding your personal information:",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: textfieldgrey,
                          fontSize: 14.sp,
                          wordSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                  Column(
                  crossAxisAlignment: crosstart,
                  children: [
                    Text(
                      "8. Contact Us",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: blackcolor,
                          letterSpacing: 0.5,
                          fontSize: 18.sp),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "If you have any questions about this Privacy Policy, please contact us at info@cerapp.com.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: textfieldgrey,
                          fontSize: 14.sp,
                          wordSpacing: 1,
                        ),
                      ),
                    ),
                  ],
                ),  
              ],
            ),
          ],
        ),
      ),
    );
  }
}
