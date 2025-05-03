import 'package:get/get.dart';

import '../controllers/afterGallery_controller.dart';

class AfterGalleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AfterGalleryController>(
      () => AfterGalleryController(),
    );
  }
}
