import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/widgets/loader/full_screen_loader.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/layouts/private/role/select_role.dart';
import 'package:job_app/src/services/services.dart';
import 'package:job_app/src/utils/network/network_manager.dart';

class SigninController extends GetxController {
  static SigninController get intance => Get.find();

  final hidePass = true.obs;
  final remember = true.obs;

  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();

  Future<void> signin() async {
    try {
      /// Loading
      JFullLoader.openLoadingDialog('Đang xử lý thông tin...', JImages.loading);

      /// Validation
      if (!signinFormKey.currentState!.validate()) {
        JFullLoader.closeLoading();
        return;
      }

      /// Check Connect Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Không có kết nối Internet",
            message:
                'Thiết bị của bạn không có kết nối Internet. Vui lòng kiểm tra và thử lại');
        return;
      }

      String userEmail = email.text.trim();
      String userPassword = password.text.trim();

      final reponse = await ApiServices().login(userEmail, userPassword);
      if (reponse != null && reponse.statusCode == 200) {
        JFullLoader.closeLoading();
        JLoader.successSnackBar(
          title: "Đăng nhập thành công",
        );
        signinFormKey.currentState!.reset();
        Get.offAll(() => const SelectRoleScreen());
      } else {
        JFullLoader.closeLoading();
        JLoader.errorSnackBar(
            title: "Đã xảy ra lỗi",
            message:
                "Quá trình đăng kí đã xảy ra sự cố! Vui lòng thử lại sau!");
      }
    } catch (e) {
      JFullLoader.closeLoading();
      JLoader.errorSnackBar(
          title: "Đã xảy ra lỗi",
          message: "Quá trình đăng kí đã xảy ra sự cố! Vui lòng thử lại sau!");
    }
  }
}
