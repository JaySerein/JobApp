import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/loader/full_screen_loader.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/components/widgets/select/single_select.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/layouts/private/app/enterprise/home/enterpirse_home.dart';
import 'package:job_app/src/services/services.dart';
import 'package:job_app/src/utils/network/network_manager.dart';

class SignupController extends GetxController {
  final hidePass = true.obs;
  final hideRepass = true.obs;
  final termOfUse = true.obs;

  final isLoading = false.obs;

  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final repassword = TextEditingController();
  final role = TextEditingController().obs;

  List<String> listRole = ['Cá nhân', 'Doanh nghiệp'];

  Future<dynamic> selectRole(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(JSizes.lg),
                child: Column(
                  children: [
                    const JSectionHeading(title: "Chọn vai trò"),
                    const SizedBox(
                      height: JSizes.spaceBtwSections,
                    ),
                    Obx(() {
                      if (isLoading.value == true) {
                        return const Text("Đang lấy danh sách công việc");
                      }
                      return JListCard(
                          itemCount: listRole.length,
                          itemBuilder: (_, index) => JSingleSelectItem(
                                onTap: () {
                                  try {
                                    isLoading.value = true;
                                    role.value.text = listRole[index];
                                  } finally {
                                    isLoading.value = false;
                                  }
                                  Get.back();
                                },
                                isChose: role.value.text == listRole[index]
                                    ? true
                                    : false,
                                title: listRole[index],
                              ));
                    }),
                    const SizedBox(
                      height: JSizes.spaceBtwItems,
                    ),
                  ],
                ),
              ),
            ));
  }

  Future<void> signup(GlobalKey<FormState> signupFormKey) async {
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
      if (role.value.text == '') {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Chưa chọn vai trò",
            message: "Vui lòng chọn vai trò đề tiếp tục tạo tài khoản!");
        return;
      }
      String userRole = '';
      if (role.value.text == 'Cá nhân') {
        userRole = 'personal';
      } else {
        userRole = 'enterprise';
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

      String userFullname = fullname.text;
      String userEmail = email.text;
      String userPassword = password.text;

      await ApiServices()
          .register(userFullname, userEmail, userRole, userPassword)
          .then((value) {
        JFullLoader.closeLoading();
        JLoader.successSnackBar(
            title: "Đăng kí thành công",
            message:
                "Tài khoản của bạn đã đăng kí thành công, vui lòng xác nhận email để hoàn tất.");
        Get.offAndToNamed('/signin');
      }).onError((error, stackTrace) {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Đăng kí thất bại", message: error.toString());
      });
    } catch (exception) {
      JFullLoader.closeLoading();
      JLoader.errorSnackBar(
          title: "Đăng kí thất bại",
          message: "Quá trình đăng kí đã xảy ra sự cố! Vui lòng thử lại sau!");
    }
  }
}
