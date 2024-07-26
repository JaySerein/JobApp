import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/sizes.dart';
import 'package:job_app/src/components/widgets/appbar/custom_appbar.dart';
import 'package:job_app/src/components/widgets/job_card/job_card.dart';
import 'package:job_app/src/components/widgets/notification/notificatio.dart';
import 'package:job_app/src/controllers/personal/job_invite_controller.dart';
import 'package:job_app/src/layouts/private/app/enterprise/home/enterpirse_home.dart';
import 'package:job_app/src/layouts/private/app/personal/invite/widgets/invite_details.dart';
import 'package:job_app/src/utils/helpers/helper_function.dart';

class PersonalInviteScreen extends StatelessWidget {
  const PersonalInviteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    final controller = Get.put(PersonalInviteController());
    return Scaffold(
        appBar: JAppBar(
          title: Text('Lời mời',
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
                if (controller.listInvite.isEmpty) {
                  return Center(
                    child: Text(
                      'Chưa có lời mời',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  );
                }
                return JListCard(
                  itemCount: controller.listInvite.length,
                  itemBuilder: (_, index) => JJobCardInvite(
                    onPressed: () => Get.to(() =>
                        JInviteDetails(invite: controller.listInvite[index])),
                    invite: controller.listInvite[index],
                  ),
                );
              }),
            ],
          ),
        ));
  }
}
