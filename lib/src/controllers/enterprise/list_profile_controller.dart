import 'package:get/get.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/models/item_model.dart';
import 'package:job_app/src/models/personal_profile_model.dart';
import 'package:job_app/src/services/services.dart';

class ListProfileController extends GetxService {
  RxList<PersonalProfileModel> listProfile = <PersonalProfileModel>[].obs;
  RxList<Item> category = <Item>[].obs;
  final isloading = false.obs;
  @override
  void onInit() async {
    await getCategory();
    await getListProfile();
    super.onInit();
  }

  Future<void> getCategory() async {
    await ApiServices().getCategory().then((value) {
      var data = value.data['listCategory'];
      for (var item in data) {
        var skill = Item.formJson(item);
        category.add(skill);
      }
    });
  }

  Future<void> getListProfile() async {
    try {
      isloading.value = true;
      await ApiServices().getListProfile().then((value) {
        var data = value.data['personalProfile'];
        for (var item in data) {
          listProfile.add(PersonalProfileModel.formJson(item));
        }
      });
    } catch (e) {
      JLoader.warningSnackBar(title: "Oh! bug", message: e.toString());
    } finally {
      isloading.value = false;
    }
  }

  Future<PersonalProfileModel?> getProfile(String profileID) async {
    try {
      isloading.value = true;
      await ApiServices().getProfileWithID(profileID).then((value) {
        var data = value.data['personalProfile'];
        final profile = PersonalProfileModel.formJson(data);
        return profile;
      });
    } catch (e) {
      JLoader.warningSnackBar(title: "Oh! bug", message: e.toString());
    } finally {
      isloading.value = false;
    }
    return null;
  }
}
