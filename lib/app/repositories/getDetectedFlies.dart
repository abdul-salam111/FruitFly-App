import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fruitfly/app/Services/notificationsServices/localNotifications.dart';
import 'package:fruitfly/app/data/getmodels/getFliesModel.dart';
import 'package:fruitfly/app/repositories/notifications.dart';
import 'package:fruitfly/app/resources/colors.dart';
import 'package:fruitfly/app/storage/keys.dart';
import 'package:fruitfly/app/storage/storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class GetDetectedFliesRepository {
  NotificationsRepository notificationsRepository = NotificationsRepository();

  final box = GetStorage(); // GetStorage instance

  bool get alertShown => box.read('alertShown') ?? false;

  Future<GetFliesModel> fetchDetectedFlies() async {
    try {
      var url =
          Uri.parse('https://foodfly.saeedantechpvt.com/api/user/detectedfly');

      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json', // Adjust content type if needed
          'Authorization':
              'Bearer ${StorageServices.to.getString(usertoken)}', // Replace with your actual token
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        // Handle your response data here
        var totalQuantity = 0;
        var returndata = GetFliesModel.fromJson(data);

// Use fold to calculate the total quantity
        totalQuantity =
            returndata.payload!.fold(0, (sum, item) => sum + item.quantity!);

        if (totalQuantity >= 20 && !alertShown) {
          showAlert();

          await LocalNotifications.showSimpleNotification(
              title: "Alert",
              body:
                  "The quantity of Seratius is increasing, please spray your corps.",
              payload: "");
        }
        return returndata;
      } else {
        throw Exception();
      }
    } catch (e) {
      print('Error: $e');
      // Handle network or other errors here
      throw Exception();
    }
  }

  void showAlert() {
    Get.dialog(
      AlertDialog(
        title: const Icon(
          Icons.warning,
          color: redColor,
        ),
        content: const Text(
          'The amount of saratius is increasing. Please do spray to save your crops.',
          style: TextStyle(color: blackcolor),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Get.back();

              box.write('alertShown', true);
            },
          ),
        ],
      ),
    );
  }
}
