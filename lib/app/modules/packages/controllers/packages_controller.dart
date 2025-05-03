import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fruitfly/app/data/postmodel/siginPostModel.dart';
import 'package:fruitfly/app/repositories/authRepository.dart';
import 'package:fruitfly/app/repositories/packageRepository.dart';
import 'package:fruitfly/app/storage/storage.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fruitfly/app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PackagesController extends GetxController {
  final authRepo = AuthRepository();
  var selectedIndex = 0.obs;
// PackageRepository packageRepository=PackageRepository();
  Future<void> makePayment({required String amount, required packageId}) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, 'USD');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  billingDetails: const BillingDetails(
                      name: 'ABDUL SALAM',
                      email: 'abdulsalam.0302@gmail.com',
                      phone: '03115308116',
                      address: Address(
                          city: 'YOUR CITY',
                          country: 'YOUR COUNTRY',
                          line1: 'YOUR ADDRESS 1',
                          line2: 'YOUR ADDRESS 2',
                          postalCode: 'YOUR PINCODE',
                          state: 'YOUR STATE')),
                  setupIntentClientSecret:
                      'sk_test_51OVD6sGSU7ONSj30NHaJHRpACM9duaTsg6X6fcMOqqThvOCRjxE0WtJFLKWYYMW3my3O5Vwn79D1XqgVXeAZjcTV00kW6PlzvI',
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  // applePay: const PaymentSheetApplePay(merchantCountryCode: ''),
                  // googlePay: const PaymentSheetGooglePay(merchantCountryCode: ''),
                  allowsDelayedPaymentMethods: true,
                  customFlow: true,
                  style: ThemeMode.dark,
                  // merchantCountryCode: 'US',
                  merchantDisplayName: 'Abdul Salam'))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet(amount: amount, packageId: packageId);
    } catch (e, s) {
      print('Payment exception:$e$s');
    }
  }

  RxString price = '0'.obs;

  displayPaymentSheet({required amount, required packageId}) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((newValue) async {
        await Stripe.instance.confirmPaymentSheetPayment();

        await PackageRepository.buyPlan(packageId);
        await authRepo.signInUser(SignInModel(
            email: StorageServices.to.getString("email"),
            password: StorageServices.to.getString('password')));
        Utils.snakbar(
            title: "Payment Successfull!",
            body: "You have successfully activated");

        paymentIntentData = null;
      }).onError((error, stackTrace) {});
    } on Exception catch (e) {
      if (e is StripeException) {
        Utils.snakbar(
            title: "failed",
            body: 'Error from Stripe: ${e.error.localizedMessage}');
      } else {
        Utils.snakbar(title: "failed", body: 'Unforeseen error: $e');
      }
    }
  }

  Map<String, dynamic>? paymentIntentData;
  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51OVD6sGSU7ONSj30NHaJHRpACM9duaTsg6X6fcMOqqThvOCRjxE0WtJFLKWYYMW3my3O5Vwn79D1XqgVXeAZjcTV00kW6PlzvI',
            'Content-Type': 'application/x-www-form-urlencoded'
          });

      return jsonDecode(response.body);
    } catch (err) {
      Utils.snakbar(
          title: "Failed", body: 'err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final price = (int.parse(amount)) * 100;
    return price.toString();
  }
}
