import 'package:get/get.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/models/job_model.dart';
import 'package:job_app/src/services/services.dart';

class EnterpriseJobController extends GetxController {
  RxList<JobModel> listJob = <JobModel>[].obs;

  final jobCount = 0.obs;
  final isLoading = false.obs;

  @override
  void onInit() async {
    await getEnterpriseJob();
    super.onInit();
  }

  Future<void> getEnterpriseJob() async {
    try {
      isLoading.value = true;
      await ApiServices().getEnterpriseJob().then((value) {
        final data = value.data['listJob'];
        for (var element in data) {
          final jobIem = JobModel.formJson(element);
          listJob.add(jobIem);
        }
        jobCount.value = listJob.length;
      }).onError((error, stackTrace) => null);
    } catch (e) {
      JLoader.warningSnackBar(title: "Oh! bug", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
