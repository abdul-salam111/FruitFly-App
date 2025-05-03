import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitfly/app/resources/colors.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(color: whitecolor),
        ),
        backgroundColor: primaycolor,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: primaycolor,
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg"),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Abdul Salam",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "abdulsalam.0302@gmail.com",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "03115308116",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          20.heightBox,
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.edit, color: primaycolor),
                  title: const Text('Edit Profile'),
                  onTap: () {},
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: greyColor,
                    size: 17.sp,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Divider(
                    height: 5,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.attach_money, color: primaycolor),
                  title: const Text('Currency'),
                  onTap: () {},
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: greyColor,
                    size: 17.sp,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Divider(
                    height: 5,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.settings, color: primaycolor),
                  title: const Text('Setting'),
                  onTap: () {},
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: greyColor,
                    size: 17.sp,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Divider(
                    height: 5,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.language, color: primaycolor),
                  title: const Text('Language'),
                  onTap: () {},
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: greyColor,
                    size: 17.sp,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Divider(
                    height: 5,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.star, color: primaycolor),
                  title: const Text('Rate This App'),
                  onTap: () {},
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: greyColor,
                    size: 17.sp,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Divider(
                    height: 5,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.feedback, color: primaycolor),
                  title: const Text('Leave Feedback'),
                  onTap: () {},
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: greyColor,
                    size: 17.sp,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Divider(
                    height: 5,
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.feedback, color: primaycolor),
                  title: const Text('Privacy Policy'),
                  onTap: () {},
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: greyColor,
                    size: 17.sp,
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.feedback, color: primaycolor),
                  title: const Text('About Us'),
                  onTap: () {},
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: greyColor,
                    size: 17.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: primaycolor),
              icon: const Icon(
                Icons.logout,
                color: whitecolor,
              ),
              label: const Text(
                'Logout',
                style: TextStyle(color: whitecolor),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
