import 'package:get/get.dart';

import '../modules/about/bindings/about_binding.dart';
import '../modules/about/views/about_view.dart';
import '../modules/addFeilds/bindings/addFeilds_binding.dart';
import '../modules/addFeilds/views/addFeilds_view.dart';
import '../modules/afterGallery/bindings/afterGallery_binding.dart';
import '../modules/afterGallery/views/afterGallery_view.dart';
import '../modules/details/bindings/details_binding.dart';
import '../modules/details/views/details_view.dart';
import '../modules/forgetPassword/bindings/forgetPassword_binding.dart';
import '../modules/forgetPassword/views/forgetPassword_view.dart';
import '../modules/getTrap/bindings/getTrap_binding.dart';
import '../modules/getTrap/views/getTrap_view.dart';
import '../modules/help/bindings/help_binding.dart';
import '../modules/help/views/help_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/image/bindings/image_binding.dart';
import '../modules/image/views/image_view.dart';
import '../modules/navBar/bindings/navBar_binding.dart';
import '../modules/navBar/views/navBar_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/onboardig/bindings/onboardig_binding.dart';
import '../modules/onboardig/views/onboardig_view.dart';
import '../modules/otpVerification/bindings/otpVerification_binding.dart';
import '../modules/otpVerification/views/OtpVerification_view.dart';
import '../modules/packages/bindings/packages_binding.dart';
import '../modules/packages/views/packages_view.dart';
import '../modules/privacypolicy/bindings/privacypolicy_binding.dart';
import '../modules/privacypolicy/views/privacypolicy_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/resetPassword/bindings/resetPassword_binding.dart';
import '../modules/resetPassword/views/resetPassword_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';
import '../modules/termsconditions/bindings/termsconditions_binding.dart';
import '../modules/termsconditions/views/termsconditions_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDIG,
      page: () => const OnboardigView(),
      binding: OnboardigBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDIG,
      page: () => const OnboardigView(),
      binding: OnboardigBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetpasswordView(),
      binding: ResetpasswordBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFICATION,
      page: () => const OtpVerificationView(),
      binding: OtpverificationBinding(),
    ),
    GetPage(
      name: _Paths.NAV_BAR,
      page: () => const NavbarView(),
      binding: NavBarBinding(),
    ),
    GetPage(
      name: _Paths.AFTER_GALLERY,
      page: () => const AfterGallery(),
      binding: AfterGalleryBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.HELP,
      page: () => const HelpView(),
      binding: HelpBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACYPOLICY,
      page: () => const PrivacypolicyView(),
      binding: PrivacypolicyBinding(),
    ),
    GetPage(
      name: _Paths.TERMSCONDITIONS,
      page: () => const TermsconditionsView(),
      binding: TermsconditionsBinding(),
    ),
    GetPage(
      name: _Paths.PACKAGES,
      page: () => const PackagesView(),
      binding: PackagesBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.ADDFEILDS,
      page: () => const AddFeildsView(),
      binding: AddFeildsBinding(),
    ),
    GetPage(
      name: _Paths.GETTRAP,
      page: () => GetTrapView(),
      binding: GetTrapBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => const DetailsView(),
      binding: DetailsBinding(),
    ),
    GetPage(
      name: _Paths.IMAGE,
      page: () => const ImageView(),
      binding: ImageBinding(),
    ),
  ];
}
// final TextEditingController _dateController = TextEditingController();
// final TextEditingController _timeController = TextEditingController();
// final TextEditingController _areaController = TextEditingController();
// final DateFormat dateFormat = DateFormat('dd/MM/yyyy');

// @override
// void initState() {
//   super.initState();
//   _dateController.text = '12/05/1990';
//   _timeController.text = '01:30:00';
//   _areaController.text = 'Wafaqi Colony PHA Flat, Building E1 Flat No.1 Johar Town Lahore Pakistan...';
// }
