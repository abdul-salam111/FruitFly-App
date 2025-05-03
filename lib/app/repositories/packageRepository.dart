import 'dart:convert';

import 'package:fruitfly/app/data/getmodels/packageModel.dart';
import 'package:fruitfly/app/storage/keys.dart';
import 'package:fruitfly/app/storage/storage.dart';
import 'package:http/http.dart' as http;

class PackageRepository {
  //get all plans
  Future<PackgesModel> getPlan() async {
    final url = Uri.parse('https://foodfly.saeedantechpvt.com/api/user/plan');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        // Handle successful request
        final data = json.decode(response.body);
        StorageServices.to.setString(
            key: 'packages',
            value: packgesModelToJson(PackgesModel.fromJson(data)));

        return PackgesModel.fromJson(data);
      } else {
        // Handle error

        throw Exception();
      }
    } catch (e) {
      // Handle exception
      print('Exception occurred: $e');
      throw Exception();
    }
  }

  //buy plans
  static Future<void> buyPlan(packageId) async {
    final url =
        Uri.parse('https://foodfly.saeedantechpvt.com/api/user/buy/plan');
    final headers = {
      // 'Content-Type': 'application/json',
      "Authorization": "Bearer ${StorageServices.to.getString(usertoken)}"
    };

    try {
      var res =
          await http.post(url, headers: headers, body: {'plan_id': packageId});
      if (res.statusCode == 200) {
        StorageServices.to.setBool(key: packageBought, value: true);
      }
    } catch (e) {
      // Handle exception
      print('Exception occurred: $e');
    }
  }
}
