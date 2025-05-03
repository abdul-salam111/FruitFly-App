import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruitfly/app/resources/alignments.dart';
import 'package:fruitfly/app/resources/colors.dart';

Widget customTextField(
    {required String hintText,
    required String label,
    required IconData icon,
    required TextEditingController textEditingController,
    FormFieldValidator? formFieldValidator}) {
  return Column(
    crossAxisAlignment: crosstart,
    children: [
      Text(
        label,
        style: const TextStyle(
          color: Color(0xFF8B8B8B),
          fontSize: 14,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
      5.verticalSpace,
      TextFormField(
        validator: formFieldValidator,
        controller: textEditingController,
        style: const TextStyle(
          color: Color(0xFF8B8B8B),
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: greyColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: greyColor),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xFF8B8B8B),
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: greyColor, width: 2),
            ),
            suffixIcon: Icon(icon),
            contentPadding: const EdgeInsets.only(left: 10)),
      )
    ],
  );
}
