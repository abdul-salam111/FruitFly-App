import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
          backgroundColor: Colors.orange,
        ),
        body: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  height: 79,
                  width: 390,
                  color: Colors.grey.withOpacity(0.10),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "The threshold exceeded for fruitflies,kindly spray on it,The threshold exceeded for fruitflies,kindly spray on it,The threshold exceeded for fruitflies,kindly spray on it",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                ),
              );
            }));
  }
}
