import 'package:fruitfly/app/routes/app_pages.dart';
import 'package:fruitfly/app/storage/keys.dart';
import 'package:fruitfly/app/storage/storage.dart';
import 'package:get/get.dart';

class SplashscreenController extends GetxController {


  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 2), ()async{
    
      if (StorageServices.to.getString(usertoken).isNotEmpty) {
       
        Get.offAllNamed(Routes.NAV_BAR);
      } else {
        Get.offAllNamed(Routes.ONBOARDIG);
      }
    });
  }
}
