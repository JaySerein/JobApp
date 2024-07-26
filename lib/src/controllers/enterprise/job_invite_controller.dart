import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:job_app/src/components/styles/constants/images_string.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/job_card/job_card_select.dart';
import 'package:job_app/src/components/widgets/loader/full_screen_loader.dart';
import 'package:job_app/src/components/widgets/loader/loaders.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/models/job_model.dart';
import 'package:job_app/src/services/services.dart';

class JobInviteController extends GetxController {
  RxList<JobModel> listJob = <JobModel>[].obs;

  final jobCount = 0.obs;
  final isLoading = false.obs;

  final jobID = ''.obs;
  final profileID = ''.obs;
  String enterpriseID = '';

  @override
  void onInit() async {
    enterpriseID = GetStorage().read('enterpriseID');
    await getEnterpriseJob();
    super.onInit();
  }

  Future<void> getEnterpriseJob() async {
    try {
      await ApiServices().getEnterpriseJob().then((value) {
        final data = value.data['listJob'];
        for (var element in data) {
          final jobIem = JobModel.formJson(element);
          listJob.add(jobIem);
        }
        jobCount.value = listJob.length;
        jobID.value = listJob.first.id;
      }).onError((error, stackTrace) {});
    } catch (e) {
      JLoader.warningSnackBar(title: "Oh! bug", message: e.toString());
    }
  }

  Future<dynamic> selectJobInvite(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(JSizes.lg),
                child: Column(
                  children: [
                    const JSectionHeading(title: "Chọn công việc"),
                    const SizedBox(
                      height: JSizes.spaceBtwSections,
                    ),
                    Obx(() {
                      if (isLoading.value == true) {
                        return const Text("Đang lấy danh sách công việc");
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: jobCount.value,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) => JJobCardSelect(
                          job: listJob[index],
                          onTap: () {
                            try {
                              isLoading.value = true;
                              jobID.value = listJob[index].id;
                            } finally {
                              isLoading.value = false;
                            }
                          },
                          isChose:
                              jobID.value == listJob[index].id ? true : false,
                        ),
                      );
                    }),
                    const SizedBox(
                      height: JSizes.spaceBtwItems,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => inviteJob(),
                          child: const Text('Gửi lời mời')),
                    )
                  ],
                ),
              ),
            ));
  }

  Future<void> inviteJob() async {
    Get.back();
    try {
      JFullLoader.openLoadingDialog('Đang xử lý thông tin...', JImages.loading);
      await ApiServices()
          .inviteJob(jobID.value, profileID.value, enterpriseID)
          .then((value) async {
        JFullLoader.closeLoading();
        JLoader.successSnackBar(
            title: "Gửi lời mời thành công",
            message: "Vui lòng đợi phản hồi từ ứng viên");
      }).onError((error, stackTrace) {
        JFullLoader.closeLoading();
        JLoader.warningSnackBar(
            title: "Gửi lời mời thất bại", message: error.toString());
      });
    } catch (e) {
      JFullLoader.closeLoading();
      JLoader.errorSnackBar(
          title: "Đã xảy ra lỗi",
          message: "Quá trình đã xảy ra sự cố! Vui lòng thử lại sau!");
    }
  }
}
