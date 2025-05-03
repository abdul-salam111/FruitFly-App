import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitfly/app/data/getmodels/getFliesModel.dart';
import 'package:fruitfly/app/data/getmodels/signinResponseModel.dart';
import 'package:fruitfly/app/modules/home/views/test.dart';
import 'package:fruitfly/app/resources/colors.dart';
import 'package:fruitfly/app/resources/paddings.dart';
import 'package:fruitfly/app/routes/app_pages.dart';
import 'package:fruitfly/app/storage/keys.dart';
import 'package:fruitfly/app/storage/storage.dart';
import 'package:googleapis/servicemanagement/v1.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                          Get.toNamed(Routes.NOTIFICATIONS);
                          // Get.to(() => SalesChartScreen());
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
                                image: AssetImage("assets/images/tryprem.png"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            (signInResponseModelFromJson(StorageServices.to.getString(userInfo))
                    .payload!
                    .user!
                    .plans!
                    .isNotEmpty)
                ? const Text(
                    'Statistics',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: blackcolor),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 20),
            (signInResponseModelFromJson(StorageServices.to.getString(userInfo))
                    .payload!
                    .user!
                    .plans!
                    .isNotEmpty)
                ? SizedBox(
                    height: 320,
                    width: MediaQuery.of(context).size.width,
                    child: const SalesChartScreen())
                : const SizedBox.shrink(),
            (signInResponseModelFromJson(StorageServices.to.getString(userInfo))
                    .payload!
                    .user!
                    .plans!
                    .isNotEmpty)
                ? const SizedBox(
                    height: 20,
                  )
                : const SizedBox.shrink(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Uploaded Pics",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Container(
                  height: 10,
                  width: 40,
                  // height: 20,
                  // width: 40,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/see all.png"),
                          fit: BoxFit.fill)),
                ),
              ],
            ),
            FutureBuilder<GetFliesModel>(
                future: controller.getFlies(context),
                builder: (context, AsyncSnapshot<GetFliesModel> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (!snapshot.hasData) {
                    return const SizedBox.shrink();
                  } else if (snapshot.data!.payload!.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 200,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4),
                      itemCount: snapshot.data!.payload!.length,
                      itemBuilder: (context, index) {
                        // var timeagoss = DateTime.now().subtract(Duration(
                        //   days: snapshot.data!.payload![index].dateTime!.day,
                        //   hours: snapshot.data!.payload![index].dateTime!.hour,
                        //   minutes:
                        //       snapshot.data!.payload![index].dateTime!.minute,
                        // ));

                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.DETAILS,
                                arguments: snapshot.data!.payload![index]);
                          },
                          child: GridItem(
                            image:
                                "https://modelapi.cerapp.co${snapshot.data!.payload![index].description}",
                            title: snapshot.data!.payload![index].title!,
                            subtitle: timeago.format(
                                snapshot.data!.payload![index].createdAt!),
                            description:
                                snapshot.data!.payload![index].location!,
                            quantity: snapshot.data!.payload![index].quantity!,
                          ),
                        );
                      },
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final int quantity;
  final String image;

  const GridItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.quantity,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image.network(
              image, // Replace with your image asset
              fit: BoxFit.cover,
              width: double.infinity,
              height: 100,
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                color: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(
                  '$quantity Quantities',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(color: Color(0xFFD76A27)),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    )
        .box
        .color(greyColor.withOpacity(0.5))
        .clip(Clip.antiAlias)
        .padding(defaultpad)
        .roundedSM
        .make();
  }
}
