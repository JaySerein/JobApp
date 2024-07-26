import 'package:get/get.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/models/item_model.dart';
import 'package:job_app/src/models/personal_profile_model.dart';
import 'package:job_app/src/models/place_model.dart';
import 'package:job_app/src/models/user_model.dart';
import 'package:job_app/src/services/services.dart';

class SingleProfileController extends GetxController {
  String profileID;
  SingleProfileController({required this.profileID});

  PersonalProfileModel profile = PersonalProfileModel(
      category: Item(),
      skills: [],
      userID: User(province: Province(), district: District()));
  final isloading = false.obs;
  @override
  void onInit() async {
    getProfile();
    super.onInit();
  }

  Future<void> getProfile() async {
    try {
      isloading.value = true;
      await ApiServices().getProfileWithID(profileID).then((value) {
        var data = value.data['personalProfile'];
        profile = PersonalProfileModel.formJson(data);
      });
    } catch (e) {
      JLoader.warningSnackBar(title: "Oh! bug", message: e.toString());
    } finally {
      isloading.value = false;
    }
  }
}
