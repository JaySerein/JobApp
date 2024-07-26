import 'package:get/get.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/models/job_apply_mode.dart';
import 'package:job_app/src/services/services.dart';

class EnterpriseApplyController extends GetxController {
  final isLoading = false.obs;
  var enterpriseID = "";

  EnterpriseApplyController({required this.enterpriseID});

  RxList<JobApplyModel> listApply = <JobApplyModel>[].obs;

  @override
  void onInit() async {
    await getListAppy();
    super.onInit();
  }

  Future<void> getListAppy() async {
    try {
      isLoading.value = true;
      await ApiServices().enterpriseListApplyJob(enterpriseID).then((value) {
        final data = value.data['listApply'];
        for (var element in data) {
          final item = JobApplyModel.formJson(element);
          listApply.add(item);
        }
      });
    } catch (e) {
      JLoader.warningSnackBar(title: "Oh! bug", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
