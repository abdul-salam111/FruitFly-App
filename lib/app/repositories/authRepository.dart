import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fruitfly/app/data/getmodels/registerUserModel.dart';
import 'package:fruitfly/app/data/getmodels/signinResponseModel.dart';
import 'package:fruitfly/app/data/postmodel/siginPostModel.dart';
import 'package:fruitfly/app/routes/app_pages.dart';
import 'package:fruitfly/app/storage/keys.dart';
import 'package:fruitfly/app/storage/storage.dart';
import 'package:fruitfly/app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  //Api to register a new user
  Future<void> registerUser(RegisterUserModel userModel) async {
    final url =
        Uri.parse('https://foodfly.saeedantechpvt.com/api/user/register');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(userModel.toJson());

    try {
      EasyLoading.show(status: "Registering...");
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        Get.offAllNamed(Routes.SIGNIN);
        Utils.snakbar(
            title: "Account created!",
            body: "Your account is successfully created!");
        EasyLoading.dismiss();
      } else {
        var data = jsonDecode(response.body);
        Utils.snakbar(title: "Faild to register", body: data['message']);
        EasyLoading.dismiss();
      }
    } catch (e) {
      // Handle exception
      print('Exception occurred: $e');
    }
  }

  Future<void> signInUser(SignInModel siginUser) async {
    final url = Uri.parse('https://foodfly.saeedantechpvt.com/api/user/login');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(siginUser.toJson());

    try {
      EasyLoading.show(status: "Please wait...");
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        StorageServices.to
            .setString(key: "email", value: siginUser.email.toString());
        StorageServices.to
            .setString(key: "password", value: siginUser.password.toString());
        Get.offAllNamed(Routes.NAV_BAR);
        var data = jsonDecode(response.body);

        EasyLoading.dismiss();
        StorageServices.to
            .setString(key: usertoken, value: data['payload']['token']);
        StorageServices.to.setString(
            key: userInfo,
            value:
                signInResponseModelToJson(SignInResponseModel.fromJson(data)));
      } else {
        var data = jsonDecode(response.body);
        Utils.snakbar(title: "Faild to login", body: data['message']);
        EasyLoading.dismiss();
        throw Exception();
      }
    } catch (e) {
      // Handle exception
      print('Exception occurred: $e');
      throw Exception();
    }
  }

  // Below are the Forget Password API's

  //for sending otp

  Future<void> forgotPassword(String email) async {
    final url = Uri.parse(
        'https://foodfly.saeedantechpvt.com/api/user/forgot-password');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'email': email});

    try {
      EasyLoading.show(status: "Please wait...");
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        Utils.snakbar(
            title: "Otp Sent",
            body: "An otp is sent to your email successfully!");
        StorageServices.to.setString(key: userEmail, value: email);
        EasyLoading.dismiss();
        Get.toNamed(Routes.OTP_VERIFICATION);
      } else if (response.statusCode == 400) {
        Utils.snakbar(
            title: "User Not Found", body: "Please enter your correct email!");
        EasyLoading.dismiss();
      } else {
        // Handle error
        print('Failed to send password reset email: ${response.statusCode}');
        EasyLoading.dismiss();
      }
    } catch (e) {
      // Handle exception
      print('Exception occurred: $e');
      EasyLoading.dismiss();
    }
  }

  //match otp
  Future<void> verifyOtp(String otp) async {
    final url =
        Uri.parse('https://foodfly.saeedantechpvt.com/api/user/verify-otp');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'otp': otp});

    try {
      EasyLoading.show(status: "Please wait...");
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        Utils.snakbar(title: "Otp matched", body: "Otp matched successfully!");
        Get.toNamed(Routes.RESET_PASSWORD);
        EasyLoading.dismiss();
        StorageServices.to.setString(key: 'otp', value: otp);
      } else {
        Utils.snakbar(
            title: "Otp does not matched!",
            body: "Please enter a correct otp!");
        EasyLoading.dismiss();
      }
    } catch (e) {
      // Handle exception

      EasyLoading.dismiss();
    }
  }

  //reset password
  Future<void> resetPassword(String password, String confirmPassword) async {
    final url =
        Uri.parse('https://foodfly.saeedantechpvt.com/api/user/reset-password');
    final headers = {'Content-Type': 'application/json'};

    final body = json.encode({
      'email': StorageServices.to.getString(userEmail),
      'password': password,
      'password_confirmation': confirmPassword,
      'otp': StorageServices.to.getString('otp'),
    });

    try {
      EasyLoading.show(status: "Please wait...");
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        Utils.snakbar(
            title: "Password changed",
            body: "The password has been successfully changed!");

        Get.toNamed(Routes.SIGNIN);
        EasyLoading.dismiss();
      } else {
        Utils.snakbar(title: "Faild!", body: "Failed to change password.");
        EasyLoading.dismiss();
      }
    } catch (e) {
      EasyLoading.dismiss();
    }
  }
}
