import 'package:fruitfly/app/modules/getTrap/controllers/getTrap_controller.dart';
import 'package:get/get.dart';



class GetTrapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetTrapController>(
      () => GetTrapController(),
    );
  }
}
