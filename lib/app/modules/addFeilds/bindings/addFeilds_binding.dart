import 'package:fruitfly/app/modules/addFeilds/controllers/addFeilds_controller.dart';
import 'package:get/get.dart';

class AddFeildsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AddFeildsController>(
      AddFeildsController(),
    );
  }
}
