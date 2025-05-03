import 'package:flutter/material.dart';
import 'package:fruitfly/app/data/getmodels/getFeildsModel.dart';
import 'package:fruitfly/app/repositories/addFeildsRepository.dart';
import 'package:fruitfly/app/repositories/getFeildsRepository.dart';
import 'package:get/get.dart';

class AddFeildsController extends GetxController {
  AddFeildRepository addFeildRepository = AddFeildRepository();
  Getfeildsrepository getFeildRepository = Getfeildsrepository();

  Future<GetFieldsModel> getFeilds(context) async {
    return getFeildRepository.getFields();
  }

  Future<void> addFeilds(context) async {
    return addFeildRepository.addFields(fieldController.value.text);
  }

  final fieldController = TextEditingController().obs;
  // final timeController = TextEditingController().obs;
  // final areaController = TextEditingController().obs;
  // final fieldController = TextEditingController().obs;
  showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: Text(
                  'Write the name of feild',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: fieldController.value,
                decoration: const InputDecoration(
                  labelText: 'Field Name',
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  addFeilds(context).then((val) {
                    fieldController.value.clear();
                  });
                },
                child: const Center(
                    child: Image(image: AssetImage("assets/icons/submi.png"))),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: <Widget>[
              //     Column(
              //       children: <Widget>[
              //         GestureDetector(
              //           onTap: () {
              //             _pickImage(context, ImageSource.camera);
              //           },
              //           child: Container(
              //             height: 40,
              //             width: 40,
              //             decoration: const BoxDecoration(
              //                 image: DecorationImage(
              //                     image:
              //                         AssetImage("assets/icons/Camera.png"))),
              //           ),
              //         ),
              //         // IconButton(
              //         //   icon: Icon(Icons.camera_alt),
              //         //   onPressed: () {
              //         //     Navigator.pop(context);
              //         //     // Implement camera functionality here
              //         //   },
              //         //   iconSize: 50,
              //         // ),
              //         const Text(
              //           'Take a photo',
              //           style: TextStyle(color: Colors.black),
              //         ),
              //       ],
              //     ),
              //     Column(
              //       children: <Widget>[
              //         GestureDetector(
              //           onTap: () {
              //             _pickImage(context, ImageSource.gallery);
              //           },
              //           child: Container(
              //             height: 40,
              //             width: 40,
              //             decoration: const BoxDecoration(
              //                 image: DecorationImage(
              //                     image:
              //                         AssetImage("assets/icons/Gallery.png"))),
              //           ),
              //         ),
              //         const Text('Gallery',
              //             style: TextStyle(color: Colors.black)),
              //       ],
              //     ),
              //   ],
              // ),
            ],
          ),
        );
      },
    );
  }
}
