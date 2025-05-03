import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/image_controller.dart';

class ImageView extends GetView<ImageController> {
  const ImageView({super.key});
  @override
  Widget build(BuildContext context) {
    var image = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ImageView'),
        centerTitle: true,
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: "https://modelapi.cerapp.co" + image,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
