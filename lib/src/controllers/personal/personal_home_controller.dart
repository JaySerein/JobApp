import 'package:get/get.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/models/item_model.dart';
import 'package:job_app/src/models/job_model.dart';
import 'package:job_app/src/services/services.dart';

class PersonalHomeController extends GetxService {
  RxList<JobModel> listJob = <JobModel>[].obs;
  RxList<Item> category = <Item>[].obs;

  final jobCount = 0.obs;
  final isLoading = false.obs;

  @override
  void onInit() async {
    await getCategory();
    await getEnterpriseJob();
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

  Future<void> getEnterpriseJob() async {
    try {
      isLoading.value = true;
      await ApiServices().getJob().then((value) {
        final data = value.data['listJob'];
        for (var element in data) {
          final jobIem = JobModel.formJson(element);
          listJob.add(jobIem);
        }
        jobCount.value = listJob.length;
      });
    } catch (e) {
      JLoader.warningSnackBar(title: "Oh! bug", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
