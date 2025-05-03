import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitfly/app/modules/otpVerification/controllers/otpVerification_controller.dart';
import 'package:fruitfly/app/resources/colors.dart';
import 'package:get/get.dart';

class OtpVerificationView extends GetView<OtpVerificationController> {
  const OtpVerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView(
          children: [
            const SizedBox(height: 50),
            const Center(
              child: Text(
                'OTP Verification',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Center(
              child: SizedBox(
                width: 320,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Enter 4 digit code that has been sent on your email ',
                        style: TextStyle(
                          color: Color(0xFF8B8B8B),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'example@gmail.com',
                        style: TextStyle(
                          color: Color(0xFFFFCC4A),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const OtpFields(),
            const SizedBox(height: 40),
            Center(
              child: GestureDetector(
                  onTap: () {
                    // Handle Resend OTP functionality here
                  },
                  child: const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Didn’t receive?',
                          style: TextStyle(
                            color: Color(0xFF575757),
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        TextSpan(
                          text: ' Resend OTP',
                          style: TextStyle(
                            color: Color(0xffffcc4a),
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  )),
            ),
            40.verticalSpace,
            GestureDetector(onTap: (){
              controller.matchOtp();
            },child: Image.asset("assets/icons/continuebutton.png"))
          ],
        ),
      ),
    );
  }
}

class OtpFields extends StatefulWidget {
  const OtpFields({super.key});

  @override
  _OtpFieldsState createState() => _OtpFieldsState();
}

class _OtpFieldsState extends State<OtpFields> {
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  final controller = Get.put(OtpVerificationController());

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in controller.controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _nextField(String value, int index) {
    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.length == 1 && index == 5) {
      _focusNodes[index].unfocus();
      // You can call OTP verification function here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(6, (index) {
        return SizedBox(
          width: 50,
          child: TextFormField(
            controller: controller.controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, color: blackcolor),
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: const InputDecoration(
              counterText: '',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFFCC4A), width: 2),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFFFCC4A), width: 2),
              ),
            ),
            onChanged: (value) {
              _nextField(value, index);
            },
          ),
        );
      }),
    );
  }
}
