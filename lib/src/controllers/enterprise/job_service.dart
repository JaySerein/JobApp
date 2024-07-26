import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_app/src/components/widgets/loader/full_screen_loader.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/layouts/private/app/enterprise/enterprise_nav.dart';
import 'package:job_app/src/layouts/private/app/enterprise/job/job_apply/emterprise_job_apply.dart';
import 'package:job_app/src/layouts/private/app/personal/personal_nav.dart';
import 'package:job_app/src/services/services.dart';

class JobService extends GetxService {
  Future<void> acceptApply(String applyID) async {
    try {
      await ApiServices().acceptApply(applyID).then((value) {
        JFullLoader.closeLoading();
        Get.deleteAll();
        Get.to(() => const EnterpriseNav(page: 2));
        Get.to(() => JEnterpriseApplyScreen(
            enterpriseID: GetStorage().read('enterpriseID')));
        JLoader.successSnackBar(title: "Chấp nhận ứng tuyển thành công");
      }).onError((error, stackTrace) {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Từ chối thất bại", message: error.toString());
      });
    } catch (e) {
      JFullLoader.closeLoading();
      JLoader.warningSnackBar(title: "Oh! bug", message: e.toString());
    }
  }

  Future<void> denyApply(String applyID) async {
    try {
      await ApiServices().denyApply(applyID).then((value) {
        JFullLoader.closeLoading();
        Get.deleteAll();
        Get.to(() => const EnterpriseNav(page: 2));
        Get.to(() => JEnterpriseApplyScreen(
            enterpriseID: GetStorage().read('enterpriseID')));
        JLoader.successSnackBar(title: "Từ chối ứng tuyển thành công");
      }).onError((error, stackTrace) {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Từ chối thất bại", message: error.toString());
      });
    } catch (e) {
      JFullLoader.closeLoading();
      JLoader.warningSnackBar(title: "Oh! bug", message: e.toString());
    }
  }

  Future<void> acceptInvite(String inviteID) async {
    try {
      await ApiServices().acceptInvite(inviteID).then((value) {
        JFullLoader.closeLoading();
        Get.deleteAll();
        Get.to(() => const PersonalNav(page: 2));
        JLoader.successSnackBar(title: "Chấp nhận ứng tuyển thành công");
      }).onError((error, stackTrace) {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Từ chối thất bại", message: error.toString());
      });
    } catch (e) {
      JFullLoader.closeLoading();
      JLoader.warningSnackBar(title: "Oh! bug", message: e.toString());
    }
  }

  Future<void> denyInvite(String inviteID) async {
    try {
      await ApiServices().denyInvite(inviteID).then((value) {
        JFullLoader.closeLoading();
        JLoader.successSnackBar(title: "Từ chối ứng tuyển thành công");
        Get.deleteAll();
        Get.to(() => const PersonalNav(page: 2));
      }).onError((error, stackTrace) {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Từ chối thất bại", message: error.toString());
      });
    } catch (e) {
      JFullLoader.closeLoading();
      JLoader.warningSnackBar(title: "Oh! bug", message: e.toString());
    }
  }
}
