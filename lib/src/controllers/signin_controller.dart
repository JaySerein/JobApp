import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/widgets/loader/full_screen_loader.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/repository/auth_repository.dart';
import 'package:job_app/src/services/services.dart';
import 'package:job_app/src/utils/network/network_manager.dart';

class SigninController extends GetxController {
  final deviceStorage = GetStorage();

  final hidePass = true.obs;
  final remember = true.obs;

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void onClose() {}

  Future<void> signin(GlobalKey<FormState> signinFormKey) async {
    try {
      /// Loading
      JFullLoader.openLoadingDialog('Đang xử lý thông tin...', JImages.loading);

      /// Validation
      if (!signinFormKey.currentState!.validate()) {
        JFullLoader.closeLoading();
        return;
      }

      /// Check Connect Internet
      // Get.put(NetworkManager());
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Không có kết nối Internet",
            message:
                'Thiết bị của bạn không có kết nối Internet. Vui lòng kiểm tra và thử lại');
        return;
      }

      String userEmail = email.text;
      String userPassword = password.text;

      await ApiServices().login(userEmail, userPassword).then((value) async {
        JFullLoader.closeLoading();
        JLoader.successSnackBar(
            title: "Đăng nhập thành công",
            message: "Chào mừng bạn đến với ứng dụng giới thiệu việc làm.");
        final userData = value.data['user'];
        print(userData);
        deviceStorage.write("user", userData);
        deviceStorage.write('isSignin', true);
        if (userData['role'] == 'personal') {
          final userProfile = value.data['userProfile'];
          deviceStorage.write('profileID', userProfile['_id']);
        } else if (userData['role'] == 'enterprise') {
          final userProfile = value.data['userProfile'];
          deviceStorage.write('enterpriseID', userProfile['_id']);
        }
        final authRepo = Get.put(AuthRepository());
        authRepo.screenRedirect();
      }).onError((error, stackTrace) {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Đăng nhập thất bại", message: error.toString());
      });
    } catch (exception) {
      JFullLoader.closeLoading();
      JLoader.errorSnackBar(
          title: "Đã xảy ra lỗi",
          message: "Quá trình đăng kí đã xảy ra sự cố! Vui lòng thử lại sau!");
    }
  }
}
