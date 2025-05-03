import 'package:flutter/material.dart';
import 'package:fruitfly/app/resources/alignments.dart';
import 'package:fruitfly/app/resources/colors.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/help_controller.dart';

class HelpView extends GetView<HelpController> {
  const HelpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back,
            color: whitecolor,
          ),
          backgroundColor: const Color(0xFFFFA726),
          title: const Text(
            'Help',
            style: TextStyle(color: whitecolor),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: maincenter,
              children: [
                const Spacer(),
                Image.asset(
                  "assets/images/help.png",
                  height: 200,
                  width: 200,
                ),
                60.heightBox,
                Image.asset(
                  "assets/images/1.png",
                ),
                10.heightBox,
                const Divider(),
                20.heightBox,
                Image.asset(
                  "assets/images/2.png",
                ),
                10.heightBox,
                const Divider(),
                20.heightBox,
                Image.asset(
                  "assets/images/3.png",
                ),
                90.heightBox,
                const Spacer(),
              ],
            ),
          ),
        ));
  }
}
