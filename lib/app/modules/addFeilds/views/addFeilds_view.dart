import 'package:flutter/material.dart';
import 'package:fruitfly/app/data/getmodels/getFeildsModel.dart';

import 'package:get/get.dart';

import '../controllers/addFeilds_controller.dart';

class AddFeildsView extends GetView<AddFeildsController> {
  const AddFeildsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddFeildsController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 236, 136, 30),
        onPressed: () {
          controller.showBottomSheet(context);
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<GetFieldsModel>(
        future: controller.getFeilds(context),
        builder: (context, AsyncSnapshot<GetFieldsModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData || snapshot.data!.payload!.isEmpty) {
            return const Center(
              child: Text("No data available."),
            );
          }
          // Remove Expanded here and just return ListView.builder directly
          return ListView.builder(
            itemCount: snapshot.data!.payload!.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey.withOpacity(0.4),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(snapshot.data!.payload![i].name!),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
