import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/widgets/loader/full_screen_loader.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/models/job_model.dart';
import 'package:job_app/src/services/services.dart';

class JobApplyController extends GetxService {
  Future<void> applyJob(JobModel job) async {
    try {
      JFullLoader.openLoadingDialog('Đang xử lý thông tin...', JImages.loading);
      final jobID = job.id;
      final enterpriseID = job.enterprise.id;
      final profileID = GetStorage().read('profileID');
      if (profileID.isEmpty || jobID.isEmpty || enterpriseID.isEmpty) {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Ứng tuyển thất bại",
            message: "Quá trình ứng tuyển gặp sự cố hãy thử lại");
      } else {
        await ApiServices()
            .applyJob(jobID, profileID, enterpriseID)
            .then((value) async {
          JFullLoader.closeLoading();
          JLoader.successSnackBar(
              title: "Ứng tuyển thành công",
              message: "Vui lòng đợi phản hồi từ nhà tuyển dụng");
        }).onError((error, stackTrace) {
          JFullLoader.closeLoading();
          JLoader.warningSnackBar(
              title: "Ứng tuyển thất bại", message: error.toString());
        });
      }
    } catch (e) {
      JFullLoader.closeLoading();
      JLoader.errorSnackBar(
          title: "Đã xảy ra lỗi",
          message:
              "Quá trình ứng tuyển đã xảy ra sự cố! Vui lòng thử lại sau!");
    }
  }
}
