import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fruitfly/app/Services/notificationsServices/localNotifications.dart';

import 'package:fruitfly/app/routes/app_pages.dart';
import 'package:fruitfly/app/storage/storage.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> firebasemessaging(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init(); // Initialize GetStorage
  runApp(const MyApp());

  StorageServices.to.init();
  Stripe.publishableKey =
      'pk_test_51OVD6sGSU7ONSj30sWfFK9wuUeiCGF8yvDCKPWd2KTFvIrD1KAi2Lb78VyErMYUefdi6AwlaS6LAwJd62aCIxIag00mW0qhuAF';
  await Stripe.instance.applySettings();
  WidgetsFlutterBinding.ensureInitialized();
 await LocalNotifications.init();


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // FirebaseMessaging.onBackgroundMessage(
    //     (message) => firebasemessaging(message));
    // notificationServices.requestNotificationsPermission();
    // notificationServices.firebaseInit(context);
    // notificationServices.setupInteractMessage(context);
    // // notificationServices.firebases(position!);
    // notificationServices.getDeviceToken().then((value) async {
    //   // await FirebaseFirestore.instance
    //   //     .collection(userCollection)
    //   //     .doc(StorageServices.to.getString(userId))
    //   //     .update({"deviceId": value});

    //   notificationServices.getRefreshedToken();
    // });

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          title: 'FruitFly',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          getPages: AppPages.routes,
          initialRoute: Routes.SPLASHSCREEN,
          home: child,
        );
      },
    );
  }
}
