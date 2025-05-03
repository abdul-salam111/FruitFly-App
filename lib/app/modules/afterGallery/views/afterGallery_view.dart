import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/afterGallery_controller.dart';

class AfterGallery extends GetView<AfterGalleryController> {
  const AfterGallery({Key? key, this.file}) : super(key: key);
  final XFile? file;
  @override
  Widget build(BuildContext context) {
    Get.put(AfterGalleryController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ceratitus Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.file(
                File(file!.path),
                height: 250.h,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              10.heightBox,
              Obx(
                () => TextField(
                  readOnly: true,
                  controller: controller.dateController.value,
                  decoration: const InputDecoration(
                    labelText: 'Date',
                    suffixIcon:
                        Image(image: AssetImage("assets/icons/Calender.png")),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      controller.dateController.value.text =
                          controller.dateFormat.format(pickedDate);
                    }
                  },
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                readOnly: true,
                controller: controller.timeController.value,
                decoration: const InputDecoration(
                  labelText: 'Time',
                  suffixIcon:
                      Image(image: AssetImage("assets/icons/clock.png")),
                ),
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    controller.timeController.value.text =
                        pickedTime.format(context);
                  }
                },
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: controller.fieldController.value,
                decoration: const InputDecoration(
                  labelText: 'Field Name',
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: controller.areaController.value,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: 'Area',
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 32.0),
              GestureDetector(
                onTap: (){
                  controller.uploadImage(file,context);
                  
                },
                child: const Center(
                    child: Image(image: AssetImage("assets/icons/submi.png"))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
