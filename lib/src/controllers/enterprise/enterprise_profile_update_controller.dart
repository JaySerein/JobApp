import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/widgets/loader/full_screen_loader.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/layouts/private/app/enterprise/enterprise_nav.dart';
import 'package:job_app/src/layouts/private/app/enterprise/setting/enterprise_profile.dart';
import 'package:job_app/src/services/services.dart';

class EnterpriseProfileUpdateController extends GetxController {
  final eName = TextEditingController();
  final eTaxCode = TextEditingController();
  final eEmail = TextEditingController();
  final ePhone = TextEditingController();
  final eAddress = TextEditingController();
  final eActivity = TextEditingController();

  Future<void> updateEnterpriseProfile() async {
    try {
      /// Loading
      JFullLoader.openLoadingDialog('Đang xử lý thông tin...', JImages.loading);

      String enterpriseName = eName.text;
      String taxCode = eTaxCode.text;
      String activity = eActivity.text;

      await ApiServices()
          .updateEnterpriseProfile(enterpriseName, taxCode, activity)
          .then((value) async {
        JFullLoader.closeLoading();
        JLoader.successSnackBar(
            title: "Cập nhật thông tin thành công", message: "");
        Get.offAll(() => const EnterpriseNav(
              page: 4,
            ));
        Get.to(() => const EnterpriseProfile());
      }).onError((error, stackTrace) {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Cập nhật thông tin thất bại", message: error.toString());
      });
    } catch (exception) {
      JFullLoader.closeLoading();
      JLoader.errorSnackBar(
          title: "Đã xảy ra lỗi",
          message: "Quá trình đăng kí đã xảy ra sự cố! Vui lòng thử lại sau!");
    }
  }
}
