import 'dart:convert';
import 'package:fruitfly/app/data/getmodels/getFeildsModel.dart';
import 'package:fruitfly/app/storage/keys.dart';
import 'package:fruitfly/app/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fruitfly/app/storage/storage.dart';

class Getfeildsrepository {
  Future<GetFieldsModel> getFields() async {
    final url =
        Uri.parse('https://foodfly.saeedantechpvt.com/api/user/get/fields');
    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json', // Adjust content type if needed
        'Authorization':
            'Bearer ${StorageServices.to.getString(usertoken)}', // Replace with your actual token
      },
    );

    try {
      EasyLoading.show(status: "Please wait...");

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        EasyLoading.dismiss();
        var returndata = GetFieldsModel.fromJson(data);
        return returndata;
        // Get.toNamed(Routes.OTP_VERIFICATION);
      } else if (response.statusCode == 400) {
        Utils.snakbar(
            title: "User Not Found", body: "Please enter your correct email!");
        EasyLoading.dismiss();
        throw Exception();
      } else {
        // Handle error
        print('Failed to send password reset email: ${response.statusCode}');
        EasyLoading.dismiss();
        throw Exception();
      }
    } catch (e) {
      // Handle exception
      print('Exception occurred: $e');
      EasyLoading.dismiss();
      throw Exception(e);
    }
  }
}
