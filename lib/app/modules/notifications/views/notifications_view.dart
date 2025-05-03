import 'package:flutter/material.dart';
import 'package:fruitfly/app/resources/alignments.dart';
import 'package:fruitfly/app/resources/colors.dart';
import 'package:fruitfly/app/resources/paddings.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('NotificationsView'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: controller.getNotifications(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (!snapshot.hasData) {
                return const Center(
                  child: Text("No data found"),
                );
              }
              return ListView.builder(
                  itemCount: snapshot.data!.payload!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: crosstart,
                        children: [
                          5.heightBox,
                          Text(snapshot.data!.payload![index].title!,style: const TextStyle(fontWeight: FontWeight.bold,color: blackcolor),),
                          5.heightBox,
                          Text(snapshot.data!.payload![index].description!,style: const TextStyle(color: textfieldgrey),),
                          5.heightBox,
                        ],
                      ).box.clip(Clip.antiAlias).gray100.padding(defaultpad).rounded.make(),
                    );
                  });
            }));
  }
}
