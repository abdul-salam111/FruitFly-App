import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruitfly/app/data/getmodels/getFliesModel.dart';
import 'package:fruitfly/app/resources/alignments.dart';
import 'package:fruitfly/app/resources/colors.dart';
import 'package:fruitfly/app/routes/app_pages.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    Payload payload = Get.arguments;

    return Scaffold(
        appBar: AppBar(
          title: const Text('DetailsView'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: crosstart,
          children: [
            GestureDetector(
              onTap: (){
                Get.toNamed(Routes.IMAGE,arguments: payload.description);
              },
              child: CachedNetworkImage(
                imageUrl: "https://modelapi.cerapp.co${payload.description!}",
                width: double.infinity,
                height: 300,
                fit: BoxFit.fill,
              ),
            ),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: crosstart,
                children: [
                  const Text(
                    "Title",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: blackcolor),
                  ),
                  Text(
                    payload.title.toString(),
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: blackcolor),
                  ),
                  10.heightBox,
                  const Text(
                    "Quantity",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: blackcolor),
                  ),
                  5.heightBox,
                  Text(
                    payload.quantity.toString(),
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: blackcolor),
                  ),
                   10.heightBox,
                  const Text(
                    "Uploaded Time",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: blackcolor),
                  ),
                  5.heightBox,
                  Text(
                   timeago.format(payload.createdAt!),
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: blackcolor),
                  ),
                   10.heightBox,
                  const Text(
                    "Location",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: blackcolor),
                  ),
                  5.heightBox,
                  Text(
                   payload.location!,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: blackcolor),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
