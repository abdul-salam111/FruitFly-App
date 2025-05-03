import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:fruitfly/app/data/getmodels/getCountImageModel.dart';
import 'package:fruitfly/app/modules/packages/controllers/packages_controller.dart';
import 'package:fruitfly/app/routes/app_pages.dart';
import 'package:fruitfly/app/storage/keys.dart';
import 'package:fruitfly/app/storage/storage.dart';
import 'package:fruitfly/app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:async';

import 'package:velocity_x/velocity_x.dart';

class UploadImageRepository {
  Future<void> uploadImage(XFile imageFile, String fieldName, String location,
      String dateTime) async {
    try {
      EasyLoading.show();
      // URL of the API
      var url = Uri.parse('https://modelapi.cerapp.co/predict');

      // Create a multipart request
      var request = http.MultipartRequest('POST', url);

      // Add the image file to the request
      var stream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();

      var multipartFile = http.MultipartFile(
        'file', // This is the field name on the server
        stream,
        length,
        filename: basename(imageFile.path),
        contentType:
            MediaType('image', 'jpeg'), // Adjust the content type if needed
      );

      request.files.add(multipartFile);

      // Send the request
      var response = await request.send();

      // Capture and log the server response
      var responseBody = await http.Response.fromStream(response);

      // Check the response status
      if (response.statusCode == 200) {
        print('Upload successful: ${responseBody.body}');
        var data = jsonDecode(responseBody.body);
        await uploadFlyData(
            title: fieldName,
            description: data['result_image_url'],
            dateTime: dateTime,
            location: location,
            quantity: data['total_predictions'],
            imageFile: imageFile);
      } else {
        EasyLoading.dismiss();
        print('Upload failed with status: ${response.statusCode}');
        print('Response body: ${responseBody.body}');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> uploadFlyData({
    required String title,
    required String description,
    required String dateTime,
    required String location,
    required int quantity,
    required XFile imageFile,
  }) async {
    try {
      // URL of the API
      var url = Uri.parse(
          'https://foodfly.saeedantechpvt.com/api/user/detectedfly/store');

      // Create a multipart request
      var request = http.MultipartRequest('POST', url);
      request.headers['Authorization'] =
          'Bearer ${StorageServices.to.getString(usertoken)}';

      // Add the text fields
      request.fields['title'] = title;
      request.fields['description'] = description;
      request.fields['date_time'] = dateTime;
      request.fields['location'] = location;
      request.fields['quantity'] = quantity.toString();

      // Add the image file to the request
      var stream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();

      var multipartFile = http.MultipartFile(
        'image', // This is the field name on the server
        stream,
        length,
        filename: basename(imageFile.path),
        contentType:
            MediaType('image', 'jpeg'), // Adjust the content type if needed
      );

      request.files.add(multipartFile);

      // Send the request
      var response = await request.send();

      // Capture and log the server response
      var responseBody = await http.Response.fromStream(response);

      // Check the response status
      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        print('Upload successful: ${responseBody.body}');

        Get.offAllNamed(Routes.NAV_BAR);
      } else {
        print('Upload failed with status: ${response.statusCode}');
        print('Response body: ${responseBody.body}');
      }
    } catch (e) {
      print(e);
    }
  }

  //no of images upload by user. The api is for tracking user uploaded images

  Future<void> uploadNumberImage(
      {required String title,
      required String dateTime,
      required String location,
      required XFile imageFile,
      required BuildContext context}) async {
    var url = Uri.parse(
        'https://foodfly.saeedantechpvt.com/api/user/number/image/upload');

    try {
      EasyLoading.show();
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer ${StorageServices.to.getString(usertoken)}',
        },
        body: {
          'number_image_upload': '1',
        },
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        if (data['payload']['status'] == 200) {
          uploadImage(imageFile, title, location, dateTime);
        } else if (data['payload']['original']['error'] ==
            "User has no plans associated.") {
          Utils.snakbar(
              title: "Failed to upload",
              body: "Please buy any of the package, to upload images.");
          EasyLoading.dismiss();
          Get.offNamed(Routes.PACKAGES);
          // if (data['payload']['next_plan'] == null) {
          //   Utils.snakbar(
          //       title: "Your package is expired!",
          //       body: "Please upgrade your package");

          // } else {
          //   showPlanPopup(context, data);
          // }
        }
      } else {
        EasyLoading.dismiss();
        print('Failed to upload image: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while uploading image: $e');
    }
  }

  //show popup of new plan when the current plan is expired
  void showPlanPopup(BuildContext context, Map<String, dynamic> data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.all(12), // Adjust padding if needed
            decoration: BoxDecoration(
              color: const Color(0xffEA9A38).withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['payload']['next_plan']['title'].toString(),
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 70.w,
                          child: const Divider(
                            color: Color(0xFFD76A27),
                            thickness: 3,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$${data['payload']['next_plan']['price'].toString()}",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: const Color(0xFFD76A27),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        5.heightBox,
                      ],
                    ),
                  ],
                ),
                30.heightBox,
                Text(
                  "Plan Includes: ",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                10.heightBox,
                HtmlWidget(
                  data['payload']['next_plan']['description'].toString(),
                  textStyle: const TextStyle(
                    color: Colors.grey,
                    height: 2,
                  ),
                ),
                20.heightBox,
                GestureDetector(
                  onTap: () {
                    controller.makePayment(
                        amount:
                            data['payload']['next_plan']['price'].toString(),
                        packageId:
                            data['payload']['next_plan']['id'].toString());
                  },
                  child: Image.asset("assets/images/purchase.png"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  final controller = Get.put(PackagesController());

  //Get count of images
  Future<GetCountModel> getImageCount() async {
    const url =
        'https://foodfly.saeedantechpvt.com/api/user/number/image/upload';
    final token = StorageServices.to
        .getString(usertoken); // Replace with your actual token

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return GetCountModel.fromJson(data);
    } else {
      'Failed to load data: ${response.statusCode}';
      throw Exception();
    }
  }
}
