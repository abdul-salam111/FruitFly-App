import 'package:flutter/material.dart';
import 'package:fruitfly/app/repositories/uploadImageRepo.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AfterGalleryController extends GetxController {
  final dateController = TextEditingController().obs;
  final timeController = TextEditingController().obs;
  final areaController = TextEditingController().obs;
  final fieldController = TextEditingController().obs;
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  UploadImageRepository uploadImageRepository = UploadImageRepository();

  Future uploadImage(imageFile, context) async {
    // print(convertDateTimeFormat("${dateController.value.text} ${timeController.value.text}"));

    await uploadImageRepository.uploadNumberImage(
        title: fieldController.value.text.toString(),
        imageFile: imageFile,
        location: areaController.value.text.toString(),
        dateTime: convertDateTimeFormat(
            "${dateController.value.text} ${timeController.value.text}"),
        context: context);
  }

  String convertDateTimeFormat(String dateTimeStr) {
    // Parse the input string to a DateTime object
    DateTime dateTime = DateFormat('dd/MM/yyyy h:mm a').parse(dateTimeStr);

    // Format the DateTime object to the desired output format
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);

    return formattedDate;
  }
}
