import 'dart:convert';
import 'package:fruitfly/app/storage/keys.dart';
import 'package:fruitfly/app/storage/storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fruitfly/app/utils/utils.dart';

class AddFeildRepository {
  Future<void> addFields(String name) async {
    final url =
        Uri.parse('https://foodfly.saeedantechpvt.com/api/user/add/fields');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${StorageServices.to.getString(usertoken)}',
    };
    final body = json.encode({'name': name});

    try {
      EasyLoading.show(status: "Please wait...");
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        Utils.snakbar(title: "Feild Added", body: "Feild Added successfully");

        EasyLoading.dismiss();

        // Get.toNamed(Routes.OTP_VERIFICATION);
      } else if (response.statusCode == 400) {
        Utils.snakbar(
            title: "User Not Found", body: "Please enter your correct email!");
        EasyLoading.dismiss();
      } else {
        // Handle error
        print('Failed to send password reset email: ${response.statusCode}');
        EasyLoading.dismiss();
      }
    } catch (e) {
      // Handle exception
      print('Exception occurred: $e');
      EasyLoading.dismiss();
    }
  }
}
