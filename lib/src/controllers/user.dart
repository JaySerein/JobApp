import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_app/src/models/user_model.dart';

class JUser extends GetxController {
  static JUser get instance => Get.find();
  User currentUser = User.fromJson(GetStorage().read('user'));
}
