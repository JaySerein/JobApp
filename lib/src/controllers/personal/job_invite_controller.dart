import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/models/job_invite_model.dart';
import 'package:job_app/src/services/services.dart';

class PersonalInviteController extends GetxController {
  final isLoading = false.obs;
  final profileID = GetStorage().read('profileID');

  RxList<JobInviteModel> listInvite = <JobInviteModel>[].obs;

  @override
  void onInit() async {
    await getListAppy();
    super.onInit();
  }

  Future<void> getListAppy() async {
    try {
      isLoading.value = true;
      await ApiServices().personalGetInvite(profileID).then((value) {
        final data = value.data['listInvite'];
        for (var element in data) {
          final item = JobInviteModel.formJson(element);
          listInvite.add(item);
        }
      });
    } catch (e) {
      JLoader.warningSnackBar(title: "Oh! bug", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
