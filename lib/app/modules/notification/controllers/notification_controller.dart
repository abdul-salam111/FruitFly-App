import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotificationController extends GetxController {
  final dateController = TextEditingController().obs;
  final timeController = TextEditingController().obs;
  final areaController = TextEditingController().obs;
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
}
