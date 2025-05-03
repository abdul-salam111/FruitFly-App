import 'dart:convert';
import 'package:fruitfly/app/data/getmodels/getNotificationsModel.dart';
import 'package:fruitfly/app/storage/keys.dart';
import 'package:fruitfly/app/storage/storage.dart';
import 'package:http/http.dart' as http;

class NotificationsRepository {
  Future<void> sendNotification(String title, String description) async {
    try {
      var url =
          Uri.parse('https://foodfly.saeedantechpvt.com/api/user/notification');

      var response = await http.post(
        url,
        headers: {
          'Content-Type':
              'application/json', // Set content type to application/json
          'Authorization':
              'Bearer ${StorageServices.to.getString(usertoken)}', // Replace with your actual token
        },
        body: jsonEncode({
          'title': title,
          'description': description,
        }),
      );

      if (response.statusCode == 200) {
        print('Notification sent successfully');
        // Handle successful response here
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
        // Handle error responses here
      }
    } catch (e) {
      print('Error: $e');
      // Handle network or other errors here
    }
  }

  //get notifications
  Future<GetNotificationsModel> fetchNotifications() async {
  try {
    var url = Uri.parse('https://foodfly.saeedantechpvt.com/api/user/notification');

    var response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json', // Set content type to application/json
        'Authorization': 'Bearer ${StorageServices.to.getString(usertoken)}', // Replace with your actual token
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return GetNotificationsModel.fromJson(data);
      // Handle successful response here
    } else {
      print('Request failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception();
      // Handle error responses here
    }
  } catch (e) {
    print('Error: $e');
      throw Exception();

    // Handle network or other errors here
  }
}
}
