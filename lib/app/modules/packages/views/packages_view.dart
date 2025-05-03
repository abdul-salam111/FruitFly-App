import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:fruitfly/app/data/getmodels/packageModel.dart';
import 'package:fruitfly/app/data/getmodels/signinResponseModel.dart';
import 'package:fruitfly/app/modules/afterGallery/views/afterGallery_view.dart';
import 'package:fruitfly/app/resources/alignments.dart';
import 'package:fruitfly/app/resources/colors.dart';
import 'package:fruitfly/app/resources/paddings.dart';
import 'package:fruitfly/app/routes/app_pages.dart';
import 'package:fruitfly/app/storage/keys.dart';
import 'package:fruitfly/app/storage/storage.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/packages_controller.dart';

class PackagesView extends GetView<PackagesController> {
  const PackagesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: crosstart,
        children: [
          30.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 180.w,
                child: Text(
                  "Hello, ${signInResponseModelFromJson(StorageServices.to.getString(userInfo)).payload!.user!.name!}",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp),
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.to(() => const AfterGallery());
                      },
                      icon: const Icon(Icons.notifications)),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.PACKAGES);
                    },
                    child: Container(
                      height: 30,
                      width: 100,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/try.png"),
                              fit: BoxFit.fill)),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: packgesModelFromJson(
                        StorageServices.to.getString('packages'))
                    .payload!
                    .length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => Column(
                      crossAxisAlignment: crosstart,
                      children: [
                        Row(
                          mainAxisAlignment: mainbetween,
                          children: [
                            Column(
                              crossAxisAlignment: crosstart,
                              children: [
                                Text(
                                  packgesModelFromJson(StorageServices.to
                                          .getString('packages'))
                                      .payload![index]
                                      .title!,
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: blackcolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                    width: 70.w,
                                    child: const Divider(
                                      color: Color(0xFFD76A27),
                                      thickness: 3,
                                    ))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: crosstart,
                              children: [
                                Text(
                                  "\$${packgesModelFromJson(StorageServices.to.getString('packages')).payload![index].price!}",
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: const Color(0xFFD76A27),
                                      fontWeight: FontWeight.bold),
                                ),
                                5.heightBox,
                                Text(
                                  index == 0
                                      ? 'Very Basic'
                                      : index == 1
                                          ? "Very Popular"
                                          : "Most Popular",
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    color: Color(0xFFA5A5A5),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.51,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        30.heightBox,
                        Text(
                          "Plan Includes: ",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: blackcolor,
                              fontWeight: FontWeight.w500),
                        ),
                        10.heightBox,
                        HtmlWidget(
                          packgesModelFromJson(
                                  StorageServices.to.getString('packages'))
                              .payload![index]
                              .description!,
                          textStyle:
                              const TextStyle(color: textfieldgrey, height: 2),
                        ),
                        20.heightBox,
                        GestureDetector(
                            onTap: () {
                              controller.makePayment(
                                  amount: packgesModelFromJson(StorageServices
                                          .to
                                          .getString('packages'))
                                      .payload![index]
                                      .price!
                                      .toString(),
                                  packageId: packgesModelFromJson(
                                          StorageServices.to
                                              .getString('packages'))
                                      .payload![index]
                                      .id!
                                      .toString());
                            },
                            child: Image.asset("assets/images/purchase.png")),
                      ],
                    )
                        .box
                        .padding(pad12)
                        .color(const Color(0xffEA9A38).withOpacity(0.2))
                        .rounded
                        .border(
                            color: controller.selectedIndex.value == index
                                ? const Color(0xffD76A27)
                                : Colors.transparent,
                            width: 2)
                        .margin(const EdgeInsets.only(top: 15))
                        .make()
                        .onTap(() {
                      controller.selectedIndex.value = index;
                    }),
                  );
                }),
          ),
        ],
      ),
    ));
  }
}
