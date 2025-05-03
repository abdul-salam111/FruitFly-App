import 'package:flutter/material.dart';
import 'package:fruitfly/app/modules/addFeilds/views/addFeilds_view.dart';
import 'package:fruitfly/app/modules/afterGallery/views/afterGallery_view.dart';
import 'package:fruitfly/app/modules/help/views/help_view.dart';
import 'package:fruitfly/app/modules/home/views/home_view.dart';
import 'package:fruitfly/app/modules/settings/views/settings_view.dart';
import 'package:fruitfly/app/repositories/packageRepository.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class NavBarController extends GetxController {
  PackageRepository packageRepository = PackageRepository();
  @override
  void onInit() async {
    super.onInit();
    packageRepository.getPlan();
  }

  Widget buildOption(BuildContext context,
      {required IconData icon,
      required String text,
      required Function() onTap}) {
    return InkWell(
      onTap: () {
        // Navigator.pop(context);
        // onTap();
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon(icon", size: 30.0),
            // SizedBox(height: 8.0),
            Text("text"),
          ],
        ),
      ),
    );
  }

  List<Widget> pages = [
    HomeView(),
    // const AboutView(),
    // HomeView(),

    // BottomSheetWidget(),
    const AddFeildsView(),
        HomeView(),
    const SettingsView(),
    const HelpView(),
  ];

  var selectedIndex = 0.obs;
  // void _onItemTapped(int index) {
  //   if (index == 2) {
  //     _showBottomSheet(context);
  //   } else {
  //     setState(() {
  //       _selectedIndex = index;
  //     });
  //   }
  // }

  // void onItemTapped(int index) {
  //   if (index == 3) {
  //     showBottomSheet(Get.context!);
  //   } else {
  //     selectedIndex.value = index > 2 ? index - 1 : index;
  //   }
  // }

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
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: Text(
                  'Choose an action',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _pickImage(context, ImageSource.camera);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/icons/Camera.png"))),
                        ),
                      ),
                      // IconButton(
                      //   icon: Icon(Icons.camera_alt),
                      //   onPressed: () {
                      //     Navigator.pop(context);
                      //     // Implement camera functionality here
                      //   },
                      //   iconSize: 50,
                      // ),
                      const Text(
                        'Take a photo',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          _pickImage(context, ImageSource.gallery);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/icons/Gallery.png"))),
                        ),
                      ),
                      const Text('Gallery',
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      Get.to(() => AfterGallery(
            file: pickedFile,
          ));
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Picked: ${pickedFile.path}')),
      // );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No image selected')),
      );
    }
  }
}
