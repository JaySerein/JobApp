import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/models/job_apply_mode.dart';
import 'package:job_app/src/models/success_connect_model.dart';
import 'package:job_app/src/services/services.dart';

class EnterpriseInterviewController extends GetxController {
  final isLoading = false.obs;

  RxList<SuccessConnectModel> listInterview = <SuccessConnectModel>[].obs;

  @override
  void onInit() async {
    await getListInterview();
    super.onInit();
  }

  Future<void> getListInterview() async {
    final enterpriseID = GetStorage().read('enterpriseID');
    try {
      isLoading.value = true;
      ApiServices().enterpriseListInterview(enterpriseID).then((value) {
        final data = value.data['listInterview'];
        for (var element in data) {
          final item = SuccessConnectModel.formJson(element);
          listInterview.add(item);
        }
      });
    } catch (e) {
      isLoading.value = false;
      JLoader.warningSnackBar(title: "Oh! bug", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
