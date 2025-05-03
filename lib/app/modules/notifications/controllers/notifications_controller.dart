import 'package:fruitfly/app/repositories/notifications.dart';
import 'package:get/get.dart';

import '../../../data/getmodels/getNotificationsModel.dart';

class NotificationsController extends GetxController {
  NotificationsRepository notificationsRepository=NotificationsRepository();
  Future<GetNotificationsModel> getNotifications()async{
      return notificationsRepository.fetchNotifications();
  }
}
