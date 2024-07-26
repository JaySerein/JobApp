import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_app/src/layouts/private/app/enterprise/enterprise_nav.dart';
import 'package:job_app/src/layouts/private/app/personal/personal_nav.dart';
import 'package:job_app/src/models/user_model.dart';

class AuthRepository extends GetxService {
  static AuthRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  @override
  void onReady() async {
    // deviceStorage.write('isSignin', false);
    FlutterNativeSplash.remove();
    await screenRedirect();
    await authChek();
  }

  screenRedirect() async {
    deviceStorage.writeIfNull("isFirstTime", true);
    deviceStorage.writeIfNull("isSignin", false);
    if (deviceStorage.read('isFirstTime') == true) {
      Get.offAllNamed('welcome');
    } else {
      if (deviceStorage.read('isSignin') == true) {
        User user = User.fromJson(deviceStorage.read('user'));
        if (user.role == 'personal') {
          Get.offAll(() => const PersonalNav());
        } else if (user.role == 'enterprise') {
          Get.offAll(() => const EnterpriseNav());
        }
      } else {
        // Get.reloadAll();
        Get.offAllNamed('signin');
      }
    }
  }

  authChek() async {
    if (deviceStorage.read('isFirstTime') == false &&
        deviceStorage.read('isSignin') == false) {
      Get.offAllNamed('signin');
    } else {}
  }
}
