import 'package:flutter/material.dart';
import 'package:fruitfly/app/resources/colors.dart';

import 'package:get/get.dart';

import '../controllers/navBar_controller.dart';

class NavbarView extends GetView<NavBarController> {
  const NavbarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(NavBarController());
    return Scaffold(
        bottomNavigationBar: Stack(
          clipBehavior: Clip.none,
          children: [
            Obx(
              () => BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                selectedItemColor: const Color(0xFFFFA726), // Orange color
                unselectedItemColor: Colors.grey,
                currentIndex: controller.selectedIndex.value,
                onTap: (e) {
                  controller.selectedIndex.value = e;
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  // BottomNavigationBarItem(
                  //   icon: Icon(Icons.info),
                  //   label: 'About',
                  // ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Add Feilds',
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox.shrink(),
                    label: '',
                  ),

                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Setting',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.help),
                    label: 'Help',
                  ),
                ],
              ),
            ),
            Positioned(
              top: -30,
              left: MediaQuery.of(context).size.width / 2.37,
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {
                  controller.showBottomSheet(context);
                },

                backgroundColor: const Color(0xFFFFA726), // Orange color
                child: const Icon(
                  Icons.add,
                  color: whitecolor,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Obx(
            () => controller.pages.elementAt(controller.selectedIndex.value)));
  }
}
