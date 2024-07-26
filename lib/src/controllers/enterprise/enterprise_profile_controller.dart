import 'package:get/get.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/models/enterprise_model.dart';
import 'package:job_app/src/models/place_model.dart';
import 'package:job_app/src/models/user_model.dart';
import 'package:job_app/src/services/services.dart';

class EnterpriseProfileController extends GetxController {
  final isLoading = false.obs;
  EnterpriseModel enterpriseProfile =
      EnterpriseModel(user: User(province: Province(), district: District()));

  @override
  void onInit() async {
    await getEnterpriseProfile();
    super.onInit();
  }

  Future<void> getEnterpriseProfile() async {
    try {
      isLoading.value = true;
      await ApiServices().getEnterpriseProfile().then((value) {
        var data = value.data['enterpriseProfile'];
        enterpriseProfile = EnterpriseModel.formJson(data);
      });
    } catch (e) {
      isLoading.value = false;
      JLoader.warningSnackBar(title: "Oh! bug", message: e.toString());
      Get.back();
    } finally {
      isLoading.value = false;
    }
  }
}
