import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/notification/notificatio.dart';
import 'package:job_app/src/components/widgets/texts/section_heading.dart';
import 'package:job_app/src/controllers/enterprise/enterprise_job_controller.dart';
import 'package:job_app/src/layouts/private/app/enterprise/job/job_apply/emterprise_job_apply.dart';
import 'package:job_app/src/layouts/private/app/enterprise/job/widgets/enterpries_job_item.dart';
import 'package:job_app/src/layouts/private/app/enterprise/job/widgets/enterprise_job_create_form.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class EnterpriseJobScreen extends StatelessWidget {
  const EnterpriseJobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    final controller = Get.put(EnterpriseJobController());
    return Scaffold(
      appBar: JAppBar(
        title: Text('Tuyển dụng',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: JColors.white)),
        action: [JNotification(onPressed: () {}, iconColor: JColors.light)],
        showBackground: true,
      ),
      backgroundColor: dark ? JColors.dark : JColors.white,
      body: Column(
        children: [
          const SizedBox(height: JSizes.spaceBtwSections / 2),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: JSizes.defaultSpace),
            child: JSectionHeading(title: "Công việc tuyển dụng"),
          ),
          const SizedBox(height: JSizes.spaceBtwItems),
          Obx(() {
            if (controller.isLoading.value == true) return Container();
            if (controller.jobCount.value == 0)
              return Text("Chua co tuyen dung, hay them tuyen dung moi!");
            return Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.jobCount.value,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) => JJobCompany(
                    onPressed: () {},
                    job: controller.listJob[index],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: JSizes.defaultSpace, vertical: JSizes.sm),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                  onPressed: () => Get.to(() => const EnterpriseJobCreate()),
                  child: const Text("Tuyển dụng mới")),
            ),
            const SizedBox(
              width: JSizes.spaceBtwItems,
            ),
            Expanded(
              child: ElevatedButton(
                  onPressed: () => Get.to(() => JEnterpriseApplyScreen(
                        enterpriseID: controller.listJob.first.enterprise.id,
                      )),
                  child: const Text("Đơn ứng tuyển")),
            ),
          ],
        ),
      ),
    );
  }
}
