import 'package:get/get.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/models/item_model.dart';
import 'package:job_app/src/models/personal_profile_model.dart';
import 'package:job_app/src/models/place_model.dart';
import 'package:job_app/src/models/user_model.dart';
import 'package:job_app/src/services/services.dart';

class PersonalProfileController extends GetxController {
  final isLoading = false.obs;

  PersonalProfileModel profile = PersonalProfileModel(
      category: Item(),
      skills: [],
      userID: User(province: Province(), district: District()));

  @override
  void onInit() async {
    await getProfile();
    super.onInit();
  }

  Future<void> getProfile() async {
    try {
      isLoading.value = true;
      await ApiServices().getProfile().then((value) {
        var data = value.data['personalProfile'];
        profile = PersonalProfileModel.formJson(data);
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
