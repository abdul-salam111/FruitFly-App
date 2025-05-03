import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitfly/app/data/getmodels/signinResponseModel.dart';
import 'package:fruitfly/app/modules/settings/controllers/settings_controller.dart';
import 'package:fruitfly/app/resources/colors.dart';
import 'package:fruitfly/app/routes/app_pages.dart';
import 'package:fruitfly/app/storage/keys.dart';
import 'package:fruitfly/app/storage/storage.dart';
import 'package:fruitfly/app/utils/utils.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: whitecolor,
        ),
        leadingWidth: 70.w,
        backgroundColor: const Color(0xFFFFA726),
        title: const Text(
          'Settings',
          style: TextStyle(color: whitecolor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFFFA726), // Start color
                  Color(0xFFFFCC80), // End color
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg"),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        signInResponseModelFromJson(
                                StorageServices.to.getString(userInfo))
                            .payload!
                            .user!
                            .name!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        signInResponseModelFromJson(
                                StorageServices.to.getString(userInfo))
                            .payload!
                            .user!
                            .email!,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "03115308116",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ).box.bottomRounded(value: 20).clip(Clip.antiAlias).make(),
          20.heightBox,
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(children: [
                  Image.asset(
                    "assets/images/editprofile.png",
                    height: 30,
                  ),
                  10.heightBox,
                  const Divider(
                    height: 5,
                  ),
                  20.heightBox,
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.PRIVACYPOLICY);
                    },
                    child: Image.asset(
                      "assets/images/privacy.png",
                      height: 30,
                    ),
                  ),
                  10.heightBox,
                  const Divider(
                    height: 5,
                  ),
                  20.heightBox,
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.TERMSCONDITIONS);
                    },
                    child: Image.asset(
                      "assets/images/terms.png",
                      height: 30,
                    ),
                  ),
                  10.heightBox,
                  const Divider(
                    height: 5,
                  ),
                  20.heightBox,
                  GestureDetector(
                    onTap: () {
                      controller.showRatingDialog(context);
                    },
                    child: Image.asset(
                      "assets/images/feedback.png",
                      height: 30,
                    ),
                  ),
                  10.heightBox,
                  const Divider(
                    height: 5,
                  ),
                  20.heightBox,
                  Image.asset(
                    "assets/images/contactinfo.png",
                    height: 30,
                  ),
                  20.heightBox,
                  const Divider(
                    height: 5,
                  ),
                  20.heightBox,
                  Image.asset(
                    "assets/images/subs.png",
                    height: 30,
                  ),
                  10.heightBox,
                  const Divider(
                    height: 5,
                  ),
                  20.heightBox,
                  GestureDetector(
                      onTap: () {
                        StorageServices.to.remove(usertoken);
                        Utils.snakbar(
                            title: "Loggedout!",
                            body: "You have been loggedout.");
                        Get.offAllNamed(Routes.SIGNIN);
                      },
                      child: Image.asset("assets/images/logoutbutton.png")),
                ])),
          ),
        ],
      ),
    );
  }
}
