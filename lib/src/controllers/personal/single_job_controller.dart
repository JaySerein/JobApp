import 'package:get/get.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/models/enterprise_model.dart';
import 'package:job_app/src/models/item_model.dart';
import 'package:job_app/src/models/job_model.dart';
import 'package:job_app/src/models/personal_profile_model.dart';
import 'package:job_app/src/models/place_model.dart';
import 'package:job_app/src/models/user_model.dart';
import 'package:job_app/src/services/services.dart';

class SingleJobController extends GetxController {
  String jobID;
  SingleJobController({required this.jobID});

  JobModel job = JobModel(
      enterprise: EnterpriseModel(
          user: User(province: Province(), district: District())),
      category: Item(),
      skills: []);

  final isloading = false.obs;
  @override
  void onInit() async {
    getJobDetails();
    super.onInit();
  }

  Future<void> getJobDetails() async {
    try {
      isloading.value = true;
      await ApiServices().getJobWithID(jobID).then((value) {
        var data = value.data['job'];
        job = JobModel.formJson(data);
      });
    } catch (e) {
      JLoader.warningSnackBar(title: "Oh! bug", message: e.toString());
    } finally {
      isloading.value = false;
    }
  }
}
