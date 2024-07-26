import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/notification/notificatio.dart';
import 'package:job_app/src/controllers/enterprise/enterprise_interview_controller.dart';
import 'package:job_app/src/layouts/private/app/enterprise/home/enterpirse_home.dart';
import 'package:job_app/src/layouts/private/app/enterprise/interview/widgets/interview_card.dart';
import 'package:job_app/src/layouts/private/app/enterprise/interview/widgets/interview_details.dart';

import 'package:job_app/src/utils/helpers/helper_function.dart';

class EnterpriseInterviewScreen extends StatelessWidget {
  const EnterpriseInterviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    final controller = Get.put(EnterpriseInterviewController());
    return Scaffold(
      appBar: JAppBar(
        title: Text('Phỏng vấn',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: JColors.white)),
        action: [JNotification(onPressed: () {}, iconColor: JColors.light)],
        showBackground: true,
      ),
      backgroundColor: dark ? JColors.dark : JColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: JSizes.defaultSpace),
        child: Column(
          children: [
            Obx(() {
              if (controller.isLoading.value) return Container();
              if (controller.listInterview.isEmpty) {
                return Center(
                  child: Text(
                    'Chưa có đơn phỏng vấn',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              }
              return JListCard(
                  itemCount: controller.listInterview.length,
                  itemBuilder: (_, index) => JInterviewCard(
                        item: controller.listInterview[index],
                        onPressedInterview: () =>
                            Get.to(() => JInterviewDetails(
                                  profileID: controller
                                      .listInterview[index].pProfileID,
                                  job: controller.listInterview[index].jobName,
                                  jobSuccessID:
                                      controller.listInterview[index].id,
                                )),
                        onPressedMessage: () {},
                      ));
            }),
          ],
        ),
      ),
    );
  }
}
