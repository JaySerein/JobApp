import 'package:get/get.dart';
import 'package:job_app/src/layouts/public/password_config/forget_password.dart';
import 'package:job_app/src/layouts/public/password_config/reset_password.dart';
import 'package:job_app/src/layouts/public/sign_in/sign_in.dart';
import 'package:job_app/src/layouts/public/sign_up/sign_up.dart';
import 'package:job_app/src/layouts/public/sign_up/verify_email.dart';
import 'package:job_app/src/layouts/public/welcome/welcome.dart';

class JRoutes {
  static final routes = [
    //
    GetPage(
      name: '/welcome',
      page: () => const WelcomeScreens(),
    ),
    GetPage(
      name: '/signin',
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: '/signup',
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: '/verify-email',
      page: () => const VerifyEmailScreen(),
    ),
    GetPage(
      name: '/forget-password',
      page: () => const ForgetPassword(),
    ),
    GetPage(
      name: '/reset-password',
      page: () => const ResetPassword(),
    ),
    //user-route
    // GetPage(
    //   name: '/app',
    //   page: () => const NavigationMenu(),
    // ),
    //company-route
    // GetPage(
    //   name: '/company-page',
    //   page: () => const NavigationMenuCompany(),
    // ),
  ];
}
