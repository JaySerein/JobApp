import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/profile/profile_apply_card.dart';
import 'package:job_app/src/controllers/enterprise/enterprise_apply_controller.dart';
import 'package:job_app/src/layouts/private/app/enterprise/home/enterpirse_home.dart';
import 'package:job_app/src/layouts/private/app/enterprise/job/job_apply/apply_details.dart';

class JEnterpriseApplyScreen extends StatelessWidget {
  const JEnterpriseApplyScreen({super.key, required this.enterpriseID});

  final String enterpriseID;

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(EnterpriseApplyController(enterpriseID: enterpriseID));
    return Scaffold(
      appBar: JAppBar(
        title: Text('Đơn ứng tuyển',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: JColors.white)),
        showBackground: true,
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: JSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                if (controller.isLoading.value) return Container();
                if (controller.listApply.isEmpty) {
                  return Center(
                    child: Text(
                      'Chưa có đơn ứn tuyển',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  );
                }
                return JListCard(
                    itemCount: controller.listApply.length,
                    itemBuilder: (_, index) => JProfileApplyCard(
                          item: controller.listApply[index],
                          onPressed: () => Get.to(() => JApplyDetails(
                                profileID:
                                    controller.listApply[index].fProfileID,
                                job: controller.listApply[index].jobName,
                                applyID: controller.listApply[index].id,
                              )),
                        ));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
