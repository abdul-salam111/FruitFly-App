import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitfly/app/customWidgets/ratingWidget.dart';
import 'package:fruitfly/app/data/getmodels/signinResponseModel.dart';
import 'package:fruitfly/app/resources/colors.dart';
import 'package:fruitfly/app/storage/keys.dart';
import 'package:fruitfly/app/storage/storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SettingsController extends GetxController {
  void showRatingDialog(context) {
    // actual store listing review & rating
    // void _rateAndReviewApp() async {
    //   // refer to: https://pub.dev/packages/in_app_review
    //   final _inAppReview = InAppReview.instance;

    //   if (await _inAppReview.isAvailable()) {
    //     print('request actual review from store');
    //     _inAppReview.requestReview();
    //   } else {
    //     print('open actual store listing');
    //     // TODO: use your own store ids
    //     _inAppReview.openStoreListing(
    //       appStoreId: '<your app store id>',
    //       microsoftStoreId: '<your microsoft store id>',
    //     );
    //   }
    // }

    final dialog = RatingDialog(
      starSize: 25.sp,

      initialRating: 1.0,
      // your app's name?
      title: const Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.bold, color: blackcolor),
      ),
      // encourage your user to leave a high rating?
      message: const Text(
        'Tap a star to set your rating. Please add your feedback.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15, color: textfieldgrey),
      ),
      // your app's logo?
      image: Image.asset(
        "assets/images/careapp.png",
        width: 100,
      ),
      submitButtonText: 'Submit',

      onCancelled: () => print('cancelled'),
      onSubmitted: (responses) async {
        const String url =
            'https://foodfly.saeedantechpvt.com/api/user/feedback';

        try {
          var response = await http.post(
            Uri.parse(url),
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
            body: {
              'name': signInResponseModelFromJson(
                      StorageServices.to.getString(userInfo))
                  .payload!
                  .user!
                  .name!,
              'email': signInResponseModelFromJson(
                      StorageServices.to.getString(userInfo))
                  .payload!
                  .user!
                  .email!,
              'comment': responses.comment.toString(),
              'rating': responses.rating,
            },
          );

          if (response.statusCode == 200) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Feedback submitted successfully')),
            );
          } else {
            print('Failed with status: ${response.statusCode}');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Failed to submit feedback')),
            );
          }
        } catch (e) {
          print('Error: $e');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('An error occurred')),
          );
        }
      },
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => dialog,
    );
  }
}
