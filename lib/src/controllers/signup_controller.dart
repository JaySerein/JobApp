import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/widgets/loader/full_screen_loader.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/services/services.dart';
import 'package:job_app/src/utils/network/network_manager.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePass = true.obs;
  final hideRepass = true.obs;
  final termOfUse = true.obs;

  final fullname = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  final repassword = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      // // Loading
      JFullLoader.openLoadingDialog('Đang xử lý thông tin...', JImages.loading);
      // // // Validation
      if (!signupFormKey.currentState!.validate()) {
        JFullLoader.closeLoading();
        return;
      }
      // // //Check repassword
      if (password.text.trim() != repassword.text.trim()) {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Sai mật khẩu",
            message:
                "Mật khẩu xác nhận không trùng khớp! Vui lòng kiểm tra lại!");
        return;
      }
      // // // Check terms of use
      if (!termOfUse.value) {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Chấp nhận chính sách & điều khoản",
            message:
                'Để đăng kí tài khoản, bạn cần đọc và chấp nhập chính sách bảo mật & điều khoản sử dụng.');

        return;
      }
      // // // Check Connect Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Không có kết nối Internet",
            message:
                'Thiết bị của bạn không có kết nối Internet. Vui lòng kiểm tra và thử lại');
        return;
      }

      String userFullname = fullname.text.trim();
      String userEmail = email.text.trim();
      String userPhone = phone.text.trim();
      String userPassword = password.text.trim();

      final reponse = await ApiServices()
          .register(userFullname, userEmail, userPhone, userPassword);
      if (reponse != null && reponse.statusCode == 201) {
        JFullLoader.closeLoading();
        JLoader.successSnackBar(
            title: "Đăng kí thành công",
            message:
                "Tài khoản của bạn đã đăng kí thành công, vui lòng xác nhận email để hoàn tất.");
        signupFormKey.currentState!.reset();
        Get.offAndToNamed('/verify-email');
      } else if (reponse!.statusCode == 400) {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Email đã tồn tại",
            message:
                'Tài khoản email bạn sử dụng đã đăng kí cho một tài khoản khác, vui lòng thay đổi địa chỉ email.');
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
